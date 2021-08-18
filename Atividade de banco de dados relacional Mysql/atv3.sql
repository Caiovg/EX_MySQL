DROP DATABASE IF EXISTS escola;
CREATE DATABASE IF NOT EXISTS escola
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE escola;

CREATE TABLE Turmas(
	idTurma INT unsigned not null auto_increment primary key,
    numero_sala VARCHAR(10) not null
);

CREATE TABLE Disciplina(
	idDisciplina INT unsigned not null auto_increment primary key,
    nome VARCHAR(20) not null
);

CREATE TABLE ESTUDANTES(
	idAluno INT unsigned not null auto_increment primary key,
    nome varchar(100) not null,
    email varchar(100) unique not null,
    telefone varchar(16) unique not null,
    idTurma INT unsigned not null,
    idDisciplina INT unsigned not null, 
   nota decimal(10,1) not null
);

ALTER TABLE ESTUDANTES ADD CONSTRAINT FK_idTurma
FOREIGN KEY (idTurma)
REFERENCES Turmas (idTurma)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE ESTUDANTES ADD CONSTRAINT FK_idDisciplina
FOREIGN KEY (idDisciplina)
REFERENCES Disciplina (idDisciplina)
ON DELETE CASCADE
ON UPDATE CASCADE;

INSERT INTO Turmas(numero_sala) VALUES
("1A"),("1B"),("1C"),("2A"),("2B"),("2C"),("3A"),("3B");
SELECT * FROM Turmas;

INSERT INTO Disciplina(nome) VALUES
("Geografia"),("Informatica"),("Matematica"),
("Historia"),("Educação Fisica"),("Ciencia"),
("Literatura"),("Artes");
SELECT * FROM Disciplina;

INSERT INTO Estudantes(nome, email, telefone, idTurma, idDisciplina, nota) values
("Caio","Caio@gmail.com", "(70) 88516-5393", 1, 1,  9.5),
("Barbara", "Barbara@gmail.com", "(44) 53385-0767", 2,2, 4.9),
("Isaías", "Isaías@gmail.com", "(24) 43135-7939", 3,3,  8.2),
("Charles", "Charles@gmail.com", "(86) 80729-6299", 4,4,  7.0),
("Felipe", "Felipe@gmail.com", "(54) 84420-4151", 5,5,  6.5),
("Gabi", "Gabi@gmail.com", "(25) 48437-7497", 6,6, 10),
("Bia", "Bia@gmail.com", "(76) 87361-2861", 7,7, 9.2),
("Rodrigo", "Rodrigo@gmail.com", "(74) 26623-2587", 8,8, 0);

SELECT * FROM Estudantes;

/*Faça um select que retorne o/as estudantes com a nota maior do que 7.*/
SELECT * FROM Estudantes a, Disciplina b 
WHERE a.idDisciplina = b.idDisciplina AND a.nota > 7;
/*Faça um select que retorne o/as estudantes com a nota menor do que 7.*/
SELECT * FROM Estudantes a, Disciplina b 
WHERE a.idDisciplina = b.idDisciplina AND a.nota < 7;

UPDATE Disciplina SET nome = "Matematica Aplicada" WHERE idDisciplina = 3;
SELECT * FROM Estudantes a, Disciplina b 
WHERE a.idDisciplina = b.idDisciplina AND a.nota > 7;