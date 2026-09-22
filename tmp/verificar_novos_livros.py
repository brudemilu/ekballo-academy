from playwright.sync_api import sync_playwright


SLUGS = [
    "oito-maneiras-de-manter-o-diabo-debaixo-dos-seus-pes",
    "a-criacao-de-filhos-no-poder-do-evangelho",
    "ideologia-de-genero",
    "jesus-a-vida-completa",
    "que-bom-se-meu-marido-orasse-comigo",
    "o-que-voce-precisa-saber-sobre-batalha-espiritual",
    "servir-ou-ser-visto",
    "sexualidade-sem-censura",
    "tempestade-a-vista",
]


with sync_playwright() as p:
    browser = p.chromium.launch(headless=True)
    page = browser.new_page(viewport={"width": 1280, "height": 900})
    errors = []
    page.on("pageerror", lambda error: errors.append(str(error)))
    for slug in SLUGS:
        response = page.goto(f"http://127.0.0.1:3000/capas/{slug}.jpg")
        page.wait_for_load_state("networkidle")
        image = page.locator("img")
        assert response and response.status == 200, (slug, response.status if response else None)
        assert image.count() == 1 and image.evaluate("img => img.naturalWidth > 500"), slug
        print(f"OK capa {slug}")
    response = page.goto("http://127.0.0.1:3000/cursos/tempestade-a-vista")
    page.wait_for_load_state("networkidle")
    print(f"rota_curso={response.status if response else 'sem resposta'} url={page.url}")
    assert not errors, errors
    browser.close()
