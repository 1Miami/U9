CREATE DATABASE EscolaInformatica;

-- Tabela Turma
CREATE TABLE Turma (
    turma_id INT PRIMARY KEY,
    quantidade_alunos INT,
    horario_aula VARCHAR(50),
    duracao_aula TIME,
    data_inicial DATE,
    data_final DATE,
    tipo_curso VARCHAR(100)
);

-- Tabela Professor
CREATE TABLE Professor (
    cpf VARCHAR(11) PRIMARY KEY,
    nome_professor VARCHAR(100),
    data_nascimento DATE,
    titulacao VARCHAR(100),
    telefone VARCHAR(20) -- Considerando apenas um telefone por simplicidade, pode ser expandido conforme necessário
);

-- Tabela Aluno
CREATE TABLE Aluno (
    matricula_id INT PRIMARY KEY,
    data_matricula DATE,
    nome_aluno VARCHAR(100),
    endereco VARCHAR(100),
    telefone VARCHAR(20), -- Considerando apenas um telefone por simplicidade, pode ser expandido conforme necessário
    data_nascimento DATE,
    altura FLOAT,
    peso FLOAT
);

-- Tabela Monitor
CREATE TABLE Monitor (
    aluno_id INT PRIMARY KEY,
    turma_id INT,
    FOREIGN KEY (aluno_id) REFERENCES Aluno(matricula_id),
    FOREIGN KEY (turma_id) REFERENCES Turma(turma_id)
);

-- Tabela Matricula
CREATE TABLE Matricula (
    aluno_id INT,
    turma_id INT,
    ausencias INT,
    PRIMARY KEY (aluno_id, turma_id),
    FOREIGN KEY (aluno_id) REFERENCES Aluno(matricula_id),
    FOREIGN KEY (turma_id) REFERENCES Turma(turma_id)
);

-- Inserções de exemplo na tabela Turma
INSERT INTO Turma (turma_id, quantidade_alunos, horario_aula, duracao_aula, data_inicial, data_final, tipo_curso) 
VALUES
(1, 20, 'Segunda e Quarta, 18:00-20:00', '02:00:00', '2024-01-10', '2024-05-30', 'Programação em Python'),
(2, 15, 'Terça e Quinta, 14:00-16:00', '02:00:00', '2024-02-05', '2024-06-20', 'Banco de Dados'),
(3, 25, 'Segunda e Quarta, 19:00-21:00', '02:00:00', '2024-03-15', '2024-07-10', 'Desenvolvimento Web');

-- Inserções de exemplo na tabela Professor
INSERT INTO Professor (cpf, nome_professor, data_nascimento, titulacao, telefone) 
VALUES
('12345678901', 'Fulano de Tal', '1980-05-15', 'Mestre em Informática', '987654321'),
('23456789012', 'Beltrano da Silva', '1975-10-20', 'Doutor em Engenharia de Software', '654321987'),
('34567890123', 'Ciclano dos Santos', '1983-03-25', 'Especialista em Desenvolvimento Web', '123456789');

-- Inserções de exemplo na tabela Aluno
INSERT INTO Aluno (matricula_id, data_matricula, nome_aluno, endereco, telefone, data_nascimento, altura, peso) 
VALUES
(1001, '2023-12-01', 'João da Silva', 'Rua A, 123', '111222333', '2000-01-10', 1.75, 70.5),
(1002, '2024-01-15', 'Maria Souza', 'Rua B, 456', '444555666', '2002-04-20', 1.65, 60.0),
(1003, '2024-02-20', 'José Oliveira', 'Rua C, 789', '777888999', '2001-07-05', 1.80, 80.2);

-- Inserções de exemplo na tabela Monitor
INSERT INTO Monitor (aluno_id, turma_id) 
VALUES
(1001, 1),
(1002, 2),
(1003, 3);

-- Inserções de exemplo na tabela Matricula
INSERT INTO Matricula (aluno_id, turma_id, ausencias) 
VALUES
(1001, 1, 2),
(1002, 2, 1),
(1003, 3, 3);


