1
 select precounitario from Produto where idProduto in(
  select idProdutoFK from VendaProduto where idVendaFK in (
    select idVendaFK from Venda where month(dataVenda)=3 and year(dataVenda)=2020))
  
2
 select SUM(qtvendida) as totalProdutosVendidos from VendaProduto where qtvendida in(
  select qtvendida from VendaProduto where idVendaFK in (
   select idVenda from Venda where month(dataVenda)=2 and year(dataVenda)=2020))

3
 select nomeVendedor from Vendedor where idVendedor in(
   select idVendedorFK from Venda where idVenda in(
     select idVendaFK from VendaProduto where idProdutoFK in(
       select idProduto from Produto where nome='Lápis')))

4
 select nome from Produto where idProduto in(
  select idProdutoFK from VendaProduto where idVendaFK in (
   select idVenda from Venda where month(dataVenda)=2 and year(dataVenda)=2020))

5
 select dataVenda from Venda where idVenda in(
   select idVendaFK from VendaProduto where idProdutoFK in(
     select idProduto from Produto where nome='Caderno'))

6
 select max(precounitario) from Produto

7
 select nome from Produto where idProduto in(
  select idProdutoFK from VendaProduto where idVendaFK in(
    select idVenda from Venda where idVendedorFK in(
      select idVendedor from Vendedor where nomeVendedor='Maria')))

8
 select avg(precounitario) from Produto