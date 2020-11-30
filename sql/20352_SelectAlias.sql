--1) Selecione o preço unitário dos produtos vendidos em março de 2020
select precounitario from
Produto p,
VendaProduto vp,
Venda v
where
p.idProduto = vp.idProdutoFK AND 
vp.idvendaFK = v.idVenda AND
month(v.datavenda)=3 and year(v.datavenda)=2020

--2) Some a quantidade de produtos vendidos em fevereiro de 2020
select SUM(qtvendida) as total from
VendaProduto vp,
Venda v
where
vp.idvendafk = v.idvenda AND month(v.datavenda)=2 AND year(v.datavenda)=2020

--3) Selecione o nome dos vendedores que venderam o produto 'Apontador'
select nomevendedor from
Vendedor vd,
Venda v,
VendaProduto vp,
Produto p
where
vd.idvendedor = v.idVendedorFK AND
v.idvenda = vp.idVendaFK AND
vp.idProdutoFK = p.idproduto AND
nome='Apontador'

--4) Selecione o nome dos produtos vendidos em fevereiro de 2020
select nome from 
Produto p,
Venda v,
VendaProduto vp
where
p.idproduto = vp.idprodutofk AND
vp.idvendafk = v.idvenda AND
month(v.datavenda)=2 and year(v.datavenda)=2020

--5)  Selecione a data das vendas do produto Caderno
select datavenda from
Venda v,
VendaProduto vp,
Produto p
where
v.idvenda = vp.idVendaFK AND
vp.idprodutofk = p.idproduto AND
nome='Caderno'

--6) Selecione o nome dos produtos vendidos pela vendedora Maria
select nome from
Produto p,
VendaProduto vp,
Venda v,
Vendedor vd
where
p.idproduto = vp.idprodutofk AND
vp.idvendafk = v.idvenda AND
v.idvendedorfk = vd.idvendedor AND
vd.nomevendedor = 'Maria'




