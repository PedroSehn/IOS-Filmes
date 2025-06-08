# 📽️ IOS-Filmes

Aplicativo iOS em Swift que consome a API do **The Movie Database (TMDB)** para exibir categorias de filmes, detalhes e buscas em uma interface amigável.

---

## 🧭 Visão Geral

- Lista os filmes mais populares e/ou mais bem avaliados.
- Permite visualizar detalhes como sinopse, elenco e nota.
- Barra de pesquisa para encontrar títulos específicos.
- Usabilidade intuitiva via `UICollectionView` ou `UITableView`.

---

## 🚀 Funcionalidades

1. **Home** – Tela principal com os filmes em destaque.
2. **Detalhes do Filme** – Exibe sinopse, elenco, nota e pôster.
3. **Busca** – Campo para pesquisar qualquer filme.
4. **Recarregamento** – Pull-to-refresh para atualizar os dados.
5. *(Opcional)* Favoritos – Marcar e salvar filmes para assistir depois.

---

## 🧩 Tecnologias utilizadas

- **Swift 5**
- **UIKit**
- **Networking**: URLSession, Alamofire ou similares
- **Carregamento de Imagens**: Kingfisher, SDWebImage ou similar
- **JSON Parsing**: `Codable`
- **Persistência**: UserDefaults, Core Data ou Realm (para favoritos)

---

## 🛠️ Pré-requisitos

- Xcode 15+
- iOS 14+
- Conta gratuita no TMDB (https://www.themoviedb.org) para obter uma API key

---

## 📦 Instalação

```bash
git clone https://github.com/PedroSehn/IOS-Filmes.git
cd IOS-Filmes
