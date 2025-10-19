# 🎬 Catálogo de Filmes

Aplicação Ruby on Rails para gerenciamento de catálogo de filmes com sistema de comentários.

## 🚀 Tecnologias

- Ruby 3.2.2
- Rails 7.1.2
- PostgreSQL
- Devise (autenticação)
- Kaminari (paginação)

## 📋 Funcionalidades

- ✅ Listagem pública de filmes
- ✅ Paginação (6 filmes por página)
- ✅ Detalhes completos dos filmes
- ✅ Sistema de comentários (anônimos e autenticados)
- ✅ CRUD completo de filmes
- ✅ Autenticação de usuários
- ✅ Recuperação de senha
- ✅ Autorização (apenas criador edita)

## 🛠️ Instalação Local
```bash
# Clone o repositório
git clone https://github.com/seu-usuario/movie-catalog.git
cd movie-catalog

# Instale as dependências
bundle install

# Configure o banco de dados
rails db:create db:migrate

# (Opcional) Popule com dados de exemplo
rails db:seed

# Inicie o servidor
rails server
```

Acesse: http://localhost:3000

## 🌐 Deploy

Aplicação disponível em: https://seu-app.onrender.com

## 👤 Autor

Seu Nome - [GitHub](https://github.com/seu-usuario)