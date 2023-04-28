-- 1) Apresentar os clientes que compraram Chocolate.
SELECT c.NOME FROM cliente c JOIN pedido p ON c.IDCLIENTE = p.IDCLIENTE 
							 JOIN produto_pedido pp ON p.IDPEDIDO = pp.IDPEDIDO
							 JOIN produto po ON pp.IDPRODUTO = po.IDPRODUTO
							 WHERE po.descricao = "Chocolate";

-- 2) Apresentar os produtos com valor abaixo de 1.00.
SELECT DESCRICAO, VALOR FROM produto
WHERE produto.VALOR < 1.00;

-- 3) Apresentar todas a compras efetuadas para clientes de São Paulo.
SELECT c.NOME FROM cliente c JOIN pedido p ON c.IDCLIENTE = p.IDCLIENTE
							 WHERE c.CIDADE = "São Paulo";

-- 4) Apresentar os vendedores venderam ouro.
SELECT v.NOME, po.DESCRICAO FROM vendedor v JOIN pedido p ON v.IDVENDEDOR = p.IDVENDEDOR
											JOIN produto_pedido pp ON p.IDPEDIDO = pp.IDPEDIDO
											JOIN produto po ON pp.IDPRODUTO = po.IDPRODUTO
											WHERE po.DESCRICAO = "Ouro";
						 

-- 5) Apresentar os clientes que compraram do vendedor 'Josias'.
SELECT c.NOME FROM cliente c JOIN pedido p ON c.IDCLIENTE = p.IDCLIENTE
							 JOIN vendedor v ON p.IDVENDEDOR = v.IDVENDEDOR
							 WHERE v.NOME = "Josias";


-- 6) Apresentar os clientes que compraram mais de 20 Vinhos no mesmo pedido.
SELECT c.NOME, pp.QUANTIDADE FROM cliente c JOIN pedido p ON c.IDCLIENTE = p.IDCLIENTE
											  JOIN produto_pedido pp ON p.IDPEDIDO = pp.IDPEDIDO
											  JOIN produto po ON pp.IDPRODUTO = po.IDPRODUTO
											  WHERE po.DESCRICAO = "Vinho" and pp.QUANTIDADE >= 20;

-- 7) Apresentar os clientes que compraram Chocolate e Queijo no mesmo pedido.
SELECT c.NOME FROM cliente c JOIN pedido p ON c.IDCLIENTE = p.IDCLIENTE
										  JOIN produto_pedido pp ON p.IDPEDIDO = pp.IDPEDIDO
										  JOIN produto po ON pp.IDPRODUTO = po.IDPRODUTO
										  WHERE po.DESCRICAO = "Chocolate" OR po.DESCRICAO = "Queijo"								
NOT IN ( SELECT pp.IDPRODUTO FROM cliente c 
										  JOIN pedido p ON c.IDCLIENTE = p.IDCLIENTE
										  JOIN produto_pedido pp ON p.IDPEDIDO = pp.IDPEDIDO
                                          JOIN produto po ON pp.IDPRODUTO = po.IDPRODUTO
                                          WHERE pp.IDPRODUTO = "31" and pp.IDPRODUTO = "25"
                                          );
									

-- 8) Apresentar os vendedores que apenas venderam ouro.
-- 9) Apresentar os clientes que compraram Vinho porém não compraram Açúcar.