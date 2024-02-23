CREATE DATABASE workk;
USE workk;

CREATE TABLE Vendedor (
 NumeroVendedor varchar(200),
 NomeVendedor varchar(200),
 idade int not null,
 salario double not null,
 PRIMARY KEY (NumeroVendedor)
);

CREATE TABLE Cliente (
 NumeroCliente int not null,
 NomeCliente varchar(200),
 cidade varchar(200),
 Tipo varchar(200),
 PRIMARY KEY (NumeroCliente)
);

CREATE TABLE Pedido (
 NumeroPedido int not null,
 NumeroVendedor varchar(200) not null,
 NumeroCliente int not null,
 QuantItens int not null,
 ValorTotal varchar(200),
 PRIMARY KEY (NumeroPedido),
 FOREIGN KEY (NumeroVendedor) REFERENCES Vendedor(NumeroVendedor),
 FOREIGN KEY (NumeroCliente) REFERENCES Cliente(NumeroCliente)
);

INSERT INTO Vendedor (NumeroVendedor, NomeVendedor, idade, salario)
VALUES ('001', 'João Silva', 30, 5000.00),
       ('002', 'Maria Oliveira', 25, 6000.50);
       
INSERT INTO Cliente (NumeroCliente, NomeCliente, cidade, Tipo)
VALUES (101, 'Cliente A', 'Cidade A', 'Metal'),
       (102, 'Cliente B', 'Cidade B', 'OUTRO_TIPO');
       
INSERT INTO Pedido (NumeroPedido, NumeroVendedor, NumeroCliente, QuantItens, ValorTotal)
VALUES (1001, '001', 101, 5, '7420.00 reals'),
       (1002, '002', 102, 3, '750.50 reals');
       
SELECT NomeVendedor FROM Vendedor;

SELECT DISTINCT NumeroVendedor FROM Pedido;

SELECT NumeroVendedor FROM Vendedor
WHERE NumeroVendedor NOT IN (SELECT NumeroVendedor FROM Pedido);

SELECT DISTINCT v.NomeVendedor
FROM Vendedor v
JOIN Pedido p ON v.NumeroVendedor = p.NumeroVendedor
JOIN Cliente c ON p.NumeroCliente = c.NumeroCliente
WHERE c.Tipo = 'Metal';

SELECT DISTINCT c.Tipo
FROM Cliente c
JOIN Pedido p ON c.NumeroCliente = p.NumeroCliente
JOIN Vendedor v ON p.NumeroVendedor = v.NumeroVendedor
WHERE v.NomeVendedor = 'João';

SELECT DISTINCT c.NomeCliente, c.Tipo
FROM Cliente c
JOIN Pedido p ON c.NumeroCliente = p.NumeroCliente
WHERE CAST(REPLACE(p.ValorTotal, ' reals', '') AS DECIMAL) > 5000.00;
s