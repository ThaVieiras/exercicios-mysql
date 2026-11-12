USE DB_T05072C_Thais_Vieira;

-- Passo 1: Limpar e recriar as tabelas temporárias integrando departamento e salário
DROP TEMPORARY TABLE IF EXISTS temp_funcionario;
DROP TEMPORARY TABLE IF EXISTS temp_departamento;
DROP TEMPORARY TABLE IF EXISTS temp_faixas_salario;

CREATE TEMPORARY TABLE temp_departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nome_departamento VARCHAR(100) NOT NULL
);

CREATE TEMPORARY TABLE temp_faixas_salario (
    id_faixa INT PRIMARY KEY AUTO_INCREMENT,
    salario_min DECIMAL(10,2) NOT NULL,
    salario_max DECIMAL(10,2) NOT NULL,
    nivel_salarial VARCHAR(20) NOT NULL
);

CREATE TEMPORARY TABLE temp_funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome_funcionario VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    id_departamento INT NULL
);

-- Passo 2: Inserir os Departamentos (incluindo Vendas)
INSERT INTO temp_departamento (nome_departamento) VALUES 
('Recursos Humanos'), -- 1
('Tecnologia'),       -- 2
('Vendas'),           -- 3 (Departamento solicitado)
('Inovação');        -- 4

-- Passo 3: Inserir as Faixas Salariais
INSERT INTO temp_faixas_salario (salario_min, salario_max, nivel_salarial) VALUES
(0.00, 3000.00, 'Junior'),
(3000.01, 7000.00, 'Pleno'),
(7000.01, 99999.99, 'Senior');

-- Passo 4: Inserir Funcionários de teste
INSERT INTO temp_funcionario (nome_funcionario, salario, id_departamento) VALUES
('Ana Silva', 2500.00, 3),       -- Vendas (Junior) -> Não entra
('Carlos Oliveira', 4500.00, 3), -- Vendas (Pleno)  -> ENTRA NO RESULTADO!
('Mariana Souza', 6800.00, 3),   -- Vendas (Pleno)  -> ENTRA NO RESULTADO!
('Lucas Mendes', 9500.00, 3),    -- Vendas (Senior) -> Não entra
('Beatriz Costa', 5000.00, 2),   -- Tecnologia (Pleno) -> Não entra (depto diferente)
('Roberto Alves', 4200.00, 1);  -- RH (Pleno) -> Não entra (depto diferente)

-- Passo 5: Consulta SQL do Desafio 3 (JOIN em 3 tabelas + WHERE)
SELECT 
    f.nome_funcionario,
    d.nome_departamento,
    f.salario,
    fs.nivel_salarial
FROM temp_funcionario f
JOIN temp_departamento d 
  ON f.id_departamento = d.id_departamento
JOIN temp_faixas_salario fs 
  ON f.salario BETWEEN fs.salario_min AND fs.salario_max
WHERE d.nome_departamento = 'Vendas' 
  AND fs.nivel_salarial = 'Pleno';