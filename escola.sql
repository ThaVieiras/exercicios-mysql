-- Todos os arquivos apontando para mesma base 
USE DB_T05072C_Thais_Vieira;

-- escolanew.sql (NEW)

-- Tabela Professor
CREATE TABLE IF NOT EXISTS professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(14) NOT NULL UNIQUE,
    especialidade VARCHAR(50)
);

-- Tabela Disciplina
CREATE TABLE IF NOT EXISTS disciplina (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome_disciplina VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    id_professor INT NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

-- Tabela Turma
CREATE TABLE IF NOT EXISTS turma (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    nome_turma VARCHAR(50) NOT NULL,
    ano_letivo INT NOT NULL,
    periodo VARCHAR(20) NOT NULL,
    id_disciplina INT NOT NULL,
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina)
);

-- Tabela Aluno
CREATE TABLE IF NOT EXISTS aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    matricula_codigo VARCHAR(20) NOT NULL UNIQUE
);

-- Tabela Matrícula
CREATE TABLE IF NOT EXISTS matricula (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    data_matricula DATE NOT NULL,
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
);

-- Tabela Boletim Nota
CREATE TABLE IF NOT EXISTS boletim_nota (
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
    valor_nota DECIMAL(4,2) NOT NULL,
    tipo_avaliacao VARCHAR(30) NOT NULL,
    frequencia INT NOT NULL,
    id_matricula INT NOT NULL,
    FOREIGN KEY (id_matricula) REFERENCES matricula(id_matricula)
);