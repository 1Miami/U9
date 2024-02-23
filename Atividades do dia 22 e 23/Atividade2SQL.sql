CREATE DATABASE IF NOT EXISTS exTWO;
USE exTWO;

CREATE TABLE CLIENTE(
    nrcliente tinyint not null primary key,
    nomecliente varchar(60) not null,
    cidade varchar(120) not null,
    tipo varchar(60) not null
);

CREATE TABLE ALUNO(
    aluno_id tinyint not null primary key,
    nome varchar(60) not null,
    curso varchar(60) not null,
    nível tinyint not null,
    idade tinyint not null
);

CREATE TABLE TURMA(
    turma_id tinyint not null primary key,
    nometurma varchar(60) not null,
    sala tinyint not null,
    horário time not null
);

CREATE TABLE MATRICULA(
    matricula_id tinyint not null primary key,
    aluno_id tinyint not null,
    turma_id tinyint not null,
    nota_1 tinyint not null,
    nota_2 tinyint not null,
    nota_3 tinyint not null,
    nota_final tinyint not null,
    numerofaltas tinyint not null
);

ALTER TABLE MATRICULA
MODIFY COLUMN turma_id tinyint,
MODIFY COLUMN nota_1 tinyint,
MODIFY COLUMN nota_2 tinyint,
MODIFY COLUMN nota_3 tinyint,
MODIFY COLUMN nota_final tinyint,
MODIFY COLUMN numerofaltas tinyint;

INSERT INTO ALUNO (aluno_id, nome, curso, nível, idade) VALUES
(1, 'João Silva', 'Engenharia', 1, 20),
(2, 'Maria Oliveira', 'Medicina', 2, 22),
(3, 'Carlos Santos', 'Administração', 1, 21),
(4, 'Ana Pereira', 'Ciência da Computação', 3, 23),
(5, 'Lucas Rodrigues', 'Direito', 2, 22);

INSERT INTO TURMA (turma_id, nometurma, sala, horário) VALUES
(1, 'Turma A', 101, '08:00:00'),
(2, 'Turma B', 102, '10:30:00'),
(3, 'Turma C', 103, '14:00:00'),
(4, 'Turma D', 104, '16:30:00'),
(5, 'Turma E', 105, '19:00:00');

INSERT INTO MATRICULA (matricula_id, aluno_id, turma_id, nota_1, nota_2, nota_3, nota_final, numerofaltas) VALUES
(1, 1, null, null, null, null, null, null),
(2, 2, 2, 90, 85, 88, 87, 1),
(3, 3, 3, 75, 80, 78, 76, 3),
(4, 4, 4, 95, 92, 90, 93, 0),
(5, 5, 5, 88, 86, 89, 87, 1);

INSERT INTO ALUNO (aluno_id, nome, curso, nível, idade) VALUES
(6, 'MEDINHO', 'Engenharia', 2, 28);

INSERT INTO TURMA (turma_id, nometurma, sala, horário) VALUES
(6, 'Turma do MEDINHO', 30, '08:00:00');

INSERT INTO MATRICULA (matricula_id, aluno_id, turma_id, nota_1, nota_2, nota_3, nota_final, numerofaltas) VALUES
(6, 6, 6, 90, 70, 85, 82, 0);

ALTER TABLE MATRICULA
ADD CONSTRAINT fk_aluno
FOREIGN KEY (aluno_id) 
REFERENCES ALUNO(aluno_id);

ALTER TABLE MATRICULA
ADD CONSTRAINT fk_turma
FOREIGN KEY (turma_id) 
REFERENCES TURMA(turma_id);

-- 1
SELECT nome FROM ALUNO;

-- 2
SELECT MATRICULA.matricula_id FROM MATRICULA
INNER JOIN ALUNO ON MATRICULA.aluno_id = ALUNO.aluno_id;

-- 3
SELECT MATRICULA.matricula_id FROM MATRICULA
INNER JOIN ALUNO ON MATRICULA.aluno_id = ALUNO.aluno_id
WHERE MATRICULA.turma_id IS NULL;

-- 4
SELECT ALUNO.aluno_id FROM ALUNO
JOIN MATRICULA ON ALUNO.aluno_id = MATRICULA.aluno_id
JOIN TURMA ON MATRICULA.turma_id = TURMA.turma_id
WHERE TURMA.sala = 30;

-- 5
SELECT TURMA.horário FROM TURMA
JOIN MATRICULA ON TURMA.turma_id = MATRICULA.turma_id
JOIN ALUNO ON MATRICULA.aluno_id = ALUNO.aluno_id
WHERE ALUNO.nome = 'MEDINHO';

-- 6
SELECT ALUNO.nome FROM ALUNO
JOIN MATRICULA ON ALUNO.aluno_id = MATRICULA.aluno_id
JOIN TURMA ON MATRICULA.turma_id = TURMA.turma_id
WHERE TURMA.sala = 30;

-- 7
SELECT ALUNO.nome FROM ALUNO
JOIN MATRICULA ON ALUNO.aluno_id = MATRICULA.aluno_id
JOIN TURMA ON MATRICULA.turma_id = TURMA.turma_id
WHERE TURMA.sala != 30;

-- 8 
SELECT TURMA.nometurma FROM TURMA
JOIN MATRICULA ON TURMA.turma_id = MATRICULA.turma_id
JOIN ALUNO ON MATRICULA.aluno_id = ALUNO.aluno_id
WHERE MATRICULA.nota_final >= 80;

