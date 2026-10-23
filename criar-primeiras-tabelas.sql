CREATE DATABASE DB_T05072C_Thais_Vieira;
USE DB_T05072C_Thais_Vieira;
-- CRIANDO A PRIMEIRA TABELA NA BASE DE DADOS 
CREATE TABLE Cliente(
	id_cliente int primary key AUTO_INCREMENT,
    nome_cliente VARCHAR(100) not null,
    telefone VARCHAR(30) not null,
    email VARCHAR(100) not null
);

-- CRIANDO A TABELA PRODUTO
CREATE TABLE Produto(
	id_produto int primary key AUTO_INCREMENT,
    nome_produto VARCHAR(100) not null,
    tipo_produto VARCHAR(100) not null,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL
);

-- COMANDO PAR MOSTRAR AS TABELAS CRIADAS
SHOW tables;

-- CRIANDO TABELA PEDIDOS
CREATE TABLE Pedido(
	id_pedido int primary key AUTO_INCREMENT,
    valor_total DECIMAL(10, 2) not null,
    quantidade DECIMAL(10, 2) not null,
    id_cliente int,
    id_produto int,
    forma_pagamento VARCHAR(50) not null,
    FOREIGN KEY(id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY(id_produto) REFERENCES Produto(id_produto)
);

CREATE TABLE Contatos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

INSERT INTO Contatos (nome, telefone) VALUES 
('Lula', '(11) 98765-4321'),
('Janja', '(11) 91234-5678'),
('Geraldo', '(21) 99999-8888');

-- Visualizar os dados da tabela
SELECT * FROM Contatos;

-- Filtro
SELECT * FROM Contatos WHERE nome = 'Janja';

-- Ordenação Decrescente
SELECT * FROM Contatos ORDER BY nome DESC;

-- Filtro com LIKE
SELECT * FROM Contatos 
WHERE telefone LIKE '(11)%';

-- UPDATE
UPDATE Contatos 
SET telefone = '(21) 90000-0000' 
WHERE id = 1;

-- CRIANDO TABELA MENSAGENS
CREATE TABLE Mensagens (
    id INT PRIMARY KEY AUTO_INCREMENT,
    texto TEXT NOT NULL,
    data_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_contato INT NOT NULL,
    FOREIGN KEY (id_contato) REFERENCES Contatos(id)
);

-- Visualizar tabela MENSAGENS
SELECT * FROM Mensagens;

-- INSERT de mensagens 
-- id 1 (Lula), id 2 (Janja), id 3 (Geraldo)
INSERT INTO Mensagens (texto, id_contato) VALUES 
('Olá, gostaria de saber o preço do produto X.', 1),
('Meu pedido ainda não chegou, podem ajudar?', 2),
('Obrigado pelo excelente atendimento!', 3);

-- JOIN
SELECT Contatos.nome, Mensagens.texto, Mensagens.data_envio
FROM Mensagens
JOIN Contatos ON Mensagens.id_contato = Contatos.id;