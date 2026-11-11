-- Todos os arquivos apontando para mesma base 
USE DB_T05072C_Thais_Vieira;

-- agendanew.sql (NEW)

-- Tabela (Agenda) Categoria Contato
CREATE TABLE IF NOT EXISTS categoria_contato (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL
);

-- Tabela (Agenda)Contato
CREATE TABLE IF NOT EXISTS contato (
    id_contato INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria_contato(id_categoria)
);

-- Tabela (Agenda) Compromisso
CREATE TABLE IF NOT EXISTS compromisso (
    id_compromisso INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    data_hora_inicio DATETIME NOT NULL,
    local VARCHAR(100)
);

-- Tabela (Agenda) Compromisso Contato
CREATE TABLE IF NOT EXISTS compromisso_contato (
    id_compromisso INT NOT NULL,
    id_contato INT NOT NULL,
    PRIMARY KEY (id_compromisso, id_contato),
    FOREIGN KEY (id_compromisso) REFERENCES compromisso(id_compromisso),
    FOREIGN KEY (id_contato) REFERENCES contato(id_contato)
);