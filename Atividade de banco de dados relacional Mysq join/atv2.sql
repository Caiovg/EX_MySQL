-- CRIANDO O BANCO DE DADOS
DROP DATABASE IF EXISTS db_pizzaria_legal;
CREATE DATABASE IF NOT EXISTS db_pizzaria_legal
default character set utf8
default collate utf8_general_ci;

USE db_pizzaria_legal;

CREATE TABLE tb_categoria(
	idCategoria bigint unsigned not null auto_increment primary key,
    nome varchar(100) not null,
    descricao TEXT not null
);

CREATE TABLE tb_pizza(
	idPizza bigint unsigned auto_increment primary key,
    nome varchar(100) not null,
    descricao text not null,
    observacao text,
    valor decimal(10,2) not null,
    idCategoria bigint unsigned not null
);

ALTER TABLE tb_pizza ADD CONSTRAINT FK_idCategoria
FOREIGN KEY (idCategoria)
REFERENCES tb_categoria (idCategoria)
ON DELETE CASCADE
ON UPDATE CASCADE;

INSERT INTO tb_categoria(nome, descricao) VALUES
("Pizza salgada brotinho", "Pizza salgada brotinho de qualidade ao desejo do cliente."),
("Pizza salgada Grande", "Pizza salgada Grande de qualidade ao desejo do cliente."),
("Pizza doce brotinho", "Pizza doce brotinho de qualidade ao desejo do cliente."),
("Pizza doce Grande", "Pizza doce Grande de qualidade ao desejo do cliente."),
("Refrigerante", "Refrigerante de qualidade ao desejo do cliente.");

INSERT INTO tb_pizza(nome, descricao, observacao, valor, idCategoria) VALUES
("Pizza de Mussarela", "Queijo mussarela e orégano", "sem Azeitona", 32.50, 1),
("Pizza de Calabresa", "Mussarela, Calabresa, Cebola e orégano", "sem Cebola", 29, 2),
("Pizza de Pepperoni", "Mussarela, pepperoni e orégano", "", 40, 2),
("Pizza de Prestigio", "Chocolate meio amargo, leite condensado e coco ralado", "", 25, 3),
("Pizza de Chocolate e morango", "Chocolate meio amargo com morango", "", 30, 4),
("Pizza Peruana", "Atum, mussarela, molho vinagrete e bacon", "", 47.99, 2),
("Coca Cola", "Coca Cola de 2 litros", "", 10, 5),
("Fanta Uva", "Fanta uva de 1 litro", "", 8, 5);

/*Faça um select que retorne os Produtos com o valor maior do que 45 reais.*/
SELECT * FROM tb_pizza WHERE valor > 45;

/*Faça um select trazendo os Produtos com valor entre 29 e 60 reais.*/
SELECT * FROM tb_pizza WHERE valor >= 29 and valor <= 60;

/*Faça um select utilizando LIKE buscando os personagens com a letra C.*/
SELECT * FROM tb_pizza WHERE nome LIKE "%C%";

/*Faça um um select com Inner join entre tabela classe e personagem.*/
SELECT *
FROM tb_pizza A
INNER JOIN tb_categoria B
ON A.idCategoria = B.idCategoria;

SELECT *
FROM tb_pizza A
LEFT JOIN tb_categoria B
ON A.idCategoria = B.idCategoria;

SELECT *
FROM tb_pizza A
RIGHT JOIN tb_categoria B
ON A.idCategoria = B.idCategoria;

/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são pizza doce).*/
SELECT *
FROM tb_pizza A
LEFT JOIN tb_categoria B
ON A.idCategoria = B.idCategoria
where B.nome like "%Pizza doce%";
