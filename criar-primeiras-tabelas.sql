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
