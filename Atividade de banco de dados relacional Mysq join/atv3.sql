-- CRIANDO O BANCO DE DADOS
DROP DATABASE IF EXISTS db_farmacia_do_bem;
CREATE DATABASE IF NOT EXISTS db_farmacia_do_bem
default character set utf8
default collate utf8_general_ci;

USE db_farmacia_do_bem;

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
("Remedio", "Varios tipos de remedio"),
("cosméticos", "Varios tipos de tintas de cabelo"),
("Esmalte", "Varios tipos de esmalte"),
("Doces", "Varios tipos de Doces"),
("Pomadas", "Varios tipos Pomadas");

INSERT INTO tb_produto(nome_Produto, descricao_Produto, preco_Produto, imagem, idCategoria) VALUES
("Dipirona", "Remedio para dor de cabeça", 5, "img1", 1),
("Koleston", "Tinta para cabelo na cor azul", 55.90, "img2", 2),
("Esmalte Risqué", "Esmalte Risqué rosa", 2.55, "img3", 3),
("KitKat", "barra de chocolate", 6, "img4", 4),
("Dexpantenol", "pomada para queimadura", 20.55, "img5", 5),
("Bepantol", "pomada para cicatrização", 14.99, "img6", 5),
("Diamante Negro Barra", "Barra de Chocolate da Diamante Negro", 9, "img7", 4),
("Clonazepam", "remedio para dormir", 6.70, "img8", 1);

/*Faça um select que retorne os Produtos com o valor maior do que 50 reais.*/
SELECT * FROM tb_produto WHERE preco_Produto > 50;

/*Faça um select trazendo os Produtos com valor entre 3 e 60 reais.*/
SELECT * FROM tb_produto WHERE preco_Produto >= 3 and preco_Produto <= 60;

/*Faça um select utilizando LIKE buscando os Produtos com a letra B.*/
SELECT * FROM tb_produto WHERE nome_Produto LIKE "%B%";

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
where B.nome like "%cosméticos%";