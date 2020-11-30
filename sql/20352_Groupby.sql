--1)Selecione a soma do valor unit�rio de cada item agrupando essa soma pelo fabricante do item
select f.nome as 'Nome do fabricante', sum(i.valorUnitario) as 'Soma do valor unit�rio' from
fabricante f,
item i
where 
i.idFabricante = f.idFabricante
group by f.nome

--2)Selecione a m�dia do valor unit�rio de cada item agrupando essa m�dia pela categoria do item
select c.nome as 'Categoria', avg(i.valorUnitario) as 'M�dia do valor unit�rio' from
categoria c,
item i
where 
i.idCategoria = c.idCategoria
group by c.nome

--3)Selecione a soma total em estoque de cada item agrupando por fabricante
select f.nome as 'Nome do fabricante', sum(i.qtdeEstoque) as 'Quantidade de estoque' from
fabricante f,
item i
where 
i.idFabricante = f.idFabricante
group by f.nome

--4)Selecione a m�dia em estoque de cada item agrupando por categoria
select c.nome as 'Nome do fabricante', avg(i.valorUnitario) as 'M�dia da quantidade de estoque' from
categoria c,
item i
where 
i.idCategoria = c.idCategoria
group by c.nome