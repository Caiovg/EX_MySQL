DROP DATABASE IF EXISTS RH;
CREATE DATABASE IF NOT EXISTS RH
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE RH;

CREATE TABLE Departamento(
	idDepartamento INT unsigned not null auto_increment primary key,
	nome varchar(100) not null
);

CREATE TABLE Funcionarios(
	id INT unsigned not null auto_increment primary key,
    nome varchar(100) not null,
    cpf varchar(14) unique not null,
    email varchar(100) unique not null,
    telefone varchar(16) unique not null,
    salario double(6,2) not null,
    idDepartamento INT unsigned not null
);

ALTER TABLE Funcionarios ADD CONSTRAINT FK_idDepartamento
FOREIGN KEY (idDepartamento)
REFERENCES Departamento (idDepartamento)
ON DELETE CASCADE
ON UPDATE CASCADE;

INSERT INTO Departamento(nome) VALUES
("Financeiro"),("Administrativo"),("TI"),("Setor comercial"),("Setor operacional");

INSERT INTO Funcionarios(nome, cpf, email, telefone, salario, idDepartamento) VALUES
("Caio", "922.251.320-70", "Caio@gmail.com", "(70) 88516-5393", 1050.85, 1),
("Barbara", "395.321.870-06", "Barbara@gmail.com", "(44) 53385-0767", 2500, 2),
("Isaías", "867.882.940-03", "Isaías@gmail.com", "(24) 43135-7939", 5000, 3),
("Charles", "852.412.920-47", "Charles@gmail.com", "(86) 80729-6299", 1500.50, 4),
("Felipe", "915.666.500-89", "Felipe@gmail.com", "(54) 84420-4151", 650.66, 5);

select * from Departamento;
select * from Funcionarios;

/*Faça um select que retorne os funcionaries com o salário maior do que 2000.*/
select * from Funcionarios where salario > 2000;

/*Faça um select que retorne os funcionaries com o salário menor do que 2000.*/
select * from Funcionarios where salario < 2000;

/*Ao término atualize um dado desta tabela através de uma query de atualização.*/
UPDATE Funcionarios SET salario = 6000.66 where id = 4;
select * from Funcionarios;