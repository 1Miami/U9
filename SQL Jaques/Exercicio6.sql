CREATE DATABASE Exercicio6

CREATE TABLE TURMA (
    turma_id INT PRIMARY KEY,
    quantidade_alunos INT,
    horario_aula VARCHAR(50),
    duracao_aula TIME,
    data_inicial DATE,
    data_final DATE,
    tipo_curso VARCHAR(100)
);

CREATE TABLE PROFESSOR (
    cpf VARCHAR(11) PRIMARY KEY,
    nome_professor VARCHAR(100),
    data_nascimento DATE,
    titulacao VARCHAR(100),
    telefone VARCHAR(20) -- Considerando apenas um telefone por simplicidade, pode ser expandido conforme necessário
);

CREATE TABLE ALUNO (
    matricula_id INT PRIMARY KEY,
    data_matricula DATE,
    nome_aluno VARCHAR(100),
    endereco VARCHAR(100),
    telefone VARCHAR(20), -- Considerando apenas um telefone por simplicidade, pode ser expandido conforme necessário
    data_nascimento DATE,
    altura FLOAT,
    peso FLOAT
);

CREATE TABLE MONITOR (
    aluno_id INT PRIMARY KEY,
    turma_id INT,
    FOREIGN KEY (aluno_id) REFERENCES ALUNO(matricula_id),
    FOREIGN KEY (turma_id) REFERENCES TURMA(turma_id)
);

CREATE TABLE MATRICULA (
    aluno_id INT,
    turma_id INT,
    ausencias INT,
    PRIMARY KEY (aluno_id, turma_id),
    FOREIGN KEY (aluno_id) REFERENCES ALUNO(matricula_id),
    FOREIGN KEY (turma_id) REFERENCES TURMA(turma_id)
);

INSERT INTO TURMA (turma_id, quantidade_alunos, horario_aula, duracao_aula, data_inicial, data_final, tipo_curso) VALUES
(1, 20, 'Segunda e Quarta, 18:00-20:00', '02:00:00', '2024-01-10', '2024-05-30', 'Programação em Python'),
(2, 15, 'Terça e Quinta, 14:00-16:00', '02:00:00', '2024-02-05', '2024-06-20', 'Banco de Dados'),
(3, 25, 'Segunda e Quarta, 19:00-21:00', '02:00:00', '2024-03-15', '2024-07-10', 'Desenvolvimento Web');

INSERT INTO PROFESSOR (cpf, nome_professor, data_nascimento, titulacao, telefone) VALUES
('12345678901', 'Fulano de Tal', '1980-05-15', 'Mestre em Informática', '987654321'),
('23456789012', 'Beltrano da Silva', '1975-10-20', 'Doutor em Engenharia de Software', '654321987'),
('34567890123', 'Ciclano dos Santos', '1983-03-25', 'Especialista em Desenvolvimento Web', '123456789');

INSERT INTO ALUNO (matricula_id, data_matricula, nome_aluno, endereco, telefone, data_nascimento, altura, peso) VALUES
(1001, '2023-12-01', 'João da Silva', 'Rua A, 123', '111222333', '2000-01-10', 1.75, 70.5),
(1002, '2024-01-15', 'Maria Souza', 'Rua B, 456', '444555666', '2002-04-20', 1.65, 60.0),
(1003, '2024-02-20', 'José Oliveira', 'Rua C, 789', '777888999', '2001-07-05', 1.80, 80.2);

INSERT INTO MONITOR (aluno_id, turma_id) VALUES
(1001, 1),
(1002, 2),
(1003, 3);

INSERT INTO MATRICULA (aluno_id, turma_id, ausencias) VALUES
(1001, 1, 2),
(1002, 2, 1),
(1003, 3, 3);
