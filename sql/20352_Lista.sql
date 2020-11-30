--1) Crie a tabela Item e insira os registros

create table Item(
idItem int primary key,
nome varchar(50) not null,
valorUnitario money not null,
qtdeEstoque int not null)

insert into Item values(1, 'PlayStation 4', 3000.00, 10)
insert into Item values(2, 'Notebook i7', 6000.00, 20)
insert into Item values(3, 'Xbox', 2000.00, 3)
insert into Item values(4, 'Smartphone Galaxy S20', 4900.00, 40)
insert into Item values(5, 'PlayStation 2', 500.00, 1)
insert into Item values(6, 'Sofá Estofado', 8000.00, 16)
insert into Item values(7, 'Refrigerador Frost Free', 4500.00, 20)
insert into Item values(8, 'Fogão 6 bocas', 2500.00, 10)
insert into Item values(9, 'Mesa de jantar', 7000.00, 5)


--2) crie a tabela Fabricante e insira os registros

create table Fabricante(
idFabricante int primary key,
nome varchar(10) not null)

insert into Fabricante values (1, 'Sony')
insert into Fabricante values (2, 'Dell')
insert into Fabricante values (3, 'Microsoft')
insert into Fabricante values (4, 'Samsung')
insert into Fabricante values (5, 'Apple')
insert into Fabricante values (6, 'Móveis Trevisan')
insert into Fabricante values (7, 'Brastemp')

--3) Altere o tamanho do varchar(10) da coluna nome da tabela Fabricante para varchar(50)

alter table Fabricante
alter column nome varchar(50)

--4) Crie a tabela Categoria e insira os registros

create table Categoria(
idCategoria int primary key,
nome varchar(50) not null)

insert into Categoria values(1, 'Game')
insert into Categoria values(2, 'Computador')
insert into Categoria values(3, 'Smartphone')
insert into Categoria values(4, 'Móvel')
insert into Categoria values(5, 'Eletrodoméstico')

/*--5) Adicione os campos idFabricante e idCategoria na tabela Item como chaves 
estrangeiras e altere os valores dos respectivos campos para os registros 
já existentes conforme tabela abaixo.
*/

alter table Item
add idFabricante int null

alter table Item 
add idCategoria int null

alter table Item
add constraint fkidFabricante 
foreign key(idFabricante) 
references Fabricante(idFabricante)

alter Table Item 
add constraint fkidCategoria
foreign key(idCategoria)
references Categoria(idCategoria)

update Item set idFabricante = 1, idCategoria = 1 where idItem = 1
update Item set idFabricante = 2, idCategoria = 2 where idItem = 2
update Item set idFabricante = 3, idCategoria = 1 where idItem = 3
update Item set nome = 'iPhone 11', valorUnitario = 4000.00, qtdeEstoque = 6, idFabricante = 5, idCategoria = 3 where idItem = 4
update Item set idFabricante = 1, idCategoria = 1 where idItem = 5
update Item set idFabricante = 6, idCategoria = 4 where idItem = 6
update Item set idFabricante = 7, idCategoria = 5 where idItem = 7
update Item set idFabricante = 7, idCategoria = 5 where idItem = 8
update Item set idFabricante = 6, idCategoria = 4 where idItem = 9
insert into Item values(10, 'Smartphone Galaxy S20', 4900.00, 40, 4, 3)

/*--6) Selecione o nome do item, nome do fabricante e nome da categoria de
todos os itens que custam entre 4000.00 e 1000.00.
*/

select i.nome as 'Nome do item', f.nome as 'Nome do fabricante', c.nome as 'Nome da categoria' from
Categoria c,
Fabricante f,
Item i
where
c.idCategoria = i.idCategoria and
f.idFabricante = i.idFabricante and
i.valorUnitario between 1000.00 and 4000.00

--7) Selecione todos os itens da categoria Game que custam abaixo de 2100.00

select i.nome as 'Nome do produto' from
Item i,
Categoria c
where
i.idCategoria = c.idCategoria and
c.nome = 'Game' and
i.valorUnitario < 2100.00

--8) Selecione o nome do fabricante de todos os itens que contenham a string ‘Play’.

select distinct f.nome as 'Nome do fabricante' from
Fabricante f,
Item i
where
f.idFabricante = i.idFabricante and
i.nome like 'Play%'

--9) Exclua da tabela Item todos os registros da fabricante Apple.

DELETE FROM Item WHERE idFabricante in(select idFabricante from Fabricante where nome = 'Apple')