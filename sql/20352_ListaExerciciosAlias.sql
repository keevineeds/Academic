--1) Crie as tabelas e insira os registros

create table Especializacao(
  codEspecializacao int primary KEY,
  nome varchar(30) not null)
  
create table Medico(
  codMedico int primary key,
  nome varchar(100) not null,
  codEspecializacaoFK int not null,
  constraint fkcodEspecializacao 
  foreign key(codEspecializacaoFK)
  references Especializacao(codEspecializacao),
  CRM varchar(8) not null)
  
create table Paciente(
  codPaciente int primary key,
  nome varchar(50) not null,
  endereco varchar(100) not null,
  cidade varchar(50) not null,
  UF char(2) not null,
  dataNascimento datetime not null,
  telefone varchar(20))
  
create table Consulta(
  codConsulta int primary key,
  codMedicoFK int not null
  constraint fkcodMedico
  foreign key(codMedicoFK)
  references Medico(codMedico),
  codPacienteFK int not null
  constraint fkcodPaciente
  foreign key(codPacienteFK)
  references Paciente(codPaciente),
  dataConsulta datetime not null,
  descricao varchar(200) not null)

insert into Especializacao values(1, 'Clínica Geral')
insert into Especializacao values(2, 'Obstetrícia')
insert into Especializacao values(3, 'Psiquiatria')
insert into Especializacao values(4, 'Reumatologia')

insert into Medico values(1, 'Carlos de Barros', 2, '98989-54')
insert into Medico values(2, 'Rodrigo Coimbra', 1, '92943-67')
insert into Medico values(3, 'Paulo Costa', 4, '80343-46')
insert into Medico values(4, 'João Pedro Mattos', 3, '95343-15')

insert into Paciente values(1, 'José Silva', 'Rua X, 25', 'Campinas', 'SP', '1968/08/22', '3256-8923')
insert into Paciente values(2, 'Carlos Bueno', 'Rua A, 14', 'Campinas', 'SP', '1978/07/05', '3231-3545')
insert into Paciente values(3, 'Regina Saldanha', 'Rua C, 35', 'Sumaré', 'SP', '2000/10/14', '3865-3431')
insert into Paciente values(4, 'Silvia Oliveira', 'Rua F, 38', 'Campinas', 'SP', '1985/09/06', '3276-3822')
insert into Paciente values(5, 'Teresa Martin', 'Rua G, 87', 'Sumaré', 'SP', '1999/04/02', '3865-2943')
insert into Paciente values(6, 'Cristina Sales', 'Rua O, 98', 'Sumaré', 'SP', '1985/07/20', '3865-1984')
insert into Paciente values(7, 'Fernando Freitas', 'Rua J, 89', 'Campinas', 'SP', '1998/02/06', '3252-4587')
insert into Paciente values(8, 'Raquel Monteiro', 'Rua W, 32', 'Santa Rita de Cássia', 'MG', '1940/01/19', '(45)343-4627')

insert into Consulta values(1, 2, 5, '2018/12/31', 'Gripe')
insert into Consulta values(2, 3, 1, '2019/03/23', 'Reumatismo')
insert into Consulta values(3, 2, 3, '2019/05/16', 'Dor de cabeça')
insert into Consulta values(4, 2, 7, '2019/05/27', 'Dor de cabeça')
insert into Consulta values(5, 1, 6, '2019/05/29', 'Parto')
insert into Consulta values(6, 4, 2, '2019/07/26', 'Depressão')
insert into Consulta values(7, 2, 5, '2019/08/17', 'Hipotireoidismo')
insert into Consulta values(8, 4, 4, '2019/09/25', 'Depressão')
insert into Consulta values(9, 3, 8, '2019/10/10', 'Dores nas pernas')

--2) Selecione quantas consultas foram realizadas no ano de 2019 pelo médico Carlos de Barros.

select COUNT (c.codconsulta) as 'Quantidade de consultas' FROM
Consulta c,
Medico m
WHERE
c.codmedicofk = m.codmedico AND
m.nome = 'Carlos de Barros'
and year(c.dataconsulta) = 2019


--3) Selecione o ano do nascimento dos pacientes que se consultaram com um especialista em obstetrícia.

select p.datanascimento as 'Data de nascimento' FROM
Paciente p,
Consulta c,
Medico m,
Especializacao esp 
WHERE
p.codpaciente = c.codpacientefk AND
c.codmedicofk = m.codmedico AND
m.codespecializacaofk = esp.codespecializacao AND
esp.nome = 'Obstetrícia'


--4)Selecione o nome e telefone dos pacientes NÃO moradores da cidade de Campinas que fizeram uma consulta com um especialista em reumatologia.

select p.nome as 'Nome do paciente', p.telefone as 'Telefone do paciente' FROM
Paciente p,
Consulta c,
Medico m,
Especializacao esp 
WHERE
p.cidade != 'Campinas' AND
p.codpaciente = c.codpacientefk AND
c.codmedicofk = m.codmedico AND
m.codespecializacaofk = esp.codespecializacao AND
esp.nome = 'Reumatologia'

--5)Selecione o nome do médico, nome da especialização e nome do paciente de todas as consultas realizadas em julho de 2019. Ordene por data de consulta.

select m.nome as 'Nome do médico', esp.nome as 'Nome da especialização', p.nome as 'Nome do paciente' FROM
Medico m,
Especializacao esp,
Paciente p,
Consulta c
WHERE
esp.codespecializacao = m.codespecializacaofk AND
m.codmedico = c.codmedicofk AND
c.codpacientefk = p.codpaciente AND
month(c.dataconsulta) = 7 AND year(c.dataconsulta) = 2019
order by c.dataconsulta

--6) Selecione o nome do paciente, seu telefone e o nome do seu médico de todas as consultas cujo relato foi dor de cabeça como descrição da doença. Ordene pelo nome do paciente.

select p.nome as 'Nome do paciente', p.telefone as 'Telefone do paciente', m.nome as 'Nome do médico' FROM
Medico m,
Paciente p,
Consulta c
WHERE
m.codmedico = c.codmedicofk AND
c.descricao = 'Dor de cabeça' AND
c.codpacientefk = p.codpaciente 
order by p.nome