-- 2.1) Listar os dados dos alunos
SELECT * FROM Aluno;

-- 2.2) Listar os dados dos alunos e as turmas que eles estão matriculados
SELECT A.*, T.*
FROM Aluno A
JOIN Matricula M ON A.matricula_id = M.aluno_id
JOIN Turma T ON M.turma_id = T.turma_id;

-- 2.3) Listar os alunos que não possuem faltas
SELECT A.*
FROM Aluno A
LEFT JOIN Matricula M ON A.matricula_id = M.aluno_id
WHERE M.ausencias IS NULL OR M.ausencias = 0;

-- 2.4) Listar os professores e a quantidade de turmas que cada um leciona
SELECT P.nome_professor, COUNT(T.turma_id) AS quantidade_turmas_lecionadas
FROM Professor P
LEFT JOIN Turma T ON P.cpf = T.cpf_professor
GROUP BY P.nome_professor;

-- 2.5) Listar nome dos professores, apenas um dos números de telefone do professor, dados
-- (id da turma, data início, data fim e horário) das turmas que o professor leciona, curso da
-- turma e alunos matriculados ordenado por nome do professor, id turma e nome do aluno
SELECT 
    P.nome_professor,
    ANY_VALUE(P.telefone) AS telefone,
    T.turma_id,
    T.data_inicial,
    T.data_final,
    T.horario_aula,
    T.tipo_curso,
    A.nome_aluno
FROM 
    Professor P
JOIN 
    Turma T ON P.cpf = T.cpf_professor
JOIN 
    Matricula M ON T.turma_id = M.turma_id
JOIN 
    Aluno A ON M.aluno_id = A.matricula_id
ORDER BY 
    P.nome_professor, T.turma_id, A.nome_aluno;

-- 2.6) Listar os nomes dos professores e a turma que cada um leciona com maior número de alunos
SELECT 
    P.nome_professor,
    T.turma_id
FROM 
    Professor P
JOIN 
    Turma T ON P.cpf = T.cpf_professor
WHERE 
    T.quantidade_alunos = (
        SELECT MAX(quantidade_alunos) 
        FROM Turma 
        WHERE cpf_professor = P.cpf
    );

-- 2.7) Listar os nomes dos alunos ordenados pela turma que estes possuem maior número de
-- faltas. Deve aparecer apenas a turma que cada um dos alunos tem maior quantidade de
-- faltas
SELECT 
    A.nome_aluno, 
    M.turma_id 
FROM 
    Aluno A
JOIN 
    Matricula M ON A.matricula_id = M.aluno_id
WHERE 
    M.ausencias = (
        SELECT MAX(ausencias) 
        FROM Matricula 
        WHERE aluno_id = A.matricula_id
    )
ORDER BY 
    M.turma_id;

-- 2.8) Listar a quantidade média de alunos por curso
SELECT 
    tipo_curso, 
    AVG(quantidade_alunos) AS media_alunos_por_curso
FROM 
    Turma 
GROUP BY 
    tipo_curso;


-- 3.1) Alterar o nome de todos os professores para maiúsculo
UPDATE Professor
SET nome_professor = UPPER(nome_professor);

-- 3.2) Colocar o nome de todos os alunos que estão na turma com o maior número de alunos
-- em maiúsculo
UPDATE Aluno
SET nome_aluno = UPPER(nome_aluno)
WHERE matricula_id IN (
    SELECT M.aluno_id 
    FROM Turma T 
    JOIN Matricula M ON T.turma_id = M.turma_id 
    WHERE T.quantidade_alunos = (
        SELECT MAX(quantidade_alunos) 
        FROM Turma
    )
);

-- 4) Excluir as ausências dos alunos nas turmas que estes são monitores
DELETE FROM Matricula
WHERE aluno_id IN (
    SELECT aluno_id FROM Monitor
);

