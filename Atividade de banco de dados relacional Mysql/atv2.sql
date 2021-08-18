DROP DATABASE IF EXISTS e_commerce;
CREATE DATABASE IF NOT EXISTS e_commerce
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE e_commerce;

CREATE TABLE Produto(
	idProduto INT unsigned not null auto_increment primary key,
	nome_Produto varchar(100) not null,
    descricao_Produto TEXT not null,
    preco_Produto double(6,2) not null, 
    imagem varchar(100)
);

INSERT INTO Produto(nome_Produto, descricao_Produto, preco_Produto, imagem) VALUES
("Teclado Gamer", "Teclado fru-fru rgb gamer", 250, "img1"),
("Mesa Gamer", "Mesa fru-fru rgb gamer", 450, "img2"),
("Tela Gamer", "Tela fru-fru rgb gamer", 1400.76, "img3"),
("Placa Mae Gamer", "Placa Mae fru-fru rgb gamer", 2050, "img4"),
("Fone Gamer", "Fone de ouvido fru-fru rgb gamer", 100, "img5"),
("Processador Gamer", "Processador fru-fru rgb gamer", 8000, "img6"),
("Placa de Video Gamer", "Placa de Video fru-fru rgb gamer", 3000, "img7"),
("Fonte Gamer", "Fonte fru-fru rgb gamer", 900, "img8");
select * from Produto;
/*Faça um select que retorne os produtos com o valor maior do que 500.*/
select * from Produto where preco_Produto > 500;

/*Faça um select que retorne os produtos com o valor menor do que 500.*/
select * from Produto where preco_Produto < 500;

/*Ao término atualize um dado desta tabela através de uma query de atualização.*/
UPDATE Produto SET nome_Produto = "Fonte Power Gamer" where idProduto = 8;
select * from Produto;