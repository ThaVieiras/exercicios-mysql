-- Todos os arquivos apontando para mesma base 
USE DB_T05072C_Thais_Vieira;

-- padarianew.sql (NEW)

-- Tabela Padaria Fornecedor
CREATE TABLE IF NOT EXISTS padaria_fornecedor (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

-- Tabela Padaria Produto
CREATE TABLE IF NOT EXISTS padaria_produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL DEFAULT 0,
    id_fornecedor INT NOT NULL,
    FOREIGN KEY (id_fornecedor) REFERENCES padaria_fornecedor(id_fornecedor)
);

-- Tabela (Padaria) Cliente
CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20)
);

-- Tabela (Padaria) Funcionário
CREATE TABLE IF NOT EXISTS funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    cpf VARCHAR(14) UNIQUE
);

-- Tabela Padaria Venda
CREATE TABLE IF NOT EXISTS padaria_venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_cliente INT NULL,
    id_funcionario INT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE IF NOT EXISTS itens_vendidos (
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_venda, id_produto),
    FOREIGN KEY (id_venda) REFERENCES padaria_venda(id_venda),
    FOREIGN KEY (id_produto) REFERENCES padaria_produto(id_produto)
);