USE DB_T05072C_Thais_Vieira;

-- Desafio 1: Mapeamento de Departamentos 
-- Problema: O RG precisa de um relatório que liste TODOS os departamentos e quem trabalha em cada um. Lembre-se que o departaemnto "Inovação" ainda não tem funcionários.
-- Tarefa: Escreva a consulta SQL que gera este relatório. O nome do funcionário deve aparecer como NULL para o departamento sem funcionários.

-- Passo 1: Criar tabelas temporárias para o teste
CREATE TEMPORARY TABLE IF NOT EXISTS temp_departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nome_departamento VARCHAR(100) NOT NULL
);

CREATE TEMPORARY TABLE IF NOT EXISTS temp_funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome_funcionario VARCHAR(100) NOT NULL,
    id_departamento INT NULL
);

-- Passo 2: Inserção dos dados de teste
INSERT INTO temp_departamento (nome_departamento) VALUES 
('Recursos Humanos'),
('Logística'),
('Tecnologia'),
('Operações'),
('Compras'),
('Financeiro'),
('Inovação'); -- Ainda não tem funcionários

-- Passo 3: Inserção dos funcionários 
INSERT INTO temp_funcionario (nome_funcionario, id_departamento) VALUES 
('Ana Silva', 1),        -- Recursos Humanos
('Carlos Oliveira', 2),  -- Logística
('Mariana Souza', 2),    -- Logística
('Lucas Mendes', 3),     -- Tecnologia
('Beatriz Costa', 4),    -- Operações
('Roberto Alves', 5),    -- Compras
('Fernanda Lima', 6);    -- Financeiro

-- Passo 4: Consulta (LEFT JOIN)
SELECT 
    d.id_departamento,
    d.nome_departamento,
    f.nome_funcionario
FROM temp_departamento d
LEFT JOIN temp_funcionario f ON d.id_departamento = f.id_departamento
ORDER BY d.id_departamento ASC;