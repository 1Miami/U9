CREATE DATABASE Exercicio2;

CREATE TABLE ALUNO (
    aluno_id INT PRIMARY KEY,
    nome VARCHAR(100),
    curso VARCHAR(100),
    nivel VARCHAR(50),
    idade INT
);

CREATE TABLE TURMA (
    turma_id INT PRIMARY KEY,
    nometurma VARCHAR(100),
    sala VARCHAR(50),
    horario VARCHAR(50)
);

CREATE TABLE MATRICULA (
    matricula_id INT PRIMARY KEY,
    aluno_id INT,
    turma_id INT,
    nota_1 FLOAT,
    nota_2 FLOAT,
    nota_3 FLOAT,
    nota_final FLOAT,
    nr_faltas INT,
    FOREIGN KEY (aluno_id) REFERENCES ALUNO(aluno_id),
    FOREIGN KEY (turma_id) REFERENCES TURMA(turma_id)
);


INSERT INTO ALUNO (aluno_id, nome, curso, nivel, idade) VALUES
(1, 'Dick Vigarista', 'Engenharia Mecânica', 'Graduação', 25),
(2, 'Penélope Charmosa', 'Arquitetura', 'Graduação', 23),
(3, 'Barney Rubble', 'Administração', 'Graduação', 27),
(4, 'Zé Colmeia', 'Turismo', 'Graduação', 30),
(5, 'Muttley', 'Engenharia Elétrica', 'Graduação', 22),
(6, 'Papai Smurf', 'Ciência da Computação', 'Pós-graduação', 35);


INSERT INTO TURMA (turma_id, nometurma, sala, horario) VALUES
(10, 'Introdução à Engenharia Mecânica', 'Sala 101', 'Segunda e Quarta, 08:00-10:00'),
(20, 'Projeto Arquitetônico', 'Sala 202', 'Terça e Quinta, 10:00-12:00'),
(30, 'Gestão Empresarial', 'Sala 303', 'Segunda e Sexta, 14:00-16:00'),
(40, 'Turismo Sustentável', 'Sala 404', 'Quarta e Sexta, 09:00-11:00'),
(50, 'Programação Avançada', 'Sala 505', 'Terça e Quinta, 14:00-16:00');


INSERT INTO MATRICULA (matricula_id, aluno_id, turma_id, nota_1, nota_2, nota_3, nota_final, nr_faltas) VALUES
(101, 1, 30, 8.5, 7.8, 9.2, 8.5, 2),
(102, 2, 20, 9.0, 8.7, 9.5, 9.2, 1),
(103, 3, 40, 7.8, 8.0, 7.5, 7.8, 3),
(104, 4, 40, 6.5, 7.0, 6.8, 6.8, 4),
(105, 5, 50, 8.0, 8.5, 8.7, 8.4, 1),
(106, 6, 10, 9.5, 9.8, 9.0, 9.4, 0);

-- 1. Quais os nomes de todos os alunos?
SELECT nome FROM ALUNO;

-- 2. Quais os números das matrículas dos alunos?
SELECT aluno_id FROM ALUNO;

-- 3. Quais os números das matrículas dos alunos que não estão matriculados em uma turma? 
SELECT M.aluno_id 
FROM MATRÍCULA M 
LEFT JOIN TURMA T ON M.turma_id = T.turma_id 
WHERE T.turma_id IS NULL;

-- 4. Quais os números dos alunos matriculados em uma turma de número '30'?
SELECT aluno_id 
FROM MATRÍCULA 
WHERE turma_id = (SELECT turma_id FROM TURMA WHERE nometurma = '30');

-- 5. Qual o horário da turma do aluno 'Dick Vigarista'?
SELECT T.horario 
FROM TURMA T 
JOIN MATRÍCULA M ON T.turma_id = M.turma_id 
JOIN ALUNO A ON M.aluno_id = A.aluno_id 
WHERE A.nome = 'Dick Vigarista';

-- 6. Quais os nomes dos alunos matriculados em uma turma de número '30'?
SELECT A.nome 
FROM ALUNO A 
JOIN MATRÍCULA M ON A.aluno_id = M.aluno_id 
JOIN TURMA T ON M.turma_id = T.turma_id 
WHERE T.nometurma = '30';

-- 7. Quais os nomes dos alunos que não estão matriculados na turma de número '30'?
SELECT A.nome 
FROM ALUNO A 
LEFT JOIN MATRÍCULA M ON A.aluno_id = M.aluno_id 
LEFT JOIN TURMA T ON M.turma_id = T.turma_id 
WHERE T.turma_id IS NULL OR T.nometurma != '30';

-- 8. Quais os nomes das turmas com alunos com nota final maior que 8?
SELECT DISTINCT T.nometurma 
FROM TURMA T 
JOIN MATRÍCULA M ON T.turma_id = M.turma_id 
WHERE M.nota_final > 8;

