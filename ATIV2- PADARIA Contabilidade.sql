USE DB_T05072C_Thais_Vieira;
-- ATIVIDADE 2: PADARIA Contabilidade,
-- Criando a tabela de produtos da padaria
CREATE TABLE produto_padaria (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL
);

-- Inserindo registros para os testes
INSERT INTO produto_padaria (nome_produto, preco, quantidade_estoque) VALUES
('Pão Francês', 1.00, 100),
('Pão de Queijo', 3.50, 60),
('Pão Doce', 4.00, 25),
('Bolo de Cenoura', 12.00, 10),
('Bolo de Chocolate', 15.00, 13),
('Torta de Frango', 20.00, 5),
('Torta de Morango', 25.00, 7),
('Torta de Limão', 25.00, 9),
('Torta de Holandesa', 30.00, 12),
('Croissant', 7.00, 40),
('Croissant de Presunto e Queijo', 7.80, 50),
('Croissant de Chocolate', 8.50, 32),
('Sonho de Creme', 4.50, 18),
('Sonho de Doce de Leite', 5.50, 25);

-- Consultas
-- 1. Quais produtos têm preço acima de R$ 5,00?
SELECT * FROM produto_padaria WHERE preco > 5.00;

-- 2. Quais produtos possuem a palavra "Bolo" no nome?
SELECT * FROM produto_padaria WHERE nome_produto LIKE '%Bolo%';

-- 3. Quais produtos têm menos de 20 unidades no estoque?
SELECT * FROM produto_padaria WHERE quantidade_estoque < 20;

-- 4. Quais produtos custam entre R$ 3,00 e R$ 10,00?
SELECT * FROM produto_padaria WHERE preco BETWEEN 3.00 AND 10.00;

-- 5. Quais produtos têm nome que começa com "Pão"?
SELECT * FROM produto_padaria WHERE nome_produto LIKE 'Pão%';

-- 6. Qual é o comando para encontrar produtos com nome "Croissant" e que tenham mais de 30 unidades no estoque?
SELECT * FROM produto_padaria WHERE nome_produto LIKE '%Croissant%' AND quantidade_estoque > 30;