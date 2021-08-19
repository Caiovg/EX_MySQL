-- CRIANDO O BANCO DE DADOS
DROP DATABASE IF EXISTS db_construindo_a_nossa_vida;
CREATE DATABASE IF NOT EXISTS db_construindo_a_nossa_vida
default character set utf8
default collate utf8_general_ci;

USE db_construindo_a_nossa_vida;

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
("Metais", "Varios tipos de Metais"),
("Hidráulica", "Varios tipos de Canos"),
("Massas", "Varios tipos de Massas"),
("Madeira", "Varios tipos de Madeira"),
("Pedras", "Varios tipos de Pedras");

INSERT INTO tb_produto(nome_Produto, descricao_Produto, preco_Produto, imagem, idCategoria) VALUES
("Cimento", "o cimento se trata de um aglomerante ativo e hidráulico obtido a partir do cozimento de calcários naturais ou artificiais", 25, "img1", 3),
("Pedra Brita", "a pedra brita se trata de um agregado mais graúdo, resultante também da fragmentação de rochas", 30, "img2", 5),
("Madeira marrom", "A madeira pode ser utilizada de diferentes formas ao longo de uma construção ou reforma", 29.55, "img3", 4),
("Concreto", "O concreto é basicamente resultado da mistura de cimento, areia, pedra brita, água e aditivos.", 68.70, "img4", 5),
("Cal", "Elemento consumido em grande escala pela construção civil, a cal é resultado da extração e fragmentação de pedras calcárias e magnesianas.", 17.55, "img5", 5),
("Canos Hidráulico", "Todo imóvel precisa de um sistema de distribuição de água e esgoto, não é mesmo? Pois é! Neste momento você irá precisar se atentar quanto ao material hidráulico que irá compor a seu ambiente.", 40.99, "img6", 2),
("Gesso", "O gesso pode ser usado como revestimento, rebaixamento e até divisória.", 50, "img7", 3),
("Tijolo", "O tijolo é uma peça em formato de paralelepípedo muito usada na construção civil.", 40, "img8", 5);

/*Faça um select que retorne os Produtos com o valor maior do que 50 reais.*/
SELECT * FROM tb_produto WHERE preco_Produto > 50;

/*Faça um select trazendo os Produtos com valor entre 3 e 60 reais.*/
SELECT * FROM tb_produto WHERE preco_Produto >= 3 and preco_Produto <= 60;

/*Faça um select utilizando LIKE buscando os Produtos com a letra C.*/
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
where B.nome like "%Hidráulica%";