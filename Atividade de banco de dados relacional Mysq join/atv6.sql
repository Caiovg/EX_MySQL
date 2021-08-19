-- CRIANDO O BANCO DE DADOS
DROP DATABASE IF EXISTS db_cursoDaMinhaVida;
CREATE DATABASE IF NOT EXISTS db_cursoDaMinhaVida
default character set utf8
default collate utf8_general_ci;

USE db_cursoDaMinhaVida;

CREATE TABLE tb_categoria(
	idCategoria bigint unsigned not null auto_increment primary key,
    nome varchar(100) not null,
    descricao TEXT not null
);

CREATE TABLE tb_curso(
	idCurso INT unsigned not null auto_increment primary key,
	nome varchar(100) not null,
    descricao TEXT not null,
    preco double(6,2) not null, 
    imagem varchar(100),
    idCategoria bigint unsigned not null
);

ALTER TABLE tb_curso ADD CONSTRAINT FK_idCategoria
FOREIGN KEY (idCategoria)
REFERENCES tb_categoria (idCategoria)
ON DELETE CASCADE
ON UPDATE CASCADE;

INSERT INTO tb_categoria(nome, descricao) VALUES
("Java", "Cursos de Java"),
("C#", "Cursos de C#"),
("Python", "Cursos de Python"),
("React", "Cursos de React"),
("React Native", "Cursos de React Native");

INSERT INTO tb_curso(nome, descricao, preco, imagem, idCategoria) VALUES
("Curso Java full Stack", "curso amplo de java full stack", 25, "img1", 1),
("Curso Java POO", "curso amplo de java POO", 30, "img2", 1),
("Curso C#", "curso amplo de Curso C#", 29.55, "img3", 2),
("Curso Python", "curso amplo de Curso Python", 68.70, "img4", 3),
("Curso React", "curso amplo de Curso React", 17.55, "img5", 4),
("Curso React Native", "curso amplo de React Native", 40.99, "img6", 5),
("Curso React Native typeScript", "curso amplo de Curso React Native typeScript", 50, "img7", 5),
("Curso React Native JavaScript", "curso amplo de Curso React Native JavaScript", 40, "img8", 5);

/*Faça um select que retorne os Produtos com o valor maior do que 50 reais.*/
SELECT * FROM tb_curso WHERE preco > 50;

/*Faça um select trazendo os Produtos com valor entre 3 e 60 reais.*/
SELECT * FROM tb_curso WHERE preco >= 3 and preco <= 60;

/*Faça um select utilizando LIKE buscando os Produtos com a letra J.*/
SELECT * FROM tb_curso WHERE nome LIKE "%J%";

/*Faça um um select com Inner join entre tabela categoria e produto.*/
SELECT *
FROM tb_curso A
INNER JOIN tb_categoria B
ON A.idCategoria = B.idCategoria;

SELECT *
FROM tb_curso A
LEFT JOIN tb_categoria B
ON A.idCategoria = B.idCategoria;

SELECT *
FROM tb_curso A
RIGHT JOIN tb_categoria B
ON A.idCategoria = B.idCategoria;

/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são cosméticos).*/
SELECT *
FROM tb_curso A
LEFT JOIN tb_categoria B
ON A.idCategoria = B.idCategoria
where B.nome like "%Java%";