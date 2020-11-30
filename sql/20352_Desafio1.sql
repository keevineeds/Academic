--store procedure de inclusão na tabela cargo
create proc inclusao_sp
@idCargo int,
@nomeCargo varchar(50),
@salarioBase money 
as
if(@idCargo is not null and @nomeCargo is not null and @salarioBase is not null)
	begin
		insert into Cargo values(@idCargo, @nomeCargo, @salarioBase)
	end
else
	begin
		print ('Preencha todos os parâmetros')
	end 

--inclusão com a sp
inclusao_sp 8, 'Estagiário', 2500.00

--trigger
alter trigger insteadOfDelete_tg on cargo
instead of delete 
as
if exists (select * from Funcionario where idCargo = 1)
 begin
	update Funcionario set idCargo = 8 where idCargo = 1
	delete from Cargo where idCargo = 1
	print ('Cargo deletado!')
 end

--delete
delete from cargo where idCargo = 1
select * from cargo
select * from funcionario

