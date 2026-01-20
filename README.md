# Desafio para Desenvolvedor Júnior

Este projeto implementa uma aplicação completa de troca de mensagens, com backend em Rails API e frontend em Vue.js, atendendo aos requisitos do desafio de desenvolvedor júnior.

## Funcionalidades
- Cadastro e login de usuários.
- Envio e recebimento de mensagens entre usuários.
- Interface web para interação.
- Autenticação JWT segura.
- Processamento assíncrono de mensagens (envio de emails).

## Tecnologias Utilizadas
- **Backend**: Ruby on Rails 8 (API-only), PostgreSQL, JWT para autenticação, Solid Queue para jobs assíncronos, ActionCable para WebSocket (potencial).
- **Frontend**: Vue.js 3, Axios para requisições HTTP.
- **Outros**: bcrypt para senhas, rack-cors para CORS, Vite para build do frontend.

## Pré-requisitos
- Ruby 3.3+ e Rails 8 (instale via rbenv ou similar).
- Node.js 18+ e npm.
- PostgreSQL (configure no `config/database.yml`).

## Diferenciais Implementados
- Autenticação JWT.
- Processamento assíncrono de mensagens (envio de email via mailer e jobs).
- Paginação na listagem de mensagens (usando kaminari).
- Endpoint de métricas (/metrics) com estatísticas sobre mensagens enviadas e usuários ativos.

## Configuração e Execução

### Backend (Rails)
1. Instale as dependências: `bundle install`
2. Configure o banco: `rails db:create && rails db:migrate && rails db:seed`
3. Execute o servidor: `rails s` (porta 3000)

## Endpoints da API
- `POST /register`: Criar usuário (body: { "user": { "email": "...", "password": "...", "password_confirmation": "..." } })
- `POST /login`: Login (body: { "email": "...", "password": "..." }) - retorna token JWT.
- `POST /messages`: Enviar mensagem (autenticado, body: { "message": { "receiver_email": "...", "content": "..." } })
- `GET /messages/:user_id`: Listar mensagens do usuário (autenticado, ex.: /messages/1) - com paginação (?page=1&per_page=10).
- `GET /metrics`: Estatísticas (total mensagens, usuários ativos nos últimos 30 dias).

## Testes
- Use Postman para testar a API.
- Ou execute o frontend e teste a interface.
- Usuários de exemplo: `user1@example.com` e `user2@example.com` (senha: `password123`).

## Observações
- Para produção, configure variáveis de ambiente (ex.: JWT secret em `credentials.yml.enc`).
- O projeto segue boas práticas: separação de responsabilidades, validações, segurança.

## Como Contribuir
1. Faça fork do repositório.
2. Crie uma branch para sua feature.
3. Commit suas mudanças.
4. Abra um Pull Request.
