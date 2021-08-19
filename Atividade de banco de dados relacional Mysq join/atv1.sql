-- CRIANDO O BANCO DE DADOS
DROP DATABASE IF EXISTS db_generation_game_online;
CREATE DATABASE IF NOT EXISTS db_generation_game_online
default character set utf8
default collate utf8_general_ci;

USE db_generation_game_online;

CREATE TABLE tb_classe(
	idClasse bigint unsigned not null auto_increment primary key,
    nome varchar(100) not null,
    descricao TEXT not null
);

CREATE TABLE tb_personagem(
	idPersonagem bigint unsigned auto_increment primary key,
    nome varchar(100) not null,
    hp decimal(10,1) not null,
    poderDeAtaque decimal(10,1) not null,
    poderDeDefesa decimal(10,1) not null,
    idClasse bigint unsigned not null
);

ALTER TABLE tb_personagem ADD CONSTRAINT FK_idClasse
FOREIGN KEY (idClasse)
REFERENCES tb_classe (idClasse)
ON DELETE CASCADE
ON UPDATE CASCADE;

INSERT INTO tb_classe(nome, descricao)VALUES
("Guerreiro", "Para quem busca combate corpo a corpo os guerreiros são uma das classes mais indicadas."),
("Feiticeiros", "Enquanto os magos usam magia branca ou feiticeiros usam a magia negra para realizar suas conjurações."),
("Arqueiros", "Arqueiros que atiram as flexas de longe"),
("Magos", "Enquanto os necromantes utilizam poderes a partir de mortos, os magos se fazem valer de poderes naturais e elementais."),
("Monges", "Se você pensou em um homem careca e pacífico, talvez você se decepcione agora.");

INSERT INTO tb_personagem(nome, hp, poderDeAtaque, poderDeDefesa, idClasse)VALUES
("Urhan", 100, 2000, 1100, 1),
("If", 200, 5000, 4000, 2),
("Raslerd", 100, 100, 30, 3),
("Gelippe", 200, 60000, 30000, 4),
("Velfhus", 30, 1, 1, 5),
("Ald", 20000, 50000, 7, 4),
("Cind", 1000, 1000, 1000, 1),
("Vala", 300, 400, 400, 3);

/* Faça um select que retorne os personagens com o poder de ataque maior do que 2000.*/
SELECT * FROM tb_personagem WHERE poderDeAtaque > 2000;

/*Faça um select trazendo os personagens com poder de defesa entre 1000 e 2000.*/
SELECT * FROM tb_personagem WHERE poderDeDefesa >= 1000 and poderDeDefesa <= 2000;

/*Faça um select utilizando LIKE buscando os personagens com a letra C.*/
SELECT * FROM tb_personagem WHERE nome LIKE "%C%";

/*Faça um um select com Inner join entre tabela classe e personagem.*/
SELECT *
FROM tb_personagem A
INNER JOIN tb_classe B
ON A.idClasse = B.idClasse;

SELECT *
FROM tb_personagem A
LEFT JOIN tb_classe B
ON A.idClasse = B.idClasse;

SELECT *
FROM tb_personagem A
RIGHT JOIN tb_classe B
ON A.idClasse = B.idClasse;

/*Faça um select onde traga todos os personagem de uma classe específica (exemplo todos
os personagens que são arqueiros).*/
SELECT *
FROM tb_personagem A
LEFT JOIN tb_classe B
ON A.idClasse = B.idClasse
where B.nome = "Arqueiros";
