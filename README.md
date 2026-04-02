## Projeto Ruby on Rails via Docker

Comando para montarmos um docker compose com os containers de Rails, PostgreSQL Sidekiq e Redis:

**docker-compose build**

Comando para executar os containers:

**docker-compose up**

Execute esses comandos no terminal pra finalizar o processo da criação do banco e geração da estrutura  de testes do RSpec:

**docker exec -it moke_ror_on_docker-web-1 bash**

**rails db:create**

**rails generate rspec:install**

**rails db:migrate db:test:prepare**

Comando para executar os testes automatizados do RSpec(dentro do container moke_ror_on_docker-web-1):

**rspec**

Caso der o erro(403), utilize a variavel de ambiente de teste:

**RAILS_ENV=test**

Executar o projeto no browser(abra este link em alguma aba): **http://localhost:3000**

Link da documentação Api: **http://localhost:3000/api-docs/index.html**