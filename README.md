# PROGRAMA FULL CYCLE DE ACELERAÇÃO

## Criando uma imagem node a partir do Dockerfile na raiz do projeto

```
docker build -t robsoni/pfa-node .
```

## Criando um container a partir da imagem
--name -> Informa qual será o nome do container
-d -> Modo detached, ou seja não prende o terminal
-v -> compartilha um volume, neste caso do diretório de execução do comando "$(pwd)" que executaremos na raiz do projeto com a pasta do container /usr/src/app

```
docker run --name pfa-node-container -d -v $(pwd):/usr/src/app robsoni/pfa-node
```

## Comando para entrar no container criado
Com este comando entramos no container e iniciamos uma aplicação node instalamos as dependencias do express e criamos um index.js com uma rota get

```
docker exec -it pfa-node-container bash

npm init

npm i express
```

## Rodando o container e executando o programa criado
Aqui subimos um container a partir da imagem que fizemos o build expondo a porta 3000 e executamos o programa criado com node index.js

```
docker run --name pfa-node-container -d -p 3000:3000 -v $(pwd):/usr/src/app robsoni/pfa-node

docker exec pfa-node-container node index.js
```

## Rodando aplicação node com proxy-reverso
Aqui criamos um Dockerfile do nginx na pasta nginx e um arquivo default.conf com as configurações do proxy-reverso.
Entre na pasta nginx e execute o comando abaixo para fazer o buid da imagem.

```
docker build -t robsoni/pfa-nginx .
```

Agora volte a raiz do projeto e crie uma rede para que o container do enginx e do node possam se comunicar.

```
docker network create pfa
```

Agora suba o container do node conforme o nome especificado no arquivo default.conf e informando a rede criada para ele, note que não precisamos expor a porta pois essa tarefa será do nginx.

```
docker run --name nodecontainer --rm --network=pfa -d -v $(pwd):/usr/src/app robsoni/pfa-node node index.js
```

Agora suba o container do nginx a partir da imagem que fizemos o build e informe a rede criada para ele e exponha a porta de acesso.

```
docker run --name nginx-proxy-reverso --rm --network=pfa -d -p 8080:80 robsoni/pfa-nginx
```