CREATE DATABASE dbpfad1;

use dbpfad1;

CREATE TABLE IF NOT EXISTS modulo(id INT NOT NULL AUTO_INCREMENT, name VARCHAR(255), PRIMARY KEY(id));

INSERT INTO modulo(name) VALUES ('Docker');
INSERT INTO modulo(name) VALUES ('Fundamentos de Arquitetura de Software');
INSERT INTO modulo(name) VALUES ('Comunicação');
INSERT INTO modulo(name) VALUES ('RabbitMQ');
INSERT INTO modulo(name) VALUES ('Autenticação e Keycloak');
INSERT INTO modulo(name) VALUES ('Domain Driven Design e Arquitetura hexagonal');