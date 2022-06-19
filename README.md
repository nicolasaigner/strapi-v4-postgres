# Strapi v4 com configuração para o banco de dados Postgres

## Motivação

Esse repositório faz parte de uma publicação no [Medium](https://medium.com/@nicolasaigner/strapi-4-com-postgres-no-docker-4a0b507e30c8) passando por um tutorial de como rodar em desenvolvimento o Strapi na versão 4.1.12 com um banco de dados Postgres diretamente no Docker, evitando assim instalar Node, NPM, Yarn e banco de dados no seu computador.

## Como rodar o projeto


## Configuração

Crie uma network para comunicação entre o banco e a aplicação

```
docker network create --driver bridge strapi-net
```

## Banco de dados

Inicie o banco de dados Postgres

```
docker run -d --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=strapi -e POSTGRES_HOST_AUTH_METHOD=trust --network strapi-net postgres:latest
```

## Rodando o projeto baixando a imagem do Docker Hub

Execute o comando para rodar o projeto com uma imagem base do Strapi publicada no [Docker Hub](https://hub.docker.com/repository/docker/nicolasaigner/strapi-v4-postgres)

| Nota: Verifique que no comando abaixo está sendo criada uma pasta do projeto na pasta atual e uma pasta chamada Strapi |
| --- |

```
docker run -d --name strapi -p 1337:1337 --network strapi-net -v ${PWD}/strapi/:/usr/src/app/ nicolasaigner/strapi-v4-postgres:latest

```

Com isso, você vai baixar a imagem que criei e publiquei, vai gerar uma pasta chamada strapi e vai começar a instalação do Strapi 4.1.12 com o Node na versão 16.0.0 e vai iniciar o Strapi em [localhost:1337](http://localhost:1337).

Você pode chegar esse processo verificando os logs do container

```
docker logs -f strapi
```

## Rodando o projeto baixando esse repositório

Faça um clone do projeto

```
git clone https://github.com/nicolasaigner/strapi-v4-postgres.git strapi
```

Acesse a pasta do projeto

```
cd strapi
```

Faça um build para gerar uma imagem no Docker

```
docker build --tag strapi:latest .
```

Quando finalizar, rode a imagem com o comando abaixo:

```
docker run -d --name strapi -p 1337:1337 --network strapi-net -v ${PWD}/:/usr/src/app/ strapi:latest
```

Caso o Strapi não inicie, verifique os logs do container usando o comando abaixo:

```
docker logs -f strapi
```

E verifique também se a pasta node_mdoules foi criada, se não foi criada, execute o comando abaixo:

```
docker container prune -f && docker run -d --name strapi -p 1337:1337 --network strapi-net -v ${PWD}/:/usr/src/app/ strapi:latest yarn
```

E depois execute novamnete o comando para rodar o container do Strapi, mas sem o comando yarn no final:

```
docker container prune -f && docker run -d --name strapi -p 1337:1337 --network strapi-net -v ${PWD}/:/usr/src/app/ strapi:latest
```

Com isso, você vai gerar o build com o nome strapi:latest o que vai gerar uma imagem. Com o comando de run do Docker, vai gerar uma pasta chamada strapi e vai começar a instalação do Strapi 4.1.12 com o Node na versão 16.0.0 e vai iniciar o Strapi em [localhost:1337](http://localhost:1337).

Você pode chegar esse processo verificando os logs do container

```
docker logs -f strapi
```

# Conclusão

Pronto, agora você tem um projeto do Strapi na versão 4 comunicando com o Postgres e com a pasta de todo o código no seu computador, case precise alterar algo no código ou algo do tipo.
