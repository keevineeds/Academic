create table Autor(
idAutor int primary key,
nomeAutor varchar(50) not null)

create table Receita(
idReceita int primary key,
nomeReceita varchar(50) not null,
descricaoReceita varchar(200) not null,
idAutorReceita int not null,
dataCriacaoReceita datetime not null,
constraint idAutorReceita foreign key(idAutorReceita)
references Autor(idAutor))

create table Ingrediente(
idIngrediente int primary key,
nomeIngrediente varchar(50) not null,
precoIngrediente money not null)

create table Medida(
idMedida int primary key,
descricaoMedida varchar(50) not null)

create table ItemReceita(
idItemReceita int primary key,
idReceita int not null,
idIngrediente int not null,
idMedida int not null,
Quantidade int not null,
constraint idReceita foreign key(idReceita) 
references Receita(idReceita),
constraint idIngrediente foreign key(idIngrediente) 
references Ingrediente(idIngrediente),
constraint idMedida foreign key(idMedida) 
references Medida(idMedida))





insert into Autor values(1, 'Erick Jacquin')
insert into Autor values(2, 'Alex Atala')
insert into Autor values(3, 'Paola Carosella')


insert into Receita values(1, 'Creme Brûlé', 'Abra e raspe o interior das favas de baunilha.
Coloque na panela junte com o leite e o creme de leite...', 1, '10/04/2018')

insert into Receita values(2, 'Empanadas Argentinas', 'Misture as farinhas Amorne a água,
misture com o azeite e óleo. Acrescente o sal e o vinagre...', 3, '10/05/2019')

insert into Receita values(3, 'Galinhada', 'Corte a galinha em pedaços pequenos e pique os temperos.
Misture os pedaços da galinha aos temperos e deixe marinando por 24 horas...', 2, '28/07/2019')

insert into Receita values(4, 'Bolo de Castanha', 'Aqueça o forno em fogo baixo, bata o açúcar e as
gemas até ficarem esbranquiçadas...', 2, '12/06/2019')

insert into Receita values(5, 'Panquecas com caviar', 'Mexa os ovos em uma tigela. Coloque a farinha 
e misture bem. Acrescente o leite e o óleo e siga misturando até ficar homogêneo. Ponha a manteiga,
o vinho branco e o sal e mexa novamente...', 1, '11/07/2019')

insert into Receita values(6, 'Frango na cerveja Belgian Golden Ale', 'Tempere o frango com sal e pimenta.
Reserve. Bata no liquidificador o alho, cebola, tomilho e pimenta de cheiro. Em uma tigela, coloque uma 
garrafa de cerveja, os temperos batidos e misture...', 2, '15/08/2019')


insert into Ingrediente values(1, 'Cebola', 1.00)
insert into Ingrediente values(2, 'Sal', 0.50)
insert into Ingrediente values(3, 'Sobrecoxa de frango', 3.50)
insert into Ingrediente values(4, 'Vinho branco', 10.40)
insert into Ingrediente values(5, 'Baunilha', 45.00)
insert into Ingrediente values(6, 'Ovo', 2.00)
insert into Ingrediente values(7, 'Açúcar', 1.50)
insert into Ingrediente values(8, 'Castanha do Pará', 3.50)
insert into Ingrediente values(9, 'Farinha de Trigo', 1.50)
insert into Ingrediente values(10, 'Leite', 1.50)
insert into Ingrediente values(11, 'Azeite', 4.50)
insert into Ingrediente values(12, 'Vinagre', 0.45)
insert into Ingrediente values(13, 'Óleo', 0.30)
insert into Ingrediente values(14, 'Caviar', 100.00)
insert into Ingrediente values(15, 'Cerveja', 30.00)
insert into Ingrediente values(16, 'Tomate', 1.00)
insert into Ingrediente values(17, 'Bacalhau Defumado da Noruega', 1500.00)
insert into Ingrediente values(18, 'Manjericão', 0.50)


insert into Medida values (1, 'Copo americano')
insert into Medida values (2, 'Xícara')
insert into Medida values (3, 'Colher de sopa')
insert into Medida values (4, 'Colher de sobremesa')
insert into Medida values (5, 'Colher de chá')
insert into Medida values (6, 'Colher de café')
insert into Medida values (7, 'Cálice')
insert into Medida values (8, 'Unidade')


insert into ItemReceita values(1, 1, 5, 3, 1)
insert into ItemReceita values(2, 1, 6, 8, 1)
insert into ItemReceita values(3, 1, 7, 2, 1)
insert into ItemReceita values(4, 1, 10, 2, 3)
insert into ItemReceita values(5, 2, 1, 8, 1)
insert into ItemReceita values(6, 2, 2, 6, 1)
insert into ItemReceita values(7, 2, 6, 8, 3)
insert into ItemReceita values(8, 2, 9, 2, 4)
insert into ItemReceita values(9, 2, 11, 3, 2)
insert into ItemReceita values(10, 2, 12, 3, 1)
insert into ItemReceita values(11, 2, 13, 2, 1)
insert into ItemReceita values(12, 3, 1, 8, 1)
insert into ItemReceita values(13, 3, 2, 6, 2)
insert into ItemReceita values(14, 3, 3, 8, 5)
insert into ItemReceita values(15, 3, 11, 3, 2)
insert into ItemReceita values(16, 3, 12, 3, 1)
insert into ItemReceita values(17, 3, 13, 2, 1)
insert into ItemReceita values(18, 4, 8, 8, 5)
insert into ItemReceita values(19, 4, 6, 8, 1)
insert into ItemReceita values(20, 4, 7, 2, 1)
insert into ItemReceita values(21, 4, 10, 2, 1)
insert into ItemReceita values(22, 4, 9, 2, 1)
insert into ItemReceita values(23, 5, 14, 2, 1)
insert into ItemReceita values(24, 5, 2, 6, 1)
insert into ItemReceita values(25, 5, 6, 8, 3)
insert into ItemReceita values(26, 5, 9, 2, 2)
insert into ItemReceita values(27, 5, 11, 3, 2)
insert into ItemReceita values(28, 5, 13, 2, 1)
insert into ItemReceita values(29, 5, 10, 2, 1)
insert into ItemReceita values(30, 5, 4, 7, 1)
insert into ItemReceita values(31, 6, 3, 2, 2)
insert into ItemReceita values(32, 6, 2, 6, 1)
insert into ItemReceita values(33, 6, 6, 8, 3)
insert into ItemReceita values(34, 6, 11, 3, 2)
insert into ItemReceita values(35, 6, 13, 2, 1)
insert into ItemReceita values(36, 6, 15, 1, 1)

select * from itemReceita


--ex 1
select a.nomeAutor, r.nomeReceita, i.nomeIngrediente, m.descricaoMedida, it.Quantidade
as 'Quantidade de ingredientes'
from Autor a
inner join receita r on a.idAutor = r.idAutorReceita
inner join itemReceita it on it.idReceita = r.idReceita
inner join ingrediente i on i.idIngrediente = it.idIngrediente
inner join medida m on m.idMedida = it.idMedida
order by a.nomeAutor


--ex 2
select a.nomeAutor, count(r.idAutorReceita) as 'Receitas criadas'
from autor a 
inner join receita r on a.idAutor = r.idAutorReceita
group by a.nomeAutor


--ex 3
select distinct i.nomeIngrediente as 'Ingredientes não utilizados' from ingrediente i, itemReceita it
where i.idIngrediente NOT IN(select it.idIngrediente from itemReceita it)


--ex 4
select m.descricaoMedida as 'Descrições não utilizadas' from medida m
where m.idMedida NOT IN(select it.idMedida from itemReceita it)

select m.descricaomedida from medida m 
left join itemReceita it on m.idMedida = it.idMedida
where it.idMedida is null


--ex 5
select i.nomeIngrediente, i.idIngrediente as 'qntd total', m.descricaoMedida
from Ingrediente i
inner join ItemReceita it on i.idIngrediente = it.idIngrediente
inner join Medida m on it.idMedida = m.idMedida
group by i.nomeIngrediente


--ex 6
--inner join
select r.nomeReceita, i.nomeIngrediente, it.Quantidade, m.descricaoMedida
from Receita r
inner join ItemReceita it on r.idReceita = it.idReceita
inner join Ingrediente i on it.idIngrediente = i.idIngrediente
inner join Medida m on it.idMedida = m.idMedida
group by r.nomeReceita, i.nomeIngrediente, it.Quantidade, m.descricaoMedida

--alias
select r.nomeReceita, i.nomeIngrediente, it.Quantidade, m.descricaoMedida from
receita r, 
ingrediente i,
itemReceita it,
medida m
where
r.idReceita = it.idReceita and
it.idIngrediente = i.idIngrediente and
it.idMedida = m.idMedida
ORDER BY r.nomeReceita


--ex 7 
select distinct max(r.nomeReceita) as 'Receitas com maior número de ingredientes' from receita r 
inner join ItemReceita it on r.idReceita = it.idReceita
inner join Ingrediente i on it.idIngrediente = i.idIngrediente


--ex 8 
select distinct r.nomeReceita from Receita r 
inner join ItemReceita it on r.idReceita = it.idReceita
inner join Ingrediente i on it.idIngrediente = i.idIngrediente	 
group by r.nomeReceita
having sum(i.precoIngrediente) <= 50


--ex 9 
alter table Ingrediente 
add constraint chk_precoIngrediente check(precoIngrediente >= 0.20)


--ex 10
alter table Receita 
add nota int

alter table Receita 
add constraint chk_valor check (nota >= 0 and nota <= 10)

update Receita
set nota = 9 where idReceita = 1

update Receita
set nota = 11 where idReceita = 1


