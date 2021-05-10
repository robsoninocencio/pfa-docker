# Desafio 1 - Programa de Aceleração Docker - Full Cycle
### (Code Education)

[![Author](https://img.shields.io/badge/author-robsoninocencio-AD1256?style=flat-square)](https://github.com/wmcruz)
[![Languages](https://img.shields.io/github/languages/count/robsoninocencio/pfa-docker?color=%23AD1256&style=flat-square)](#)
![GitHub stars](https://img.shields.io/github/stars/robsoninocencio/pfa-docker?style=flat-square)
![GitHub forks](https://img.shields.io/github/forks/robsoninocencio/pfa-docker?style=flat-square)

# 📘 Descrição desafio 1
```
Crie um programa utilizando sua linguagem de programação favorita que faça uma listagem simples do nome de alguns módulos do curso Full Cycle os trazendo de um banco de dados MySQL. Gere a imagem desse container e a publique no DockerHub.

Gere uma imagem do nginx que seja capaz que receber as solicitações http e encaminhá-las para o container.

Crie um repositório no github com todo o fonte do programa e das imagens geradas.

Crie um arquivo README.md especificando quais comandos precisamos executar para que a aplicação funcione recebendo as solicitações na porta 8080 de nosso computador. Lembrando que NÃO utilizaremos Docker-compose nesse desafio.
```

# 💻 Comandos para executar
1 - Criação da rede
```
docker network create pfa-network
```

2 - Banco de Dados Mysql. 
```
docker run -d --rm --network=pfa-network --name pfa-mysql-d1 robsoni/pfa-mysql-d1
```
3 - App rest em Node
```
docker run -d --rm --network=pfa-network --name pfa-app-d1 robsoni/pfa-app-d1
```
4 - Servidor web de proxy reverso NGINX
```
docker run -d --rm --network=pfa-network --name nginx-proxy-reverso -p 8080:80 robsoni/pfa-ngix-d1
```

# 💻 Visualização
No seu navegador ou em sua ferramenta preferida para requisições de APIs REST solicite o seguinte endereço:
```
http://localhost:8080
```

# 💻 Tecnolgias utilizadas
node.js <br>
mysql <br>
nginx <br>

# 💻 Link das imagens no dockerhub
https://hub.docker.com/repository/docker/robsoni/pfa-mysql-d1
https://hub.docker.com/repository/docker/robsoni/pfa-app-d1
https://hub.docker.com/repository/docker/robsoni/pfa-ngix-d1