USE DB_T05072C_Thais_Vieira;
-- ATIVIDADE 2: Locadora de veículos

-- Tabela CLIENTE
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Tabela AUTOMOVEL
CREATE TABLE automovel (
    id_automovel INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    tipo VARCHAR(50) NOT NULL
);

-- Tabela LOCADORA_LOCACAO 
CREATE TABLE locadora_locacao (
    id_datalocacao INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_automovel INT NOT NULL,
    datainiciolocacao DATE NOT NULL,
    datafinallocacao DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_automovel) REFERENCES automovel(id_automovel)
);

-- Inserindo clientes
INSERT INTO cliente (nome, sobrenome, telefone, email) VALUES
('Janja', 'Silva', '(11) 98888-1111', 'thais@email.com'),
('Chico', 'Mendes', '(11) 97777-2222', 'lucas@email.com'),
('Erika', 'Hilton', '(11) 96666-3333', 'erikah@email.com'),
('Ana Elisa', 'Santos', '(11) 97777-4444', 'anaelisa@email.com'),
('André', 'Janones', '(11) 99999-5555', 'janones@email.com');

-- Inserindo automóveis
INSERT INTO automovel (marca, modelo, tipo) VALUES
('Toyota', 'Corolla', 'Sedan'),
('Chevrolet', 'Onix', 'Hatch'),
('Jeep', 'Compass', 'SUV'),
('Volkswagen', 'Nivus', 'SUV'),
('Nissan', 'Versa', 'Sedan'),
('Hyundai', 'HB20', 'Hatch');

-- Inserindo locações
INSERT INTO locadora_locacao (id_cliente, id_automovel, datainiciolocacao, datafinallocacao) VALUES
(1, 1, '2026-10-01', '2026-10-05'),
(2, 3, '2026-10-10', '2026-10-15'),
(3, 2, '2026-10-20', '2026-10-25');

-- 1. Consultar todos os clientes cadastrados.
SELECT * FROM cliente;

-- 2. Consultar todos os automóveis disponíveis.
SELECT * FROM automovel;

-- 3. Consultar informações sobre o cliente e o automóvel locado, incluindo a data de início e fim da locação, a marca e o modelo do automóvel.
SELECT c.nome, c.sobrenome, a.marca, a.modelo, l.datainiciolocacao, l.datafinallocacao FROM locadora_locacao l
JOIN cliente c ON l.id_cliente = c.id_cliente
JOIN automovel a ON l.id_automovel = a.id_automovel;

-- 4. Consultar informações sobre os automóveis locados em uma data específica, incluindo a marca e o modelo.
SELECT a.marca, a.modelo, l.datainiciolocacao, l.datafinallocacao FROM locadora_locacao l JOIN automovel a ON l.id_automovel = a.id_automovel
WHERE l.datainiciolocacao = '2026-10-01';
