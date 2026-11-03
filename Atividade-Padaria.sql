-- Atividade: Padaria
-- 1. Criar as tabelas (Produto, Vendas, Fornecedor)
-- 2. Inserir pelo menos 5 valores em cada tabela
-- 3. Consultar todos os dados de cada tabela

USE DB_T05072C_Thais_Vieira;

-- Tabela Fornecedor da Padaria
CREATE TABLE padaria_fornecedor (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

-- Tabela Vendas Padaria
CREATE TABLE padaria_venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATE NOT NULL
);

-- Tabela Produtos da Padaria
CREATE TABLE padaria_produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES padaria_fornecedor(id_fornecedor)
);

-- Tabela Itens Vendidos na Padaria
CREATE TABLE itens_vendidos (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_venda INT,
    id_produto INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES padaria_venda (id_venda),
    FOREIGN KEY (id_produto) REFERENCES padaria_produtos (id_produto)
);

-- Inserindo 5 Fornecedores na Tabela Fornecedor da Padaria
INSERT INTO padaria_fornecedor (nome, telefone) VALUES 
('Farinha Sol', '(11) 98888-1111'),
('Laticínios da Casa', '(11) 98888-2222'),
('Distribuidora Sabor Doce', '(11) 98888-3333'),
('Embalagens Sustentável', '(11) 98888-4444'),
('Frutas & Frutinhas', '(11) 98888-5555');

-- Inserindo 5 vendas realizadas (Dia da Venda) na Tabela Vendas Padaria
INSERT INTO padaria_venda (data_venda) VALUES 
('2026-10-20'),
('2026-10-21'),
('2026-10-22'),
('2026-10-23'),
('2026-10-24');

-- Inserindo 5 Produtos na Tabela Produtos da Padaria (vinculando com o id_fornecedor)
INSERT INTO padaria_produtos (nome, preco, id_fornecedor) VALUES 
('Pão Francês', 0.80, 1),
('Queijo Mussarela', 5.50, 2),
('Bolo de Fubá', 12.00, 3),
('Bomba de Chocolate', 6.00, 1),
('Suco de Acerola', 7.50, 5);

-- Inserindo 5 itens na Tabela Itens Vendidos Padaria (vinculando id_venda e id_produto)
INSERT INTO itens_vendidos (id_venda, id_produto, quantidade, preco_unitario) VALUES 
(1, 1, 10, 0.80),
(1, 2, 2, 5.50),
(2, 3, 1, 12.00),
(3, 1, 15, 0.80),
(4, 4, 3, 6.00);

-- Consultar os fornecedores
SELECT * FROM padaria_fornecedor;

-- Consultar os produtos
SELECT * FROM padaria_produtos;

-- Consultar as vendas
SELECT * FROM padaria_venda;

-- Consultar os itens vendidos
SELECT * FROM itens_vendidos;
