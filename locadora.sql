-- Todos os arquivos apontando para mesma base 
USE DB_T05072C_Thais_Vieira;

-- locadoranew.sql (NEW)
-- Tabela Categoria
CREATE TABLE IF NOT EXISTS categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL,
    valor_diaria DECIMAL(10,2) NOT NULL
);

-- Tabela Veículo
CREATE TABLE IF NOT EXISTS veiculo (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

-- Adicionando coluna CNH na tabela cliente
ALTER TABLE cliente ADD COLUMN cnh VARCHAR(20) UNIQUE;

-- Tabela Locação
CREATE TABLE IF NOT EXISTS locacao (
    id_locacao INT PRIMARY KEY AUTO_INCREMENT,
    data_retirada DATE NOT NULL,
    data_devolucao DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    id_cliente INT NOT NULL,
    id_veiculo INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);

-- Tabela Manutenção
CREATE TABLE IF NOT EXISTS manutencao (
    id_manutencao INT PRIMARY KEY AUTO_INCREMENT,
    data_manutencao DATE NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    id_veiculo INT NOT NULL,
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);