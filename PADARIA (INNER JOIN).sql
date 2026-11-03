USE DB_T05072C_Thais_Vieira;

-- ATIVIDADE 1: PADARIA (INNER JOIN)
-- Exibir o nome dos produtos e o nome do fornecedor de cada um
SELECT p.nome AS nome_produto, f.nome AS nome_fornecedor FROM padaria_produto p
INNER JOIN padaria_fornecedor f ON p.id_fornecedor = f.id_fornecedor;

-- Listar os produtos vendidos com suas quantidades e data da venda
SELECT p.nome AS nome_produto, iv.quantidade, v.data_venda FROM itens_vendidos iv
INNER JOIN padaria_produto p ON iv.id_produto = p.id_produto
INNER JOIN padaria_venda v ON iv.id_venda = v.id_venda;

-- Ver o nome do produto, valor total da venda e nome do fornecedor
SELECT p.nome AS nome_produto, (iv.quantidade * iv.preco_unitario) AS valor_total, f.nome AS nome_fornecedor FROM itens_vendidos iv
INNER JOIN padaria_produto p ON iv.id_produto = p.id_produto
INNER JOIN padaria_venda v ON iv.id_venda = v.id_venda
INNER JOIN padaria_fornecedor f ON p.id_fornecedor = f.id_fornecedor;

-- Exibir produtos com estoque abaixo de 30 unidades e seus fornecedores
SELECT p.nome AS nome_produto, f.nome AS nome_fornecedor FROM padaria_produto p
INNER JOIN padaria_fornecedor f ON p.id_fornecedor = f.id_fornecedor;



-- 1. INSERINDO FORNECEDORES (padaria_fornecedor)
INSERT INTO padaria_fornecedor (nome, telefone) VALUES
('Moinho Trigo de Ouro', '(11) 98888-1111'),      -- ID 1 (Pães)
('Laticínios Vale Fresco', '(11) 97777-2222'),    -- ID 2 (Queijos / Croissants)
('Doces & Cia Distribuidora', '(11) 96666-3333'), -- ID 3 (Bolos e Sonhos)
('Confeitaria Express', '(11) 95555-4444');       -- ID 4 (Tortas)

-- INSERINDO PRODUTOS (padaria_produto com id_fornecedor)
INSERT INTO padaria_produto (nome, preco, id_fornecedor) VALUES
('Pão Francês', 1.00, 1),
('Pão de Queijo', 3.50, 2),
('Pão Doce', 4.00, 1),
('Bolo de Cenoura', 12.00, 3),
('Bolo de Chocolate', 15.00, 3),
('Torta de Frango', 20.00, 4),
('Torta de Morango', 25.00, 4),
('Torta de Limão', 25.00, 4),
('Torta Holandesa', 30.00, 4),
('Croissant Simples', 7.00, 2),
('Croissant de Presunto e Queijo', 7.80, 2),
('Croissant de Chocolate', 8.50, 2),
('Sonho de Creme', 4.50, 3),
('Sonho de Doce de Leite', 5.50, 3);

-- INSERINDO VENDAS (padaria_venda)
INSERT INTO padaria_venda (data_venda) VALUES
('2026-10-15'), -- ID 1
('2026-10-17'), -- ID 2
('2026-10-18'), -- ID 3
('2026-10-20'), -- ID 4
('2026-10-21'), -- ID 5
('2026-10-23'), -- ID 6
('2026-10-25'), -- ID 7
('2026-10-26'), -- ID 8
('2026-10-27'), -- ID 9
('2026-10-28'), -- ID 10
('2026-10-29'), -- ID 11
('2026-10-30'), -- ID 12
('2026-10-31'), -- ID 13
('2026-11-01'), -- ID 14
('2026-11-03'); -- ID 15

-- Apaguei a estrutura antiga com o nome errado :/
DROP TABLE IF EXISTS itens_vendidos;

-- Crei outra tabela de Itens Vendidos
CREATE TABLE itens_vendidos (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_venda INT,
    id_produto INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES padaria_venda (id_venda),
    FOREIGN KEY (id_produto) REFERENCES padaria_produto (id_produto)
);

-- Inserindo os itens com 15 vendas realizadas
INSERT INTO itens_vendidos (id_venda, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 15, 1.00), (1, 2, 3, 3.50),
(2, 4, 1, 12.00), (2, 13, 2, 4.50),
(3, 7, 1, 25.00), (3, 11, 2, 7.80),
(4, 5, 1, 15.00), (4, 12, 3, 8.50),
(5, 3, 5, 4.00), (5, 2, 4, 3.50),
(6, 6, 1, 20.00), (6, 1, 20, 1.00),
(7, 9, 1, 30.00), (7, 14, 2, 5.50),
(8, 10, 4, 7.00), (8, 8, 1, 25.00),
(9, 1, 30, 1.00), (9, 3, 4, 4.00),
(10, 2, 6, 3.50), (10, 13, 3, 4.50),
(11, 5, 2, 15.00), (11, 11, 3, 7.80),
(12, 4, 1, 12.00), (12, 7, 1, 25.00),
(13, 12, 5, 8.50), (13, 14, 4, 5.50),
(14, 1, 25, 1.00), (14, 6, 1, 20.00),
(15, 2, 10, 3.50), (15, 9, 1, 30.00);