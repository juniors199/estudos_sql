CREATE DATABASE meu_banco;
DROP TABLE produto;
USE meu_banco;


CREATE TABLE produto
(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    preco DECIMAL(18, 2) NOT NULL,
    qtde_estoque INT NOT NULL DEFAULT 0
);


INSERT INTO produto(nome, descricao, preco, qtde_estoque) VALUES ('Caneta BIC azul','Escreve', 1.52, 120);
INSERT INTO produto(nome, descricao, preco, qtde_estoque) VALUES ('Lapis preto','Escreve e pode ser apagado', 0.66, 1520);

SELECT * FROM produto;

SELECT nome, preco FROM produto WHERE codigo = 2;

DELETE FROM produto WHERE codigo = 2;
DELETE * FROM produto;