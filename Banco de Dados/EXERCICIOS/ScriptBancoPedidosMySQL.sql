create database bancopedidos;

use bancopedidos;

create table CLIENTE
(
   IDCLIENTE                      integer                        not null,
   NOME                           varchar(100),
   CIDADE                         varchar(100),
   ENDERECO                       varchar(100),
   CEP                            varchar(10),
   UF                             varchar(2),
   CNPJ                           varchar(20),
   IE                             integer,
   primary key (IDCLIENTE)
);

create table VENDEDOR
(
   IDVENDEDOR                     integer                        not null,
   NOME                           varchar(100),
   SALARIO                        decimal(18,2),
   COMISSAO                       varchar(1),
   primary key (IDVENDEDOR)
);


create table PEDIDO
(
   IDPEDIDO                       integer                        not null,
   IDCLIENTE                      integer,
   IDVENDEDOR                     integer,
   PRAZO                          integer,
   primary key (IDPEDIDO),
   foreign key (IDCLIENTE) references CLIENTE (IDCLIENTE),
   foreign key (IDVENDEDOR) references VENDEDOR (IDVENDEDOR)
);

create table PRODUTO
(
   IDPRODUTO                      integer                        not null,
   UNIDADE                        varchar(5),
   DESCRICAO                      varchar(100),
   VALOR                          decimal(18, 2),
   primary key (IDPRODUTO)
);

create table PRODUTO_PEDIDO
(
   IDPEDIDO                       integer                        not null,
   IDPRODUTO                      integer                        not null,
   QUANTIDADE                     integer,
   primary key (IDPEDIDO, IDPRODUTO),
   foreign key (IDPEDIDO) references Pedido(IDPEDIDO),
   foreign key (IDPRODUTO) references Produto(IDPRODUTO)
);



INSERT INTO produto (IDPRODUTO,UNIDADE,DESCRICAO,VALOR) VALUES
 (13,'G','Ouro',6.18),
 (22,'M','Linho',0.11),
 (25,'Kg','Queijo',0.97),
 (30,'SAC','Açúcar',0.3),
 (31,'BAR','Chocolate',0.87),
 (45,'M','Madeira',0.25),
 (53,'M','Linha',1.8),
 (77,'M','Papel',1.05),
 (78,'L','Vinho',2),
 (87,'M','Cano',1.97);

INSERT INTO vendedor (IDVENDEDOR,NOME,SALARIO,COMISSAO) VALUES
 (11,'João',2780,'C'),
 (101,'João',2650,'C'),
 (111,'Carlos',2490,'A'),
 (209,'José',1800,'C'),
 (213,'Jonas',2300,'A'),
 (240,'Antônio',9500,'C'),
 (250,'Maurício',2930,'B'),
 (310,'Josias',870,'B'),
 (720,'Felipe',4600,'A');

INSERT INTO cliente (IDCLIENTE,NOME,CIDADE,ENDERECO,CEP,UF,CNPJ,IE) VALUES
 (20,'Beth','São Paulo','Av, Climério 45','25679300','SP','3248512617326-8',9280),
 (110,'Jorge','Curitiba','Rua caiapó 13','30078500','PR','14512764/9834-9',NULL),
 (130,'Edmar','Salvador','Rua da Praia sn','30079300','BA','23463284/234-9',7121),
 (157,'Paulo','Londrina','Tv. Moraes c/3',NULL,'PR','32848223/324-2',1923),
 (180,'LM0 ','Florianópolis ','Av. Beira Mar n. 1256 ','30077500','SC','12736571/2347-4',NULL),
 (222,'Lúcia','Belo Horizonte','Rua Itabira 123 Loja 9','22124391','MG','28315213/9348-8',2985),
 (234,'José ','Brasília ','Quadra 3 bI. 3 si. 1003 ','22841650','DF','21763576/1232-3 ',2931),
 (260,'Susana ','Niterói ','Rua Lopes Mendes 12 ','30046500','RJ','21763571/232-9 ',2530),
 (290,'Renato ','São Paulo ','Rua Meireles 123 bl.2 si. 345 ','30225900','SP','13276571/1231-4 ',1820),
 (390,'Sebastião ','Uberaba ','Rua da Igreja 10 ','30438700','MG','32176547/213-3 ',9071),
 (410,'Rodolfo','Rio de Janeiro','Largo da Lapa 27 sobrado','30078900','RJ','12835128/2346-9',7431);

INSERT INTO cliente (IDCLIENTE,NOME,CIDADE,ENDERECO,CEP,UF,CNPJ,IE) VALUES
 (720,'Ana','Niterói','Rua 17 n. 19','24358310','RJ','12113231/0001-34',2134),
 (830,'Maurício','São Paulo','Av. Paulista 1236 sI 2345','3012683','SP','32816985/7465-6',9343),
 (870,'Flávio','São Paulo','Av. Pres. Vargas 10','22763931','SP','22534126/9387-9',4631);

 INSERT INTO pedido (IDPEDIDO,IDCLIENTE,IDVENDEDOR,PRAZO) VALUES
 (91,260,11,20),
 (97,720,101,20),
 (98,410,209,20),
 (101,720,101,15),
 (103,260,11,20),
 (104,110,101,30),
 (105,180,240,15),
 (108,290,310,15),
 (111,260,240,20),
 (119,390,250,30),
 (121,410,209,20),
 (127,410,11,10),
 (137,720,720,20),
 (138,260,11,20),
 (143,20,111,30),
 (148,720,101,20),
 (189,870,213,15),
 (203,830,250,30);

INSERT INTO PRODUTO_PEDIDO (IDPEDIDO,IDPRODUTO,QUANTIDADE) VALUES
 (91,77,40),
 (97,77,20),
 (98,77,5),
 (101,13,5),
 (101,31,9),
 (101,78,18),
 (103,53,37),
 (104,53,32),
 (105,78,10),
 (108,13,17),
 (111,25,10),
 (111,78,70),
 (119,13,6),
 (119,22,10),
 (119,53,43),
 (119,77,40),
 (121,25,10),
 (121,31,35),
 (137,13,8),
 (138,22,10),
 (138,53,18),
 (138,77,35),
 (143,31,20),
 (143,78,10),
 (148,25,10),
 (148,31,7),
 (148,45,8),
 (148,77,3),
 (148,78,30),
 (189,78,45),
 (203,31,6);
