-- CRIANDO O BANCO DE DADOS
DROP DATABASE IF EXISTS db_cidade_das_carnes;
CREATE DATABASE IF NOT EXISTS db_cidade_das_carnes
default character set utf8
default collate utf8_general_ci;

USE db_cidade_das_carnes;

CREATE TABLE tb_categoria(
	idCategoria bigint unsigned not null auto_increment primary key,
    nome varchar(100) not null,
    descricao TEXT not null
);

CREATE TABLE tb_produto(
	idProduto INT unsigned not null auto_increment primary key,
	nome_Produto varchar(100) not null,
    descricao_Produto TEXT not null,
    preco_Produto double(6,2) not null, 
    imagem varchar(100),
    idCategoria bigint unsigned not null
);

ALTER TABLE tb_produto ADD CONSTRAINT FK_idCategoria
FOREIGN KEY (idCategoria)
REFERENCES tb_categoria (idCategoria)
ON DELETE CASCADE
ON UPDATE CASCADE;

INSERT INTO tb_categoria(nome, descricao) VALUES
("Carnes suinas", "Varios tipos de Carnes suinas"),
("Carnes bovinas", "Varios tipos de Carnes bovinas"),
("Legumes", "Varios tipos de Legumes"),
("Carne de frango", "Varios tipos de Carne de frango"),
("Refrigerante", "Varios tipos de Refrigerante");

INSERT INTO tb_produto(nome_Produto, descricao_Produto, preco_Produto, imagem, idCategoria) VALUES
("Bisteca", "É um dos cortes mais populares do porco", 25, "img1", 1),
("Capa do Lombo", " um dos cortes mais ricos e versáteis do suíno", 30, "img2", 1),
("Filé mignon", "O corte mais suculento", 29.55, "img3", 2),
("Picanha", "A campeã no ranking dos churrasqueiros.", 68.70, "img4", 2),
("Coxa da asa", "Coxas da asa do frango", 17.55, "img5", 4),
("Abobrinha", "Abobrinha de qualidade", 10.99, "img6", 3),
("Aipim", "Aipim de qualidade", 3, "img7", 3),
("Coca Cola", "Coca cola de 2 litros", 10, "img8", 5);

/*Faça um select que retorne os Produtos com o valor maior do que 50 reais.*/
SELECT * FROM tb_produto WHERE preco_Produto > 50;

/*Faça um select trazendo os Produtos com valor entre 3 e 60 reais.*/
SELECT * FROM tb_produto WHERE preco_Produto >= 3 and preco_Produto <= 60;

/*Faça um select utilizando LIKE buscando os Produtos com a letra B.*/
SELECT * FROM tb_produto WHERE nome_Produto LIKE "%C%";

/*Faça um um select com Inner join entre tabela categoria e produto.*/
SELECT *
FROM tb_produto A
INNER JOIN tb_categoria B
ON A.idCategoria = B.idCategoria;

SELECT *
FROM tb_produto A
LEFT JOIN tb_categoria B
ON A.idCategoria = B.idCategoria;

SELECT *
FROM tb_produto A
RIGHT JOIN tb_categoria B
ON A.idCategoria = B.idCategoria;

/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são cosméticos).*/
SELECT *
FROM tb_produto A
LEFT JOIN tb_categoria B
ON A.idCategoria = B.idCategoria
where B.nome like "%legumes%";