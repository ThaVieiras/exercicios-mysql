USE DB_T05072C_Thais_Vieira;

-- ATIVIDADE 1 App Agenda
-- Tabela de Contatos 
CREATE TABLE contatos (
    id_contato INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Tabela de Grupos de Contato (Família, Trabalho, Amigos)
CREATE TABLE grupo_contato (
    id_grupo INT AUTO_INCREMENT PRIMARY KEY,
    nome_grupo VARCHAR(50) NOT NULL
);

-- Tabela intermediária de vínculo (associar contatos a grupos)
CREATE TABLE contato_grupo (
    id_contato INT NOT NULL,
    id_grupo INT NOT NULL,
    PRIMARY KEY (id_contato, id_grupo),
    FOREIGN KEY (id_contato) REFERENCES contatos(id_contato),
    FOREIGN KEY (id_grupo) REFERENCES grupo_contato(id_grupo)
);

-- Tabela de Telefones (permite mais de um número por contato)
CREATE TABLE telefones (
    id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(20) NOT NULL,
    tipo VARCHAR(20) NOT NULL, -- Ex: Celular, Trabalho, Residencial
    id_contato INT NOT NULL,
    FOREIGN KEY (id_contato) REFERENCES contatos(id_contato)
);

-- Inserindo em Contatos 
INSERT INTO contatos (nome, email) VALUES
('Pedro', 'pedro.silva@email.com'),
('Ana', 'ana.souza@email.com'),
('Carlos', 'carlos.oliveira@email.com'),
('Mariana', 'mariana.santos@email.com'),
('Lucas', 'lucas.lima@email.com'),
('Beatriz', 'beatriz.almeida@email.com'),
('Gabriel', 'gabriel.costa@email.com'),
('Fernanda', 'fernanda.rocha@email.com'),
('Rafael', 'rafael.martins@email.com'),
('Juliana', 'juliana.ribeiro@email.com'),
('Diego', 'diego.carvalho@email.com'),
('Camila', 'camila.gomes@email.com'),
('Thiago', 'thiago.mendes@email.com'),
('Larissa', 'larissa.barros@email.com'),
('Bruno', 'bruno.freitas@email.com'),
('Amanda', 'amanda.cardoso@email.com'),
('Rodrigo', 'rodrigo.teixeira@email.com'),
('Letícia', 'leticia.moraes@email.com'),
('Vinícius', 'vinicius.melo@email.com'),
('Patricia', 'patricia.cavalcanti@email.com'),
('Felipe', 'felipe.dias@email.com'),
('Vanessa', 'vanessa.ramos@email.com'),
('Gustavo', 'gustavo.marques@email.com'),
('Renata', 'renata.araujo@email.com'),
('Eduardo', 'eduardo.borges@email.com');

-- Inserindo Grupos de Contato
INSERT INTO grupo_contato (nome_grupo) VALUES
('Família'),
('Trabalho'),
('Amigos'),
('Faculdade'),
('Serviços');

-- Vinculando os Contatos aos Grupos (Tabela Intermediária)
INSERT INTO contato_grupo (id_contato, id_grupo) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 1), (7, 2), (8, 3), (9, 4), (10, 5),
(11, 1), (12, 2), (13, 3), (14, 4), (15, 5),
(16, 1), (17, 2), (18, 3), (19, 4), (20, 5),
(21, 1), (22, 2), (23, 3), (24, 4), (25, 5);

-- Inserindo Telefones para os Contatos (vários contatos com mais de 1 número)
INSERT INTO telefones (numero, tipo, id_contato) VALUES
-- Telefones do Pedro (ID 1)
('(11) 99999-1111', 'Celular', 1),
('(11) 3333-2222', 'Trabalho', 1),

-- Telefones da Ana (ID 2)
('(11) 98888-2222', 'Celular', 2),

-- Telefones do Carlos (ID 3)
('(11) 97777-3333', 'Celular', 3),
('(11) 3444-5555', 'Residencial', 3),

-- Telefones da Mariana (ID 4)
('(11) 96666-4444', 'Celular', 4),

-- Telefones do Lucas (ID 5)
('(11) 95555-5555', 'Celular', 5),
('(11) 3222-1111', 'Trabalho', 5),

-- Demais telefones dos contatos
('(11) 94444-6666', 'Celular', 6),
('(11) 93333-7777', 'Celular', 7),
('(11) 92222-8888', 'Celular', 8),
('(11) 91111-9999', 'Celular', 9),
('(11) 90000-0000', 'Celular', 10),
('(11) 98111-1234', 'Celular', 11),
('(11) 98222-2345', 'Celular', 12),
('(11) 98333-3456', 'Celular', 13),
('(11) 98444-4567', 'Celular', 14),
('(11) 98555-5678', 'Celular', 15),
('(11) 98666-6789', 'Celular', 16),
('(11) 98777-7890', 'Celular', 17),
('(11) 98888-8901', 'Celular', 18),
('(11) 98999-9012', 'Celular', 19),
('(11) 99000-0123', 'Celular', 20),
('(11) 99111-1234', 'Celular', 21),
('(11) 99222-2345', 'Celular', 22),
('(11) 99333-3456', 'Celular', 23),
('(11) 99444-4567', 'Celular', 24),
('(11) 99555-5678', 'Celular', 25);

-- Consultar tabelas
SELECT * FROM contatos;
SELECT * FROM grupo_contato;
SELECT * FROM telefones;

-- SELECT selecionando somente a coluna nome
SELECT nome FROM contatos;

-- Criar uma consulta usando WHERE nome = 'Pedro'
SELECT * FROM contatos WHERE nome = 'Pedro';