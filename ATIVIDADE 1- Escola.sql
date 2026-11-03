USE DB_T05072C_Thais_Vieira;

-- Criar tabela aluno, tabela professor e tabela comentário

-- Tabela ALUNO
CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    sobrenome VARCHAR(60) NOT NULL,
    curso VARCHAR(100) NOT NULL
);

-- Tabela PROFESSOR
CREATE TABLE professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome_professor VARCHAR(100) NOT NULL,
    curso VARCHAR(100) NOT NULL
);

-- Tabela COMENTARIO
CREATE TABLE comentario (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_professor INT NOT NULL,
    comentario TEXT NOT NULL,
    notadoprofessor DECIMAL(3,1) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

-- Inserindo dados na tabela ALUNOS
INSERT INTO aluno (nome, sobrenome, curso) VALUES
('Lucas', 'Silva', 'Desenvolvimento Web'),
('Mariana', 'Oliveira', 'Banco de Dados'),
('Carlos', 'Santos', 'Análise e Desenvolvimento de Sistemas');

-- Inserindo professores
INSERT INTO professor (nome_professor, curso) VALUES
('Auro Aoki', 'Desenvolvimento Web'),
('Wilton Santos', 'Banco de Dados'),
('Karen Souza', 'Análise e Desenvolvimento de Sistemas');

-- Inserindo comentários e notas
INSERT INTO comentario (id_aluno, id_professor, comentario, notadoprofessor) VALUES
(1, 1, 'Excelente explicação sobre rotas e APIs.', 9.5),
(2, 2, 'Achei o ritmo da aula muito rápido.', 5.5),
(3, 1, 'Precisa detalhar mais os exercícios práticos.', 4.0),
(1, 2, 'Ótimo conteúdo de modelagem relacional.', 8.5);

-- 1. Listar todos os alunos e seus cursos
SELECT nome, sobrenome, curso 
FROM aluno;

-- 2. Listar todos os professores e cursos que lecionam
SELECT nome_professor, curso 
FROM professor;

-- 3. Listar comentários e notas dos alunos com nome do professor
SELECT c.comentario, c.notadoprofessor, p.nome_professor FROM comentario c JOIN professor p ON c.id_professor = p.id_professor;

-- 4. Listar comentários com nota abaixo de 6.0
SELECT comentario, notadoprofessor FROM comentario WHERE notadoprofessor < 6.0;

-- 5. Listar comentários com nota acima de 6.0
SELECT comentario, notadoprofessor FROM comentario WHERE notadoprofessor > 6.0;