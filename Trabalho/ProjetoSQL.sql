CREATE DATABASE banco_games;

USE banco_games;

CREATE TABLE jogador (
	codJogador INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    apelido VARCHAR(20) NOT NULL,
    nivel INT NOT NULL
);

CREATE TABLE premium(
	desconto DECIMAL(10,2),
    codJogador INT,
    PRIMARY KEY (codJogador),
    FOREIGN KEY (codJogador) REFERENCES jogador(codJogador)
);

CREATE TABLE jogo (
	codJogo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preço DECIMAL(18,2),
    descricao VARCHAR(100)
);

CREATE TABLE jogador_jogo (
	horas_registradas TIME,
    data_compra DATE NOT NULL,
    codJogador INT,
    codJogo INT,
    PRIMARY KEY (codJogador, codJogo),
    FOREIGN KEY (codJogador) REFERENCES jogador(codJogador),
    FOREIGN KEY (codJogo) REFERENCES jogo(codJogo)
);

CREATE TABLE conquista (
	codConquista INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    codJogo INT,
    PRIMARY KEY (codJogo),
    FOREIGN KEY (codJogo) REFERENCES jogo(codJogo)
);

CREATE TABLE jogador_conquista (
	data_desbloqueio DATE,
    codConquista INT,
    codJogador INT,
    PRIMARY KEY (codConquista, codJogador),
    FOREIGN KEY (codConquista) REFERENCES conquista(codConquista),
    FOREIGN KEY (codJogador) REFERENCES jogador(codJogador)
);

SELECT c.nome FROM jogador j JOIN jogador_conquista jc ON j.codJogador = jc.codJogador
						JOIN conquista c ON jc.codConquista = c.codConquista
                        JOIN jogo jg ON c.codJogo = jg.codJogo
                        WHERE jg.nome = "Far Cry 5" NOT IN (
                        
                        SELECT j.nome FROM jogador j JOIN jogador_conquista jc ON j.codJogador = jc.codJogador
													 JOIN conquista c ON jc.codConquista = c.codConquista
													 JOIN jogo jg ON c.codJogo = jg.codJogo
													 );

SELECT j.nome FROM premium p JOIN jogador j ON p.codJogador = j.codJogador	
						JOIN jogador_conquista jc ON j.codJogador = jc.codJogador
                        JOIN conquista c ON jc.codConquista = c.codConquista
                        JOIN jogo jg ON c.codJogo = jg.codJogo
                        WHERE c.nome = "não bateu, não matou e morreu" AND "morreu tanto que morreu de tanto morrer" AND jg.nome = "Dark Souls II" IN (
                        
                        SELECT j.codJogador FROM premium p JOIN jogador j ON p.codJogador = j.codJogador
                        WHERE j.codJogador = p.codJogador
                        );
