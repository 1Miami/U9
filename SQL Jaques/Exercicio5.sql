CREATE DATABASE EscolaInformatica;

CREATE TABLE TipoCurso (
    tipo_curso_id INT PRIMARY KEY,
    nome_tipo_curso VARCHAR(100)
);

CREATE TABLE Turma (
    turma_id INT PRIMARY KEY,
    tipo_curso_id INT,
    quantidade_alunos INT,
    horario_aula VARCHAR(50),
    data_inicial DATE,
    data_final DATE,
    FOREIGN KEY (tipo_curso_id) REFERENCES TipoCurso(tipo_curso_id)
);

CREATE TABLE Professor (
    cpf_professor VARCHAR(11) PRIMARY KEY,
    nome_professor VARCHAR(100),
    data_nascimento DATE,
    titulacao VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE Turma_Professor (
    turma_id INT,
    cpf_professor VARCHAR(11),
    PRIMARY KEY (turma_id, cpf_professor),
    FOREIGN KEY (turma_id) REFERENCES Turma(turma_id),
    FOREIGN KEY (cpf_professor) REFERENCES Professor(cpf_professor)
);

CREATE TABLE Aluno (
    matricula_id INT PRIMARY KEY,
    data_matricula DATE,
    nome_aluno VARCHAR(100),
    endereco VARCHAR(100),
    telefone VARCHAR(20),
    data_nascimento DATE,
    altura FLOAT,
    peso FLOAT
);

CREATE TABLE Matricula (
    matricula_id INT,
    turma_id INT,
    ausencias INT,
    PRIMARY KEY (matricula_id, turma_id),
    FOREIGN KEY (matricula_id) REFERENCES Aluno(matricula_id),
    FOREIGN KEY (turma_id) REFERENCES Turma(turma_id)
);

CREATE TABLE Monitor (
    turma_id INT PRIMARY KEY,
    matricula_id INT,
    FOREIGN KEY (turma_id) REFERENCES Turma(turma_id),
    FOREIGN KEY (matricula_id) REFERENCES Aluno(matricula_id)
);

INSERT INTO TipoCurso (tipo_curso_id, nome_tipo_curso) VALUES
(1, 'Programação'),
(2, 'Redes de Computadores'),
(3, 'Design Gráfico');

INSERT INTO Turma (turma_id, tipo_curso_id, quantidade_alunos, horario_aula, data_inicial, data_final) VALUES
(101, 1, 20, 'Segunda e Quarta, 18:00-20:00', '2024-01-10', '2024-05-20'),
(102, 2, 15, 'Terça e Quinta, 14:00-16:00', '2024-02-05', '2024-06-15'),
(103, 3, 25, 'Sábado, 09:00-12:00', '2024-03-15', '2024-07-25');

INSERT INTO Professor (cpf_professor, nome_professor, data_nascimento, titulacao, telefone) VALUES
('12345678901', 'Fulano de Tal', '1970-05-15', 'Mestre em Informática', '9999-9999'),
('23456789012', 'Beltrano Silva', '1985-09-20', 'Doutor em Redes de Computadores', '8888-8888'),
('34567890123', 'Ciclano Souza', '1990-03-10', 'Especialista em Design Gráfico', '7777-7777');

INSERT INTO Turma_Professor (turma_id, cpf_professor) VALUES
(101, '12345678901'),
(102, '23456789012'),
(103, '34567890123');

INSERT INTO Aluno (matricula_id, data_matricula, nome_aluno, endereco, telefone, data_nascimento, altura, peso) VALUES
(1001, '2023-12-20', 'João Silva', 'Rua A, 123', '1111-1111', '2000-02-10', 1.75, 70.5),
(1002, '2024-01-05', 'Maria Souza', 'Av. B, 456', '2222-2222', '2001-05-20', 1.65, 60.0),
(1003, '2024-02-15', 'Carlos Santos', 'Rua C, 789', '3333-3333', '1999-09-15', 1.80, 80.0),
(1004, '2024-03-20', 'Ana Oliveira', 'Av. D, 012', '4444-4444', '2002-11-30', 1.70, 55.0);

INSERT INTO Matricula (matricula_id, turma_id, ausencias) VALUES
(1001, 101, 3),
(1002, 101, 1),
(1003, 102, 2),
(1004, 103, 0);

INSERT INTO Monitor (turma_id, matricula_id) VALUES
(101, 1002),
(102, 1003),
(103, 1004);
