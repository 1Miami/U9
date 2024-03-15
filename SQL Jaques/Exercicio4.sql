CREATE DATABASE Exercicio4;

CREATE TABLE TURMA (
    turma_id INT PRIMARY KEY,
    codigo_disciplina VARCHAR(50),
    sigla_turma VARCHAR(10),
    ano_semestre VARCHAR(10)
);

CREATE TABLE ALUNO (
    aluno_id INT PRIMARY KEY,
    nome_aluno VARCHAR(100)
);

CREATE TABLE PROVA (
    prova_id INT PRIMARY KEY,
    turma_id INT,
    numero_prova INT,
    data_prova DATE,
    FOREIGN KEY (turma_id) REFERENCES TURMA(turma_id)
);

CREATE TABLE NOTA (
    nota_id INT PRIMARY KEY,
    aluno_id INT,
    prova_id INT,
    nota FLOAT,
    FOREIGN KEY (aluno_id) REFERENCES ALUNO(aluno_id),
    FOREIGN KEY (prova_id) REFERENCES PROVA(prova_id)
);

INSERT INTO TURMA (turma_id, codigo_disciplina, sigla_turma, ano_semestre) VALUES
(1, 'MAT101', 'A', '2023/1'),
(2, 'ENG201', 'B', '2023/2'),
(3, 'FIS301', 'C', '2024/1');

INSERT INTO ALUNO (aluno_id, nome_aluno) VALUES
(1, 'João'),
(2, 'Maria'),
(3, 'Carlos'),
(4, 'Ana');

INSERT INTO PROVA (prova_id, turma_id, numero_prova, data_prova) VALUES
(101, 1, 1, '2023-03-10'),
(102, 1, 2, '2023-04-15'),
(103, 2, 1, '2023-09-20'),
(104, 2, 2, '2023-10-25'),
(105, 3, 1, '2024-02-12'),
(106, 3, 2, '2024-03-18');

INSERT INTO NOTA (nota_id, aluno_id, prova_id, nota) VALUES
(201, 1, 101, 8.5),
(202, 1, 102, 7.8),
(203, 2, 101, 9.0),
(204, 2, 102, 8.7),
(205, 3, 103, 7.5),
(206, 3, 104, 8.0),
(207, 4, 105, 6.8),
(208, 4, 106, 7.0);
