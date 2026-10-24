import AppKit
// Le palavras (uma por linha) e devolve JSON {palavra: correcao} quando o
// corretor pt_BR acusa erro e uma sugestao difere SO no acento.
let sc = NSSpellChecker.shared
_ = sc.setLanguage("pt_BR")
func sem(_ s: String) -> String { s.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: Locale(identifier: "pt_BR")) }
var out: [String: String] = [:]
while let w = readLine() {
  let r = sc.checkSpelling(of: w, startingAt: 0, language: "pt_BR", wrap: false, inSpellDocumentWithTag: 0, wordCount: nil)
  if r.location == NSNotFound { continue }
  let g = sc.guesses(forWordRange: NSRange(location: 0, length: (w as NSString).length), in: w, language: "pt_BR", inSpellDocumentWithTag: 0) ?? []
  if let c = g.first(where: { sem($0) == sem(w) && $0.count == w.count }) {
    out[w] = w.first!.isUppercase && w.dropFirst().allSatisfy({ $0.isUppercase }) ? c.uppercased() : (w.first!.isUppercase ? c.prefix(1).uppercased() + c.dropFirst() : c.lowercased())
  }
}
FileHandle.standardOutput.write(try! JSONSerialization.data(withJSONObject: out, options: [.sortedKeys, .prettyPrinted]))
