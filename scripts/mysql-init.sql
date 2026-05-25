CREATE DATABASE IF NOT EXISTS empresa;

USE empresa;

DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL
);

INSERT INTO usuarios (nome, email) VALUES
('Maria Silva', 'maria@email.com'),
('Joao Souza', 'joao@email.com'),
('Ana Lima', 'ana@email.com');

SELECT * FROM usuarios;
