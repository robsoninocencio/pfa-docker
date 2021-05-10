FROM mysql:5.7

ENV MYSQL_ROOT_PASSWORD=root

COPY ./init.sql /docker-entrypoint-initdb.d/

# docker build -t robsoni/pfa-mysql-d1 .
# docker push robsoni/pfa-mysql-d1
