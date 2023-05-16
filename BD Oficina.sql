-- criação do banco de dados para o cenário de ecommerce

create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table cliente (
idClient int auto_increment primary key,
Fname varchar (10),
Minit char(3),
Lname varchar(20),
CPF char(11) not null,
Address varchar(30),
constraint unique_cpf_cliente unique (CPF)
);

desc cliente;

-- criar tabela Serviços
create table service (
idService int auto_increment primary key,
Fname varchar(30) not null,
serDescription varchar(255),
classification_kids bool default false,
avaliação float default 0,
);

-- criar tabela Payment
create table payment (
idclient int,
idpayment int,
typePayment ('Boleto', 'Cartão', 'Dois Cartões'),
limitAvailable float default 10,
paymentCash bool default false,
primary key(idClient, id_payment)
);

-- criar tabela Ordem de Serviço
create table orderservice (
idOrderService int auto_increment primary key,
idOrdersServiceClient int,
orderServiceStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
orderServeciDescription varchar(255),
sendValue float default 10,
paymentCash boolean default false,
constraint fk_orders_client foreign key (idOrderServiceClient) references cliente(idclient)
);

-- criar tabela Equipe
create table Team (
idTeam int auto_increment primary key,
idTeamName varchar(45) not null,
adress varchar(45) not null,
especialist varchar(45) not null,
contraint unique_team_name unique (idTeamName),
contraint unique_team_adress unique (adress),
contraint unique_team_especialist unique (especialist),
);

-- criar tabela Veiculo
create table Movel (
idMovel int auto_increment primary key,
idplaca varchar(10) not null,
idmodel varchar(30) not null,
idMarca varchar(30) not null,
idCor varchar(15) not null,
idcombustivel enum('Diesel', 'Alcool', 'Gasolina', 'Gás', 'Elétrico') not null,
idcategory enum('carro', 'caminhão', 'quadricículo') not null,
);


create table orcamento (
idOrcamento int,
idResponsavel int,
);

