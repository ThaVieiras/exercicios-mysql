USE DB_T05072C_Thais_Vieira;

-- Passo 1: Recriar/Atualizar a tabela temporária de funcionários com a coluna salario
DROP TEMPORARY TABLE IF EXISTS temp_funcionario;
DROP TEMPORARY TABLE IF EXISTS temp_faixas_salario;

CREATE TEMPORARY TABLE temp_funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome_funcionario VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

-- Passo 2: Criar a tabela temporária de faixas salariais
CREATE TEMPORARY TABLE temp_faixas_salario (
    id_faixa INT PRIMARY KEY AUTO_INCREMENT,
    salario_min DECIMAL(10,2) NOT NULL,
    salario_max DECIMAL(10,2) NOT NULL,
    nivel_salarial VARCHAR(20) NOT NULL
);

-- Passo 3: Inserir as faixas salariais (Junior, Pleno, Senior)
INSERT INTO temp_faixas_salario (salario_min, salario_max, nivel_salarial) VALUES
(0.00, 3000.00, 'Junior'),
(3000.01, 7000.00, 'Pleno'),
(7000.01, 99999.99, 'Senior');

-- Passo 4: Inserir funcionários com diferentes salários para teste
INSERT INTO temp_funcionario (nome_funcionario, salario) VALUES
('Ana Silva', 2500.00),      -- Junior
('Carlos Oliveira', 4500.00), -- Pleno
('Mariana Souza', 6800.00),   -- Pleno
('Lucas Mendes', 9500.00),    -- Senior
('Beatriz Costa', 2800.00),   -- Junior
('Roberto Alves', 12000.00);  -- Senior

-- Passo 5: Consulta SQL do Desafio 2 (JOIN não idêntica usando BETWEEN)
SELECT 
    f.nome_funcionario,
    f.salario,
    fs.nivel_salarial
FROM temp_funcionario f
JOIN temp_faixas_salario fs 
  ON f.salario BETWEEN fs.salario_min AND fs.salario_max
ORDER BY f.salario ASC;