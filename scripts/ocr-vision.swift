import Foundation
import Vision
import AppKit
// uso: ocr <imagem> -> JSON [{t, x0, y0, x1, y1, c}] (origem no topo, 0..1).
// Cada linha do Vision e partida onde ha um vao largo entre palavras: a caixa
// lateral na mesma altura do texto vem fundida numa linha so.
let url = URL(fileURLWithPath: CommandLine.arguments[1])
guard let img = NSImage(contentsOf: url), let cg = img.cgImage(forProposedRect: nil, context: nil, hints: nil) else { exit(1) }
let req = VNRecognizeTextRequest()
req.recognitionLevel = .accurate
req.recognitionLanguages = ["pt-BR"]
req.usesLanguageCorrection = true
try VNImageRequestHandler(cgImage: cg, options: [:]).perform([req])
var out: [[String: Any]] = []
for o in req.results ?? [] {
  guard let c = o.topCandidates(1).first else { continue }
  let s = c.string
  var palavras: [(String, CGRect)] = []
  var i = s.startIndex
  while i < s.endIndex {
    while i < s.endIndex && s[i] == " " { i = s.index(after: i) }
    if i >= s.endIndex { break }
    var j = i
    while j < s.endIndex && s[j] != " " { j = s.index(after: j) }
    if let r = try? c.boundingBox(for: i..<j) { palavras.append((String(s[i..<j]), r.boundingBox)) }
    i = j
  }
  if palavras.isEmpty { continue }
  var grupo: [(String, CGRect)] = []
  func emitir() {
    guard !grupo.isEmpty else { return }
    let x0 = grupo.map { $0.1.minX }.min()!, x1 = grupo.map { $0.1.maxX }.max()!
    let y0 = grupo.map { $0.1.minY }.min()!, y1 = grupo.map { $0.1.maxY }.max()!
    out.append(["t": grupo.map { $0.0 }.joined(separator: " "), "x0": x0, "x1": x1, "y0": 1 - y1, "y1": 1 - y0, "c": c.confidence])
    grupo = []
  }
  for p in palavras {
    if let u = grupo.last, p.1.minX - u.1.maxX > 0.035 { emitir() }
    grupo.append(p)
  }
  emitir()
}
FileHandle.standardOutput.write(try JSONSerialization.data(withJSONObject: out))
