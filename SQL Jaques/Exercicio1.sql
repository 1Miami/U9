--  (nrvendedor, nomevendedor, idade, salario)
-- PEDIDO (nr_pedido, nrvendedor, nrcliente, quantidade_itens, valor_total) CLIENTE (nrcliente, nomecliente, cidade, tipo)


CREATE DATABASE Exercicio1;

CREATE TABLE Vendedor (
    nrvendedor int NOT NULL,
    nomevendedor varchar(255) NOT NULL,
    idade int NOT NULL,
    salario int,
    PRIMARY KEY (nrvendedor)
);

CREATE TABLE Cliente (
    nrcliente int NOT NULL,
    nomecliente varchar(200) NOT NULL,
    cidade varchar(255) NOT NULL,
    tipo varchar(100),
    PRIMARY KEY (nrcliente)
);

CREATE TABLE Pedido (
    nr_pedido int NOT NULL,
    nrvendedor int NOT NULL,
    nrcliente int NOT NULL,
    quantidade_itens int NOT NULL,
    valor_total int NOT NULL,
    FOREIGN KEY (nrvendedor) REFERENCES Vendedor (nrvendedor),
    FOREIGN KEY (nrcliente) REFERENCES Cliente (nrcliente),
    PRIMARY KEY (nr_pedido)
);

INSERT INTO Vendedor (nrvendedor, nomevendedor, idade, salario) VALUES
(1, 'João', 30, 3000),
(2, 'Maria', 35, 3500),
(3, 'Pedro', 28, 2800),
(4, 'Ana', 40, 4000),
(5, 'Henrique', 50, 4100);

INSERT INTO Cliente (nrcliente, nomecliente, cidade, tipo) VALUES
(1, 'Cliente A', 'São Paulo', 'Varejo'),
(2, 'Cliente B', 'Rio de Janeiro', 'Atacado'),
(3, 'Cliente C', 'Belo Horizonte', 'Varejo'),
(4, 'Cliente D', 'Porto Alegre', 'Atacado'),
(5, 'Cliente E', 'São Leopoldo', 'INDUSTRIA');

INSERT INTO Pedido (nr_pedido, nrvendedor, nrcliente, quantidade_itens, valor_total) VALUES
(1, 1, 1, 10, 500),
(2, 2, 2, 20, 1000),
(3, 3, 3, 15, 750),
(4, 4, 4, 25, 1250),
(5, 5, 5, 35, 1470);

SELECT nomevendedor FROM VENDEDOR;

SELECT DISTINCT nrvendedor FROM PEDIDO;

SELECT nrvendedor FROM VENDEDOR WHERE nrvendedor NOT IN (SELECT DISTINCT nrvendedor FROM PEDIDO);

SELECT DISTINCT V.nomevendedor 
FROM VENDEDOR V 
JOIN PEDIDO P ON V.nrvendedor = P.nrvendedor 
JOIN CLIENTE C ON P.nrcliente = C.nrcliente 
WHERE C.tipo = 'INDUSTRIA';

SELECT DISTINCT C.tipo 
FROM VENDEDOR V 
JOIN PEDIDO P ON V.nrvendedor = P.nrvendedor 
JOIN CLIENTE C ON P.nrcliente = C.nrcliente 
WHERE V.nomevendedor = 'JOÃO';


SELECT DISTINCT C.nomecliente, C.tipo 
FROM CLIENTE C 
JOIN PEDIDO P ON C.nrcliente = P.nrcliente 
WHERE P.valor_total > 5000;
