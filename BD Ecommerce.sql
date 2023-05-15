-- criação do banco de dados para o cenário de ecommerce

create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table Cliente (
idClient int auto_increment primary key;
Fname varchar (10),
Minit char(3),
Lname varchar(20),
CPF char(11) not null,
Address varchar(30),
constraint unique_cpf_cliente unique (CPF)
);

-- criar tabela produto
-- size = dimensão do produto
create table Product (
idProduct int auto_increment primary key;
Fname varchar (10),
classification_kids bool,
category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
Avaliação float default 0,
size varchar(10),
constraint unique_cpf_cliente unique (CPF);
);

-- criar tabela Payment
-- para ser continuado no desafio: termine de implementar a tabela e crie a conexão com as tabelas necessárias
-- além disso, reflita essa modificação no diagrama de esquema relacional
-- criar contraint relacionado a pagamento
create table payment (
idclient int,
idpayment int,
typePayment ('Boleto', 'Cartão', 'Dois Cartões'),
limitAvailable float default 10,
paymentCash bool default false,
primary key(idClient, id_payment)
);

-- criar tabela Order
create table Orders (
idOrder int auto_increment primary key,
idOrdersClient int,
ordersStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
orderDescription varchar(255),
sendValue float default 10,
idpayment enum
constraint fk_orders_client foreign key (idOrderClient) references client(idclient);
);

-- criar tabela Estoque
create table ProductStorage (
idProductStorage int auto_increment primary key,
storageLocation varchar(255),
quantity int default 0,
);

-- criar tabela Fornecedor
create table Supplier (
idSupplier int auto_increment primary key,
SocialName varchar(255) not null,
CNPJ varchar(15) not null,
Contato varchar(11) not null,
contraint unique_supplier unique (CNPJ)
);

-- criar tabela Vendedor
create table Seller (
idSeller int auto_increment primary key,
SocialNmae varchar(255) not null,
AbstractName varchar(255),
CNPJ char(15),
CPF char (9),
location varchar(255),
contact chat(11) not null,
constraint unique_cnpj_seller unique (CNPJ),
constraint unique_cpf_seller unique (CPF),
);


create table productseller (
idPseller int,
idPproduct int,
prodQuantity int default 1,
primary ke (idPseller, idProduct),
constraint fk_product_seller foreign key (idPseller) references seler(idSeller),
constraint fk_product_product foreign key (idProduct) references product(idProduct),
);

create table productOrder (
idPOproduct int,
idPOorder int,
poQuantity int default 1,
poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
primary key (idPOproduct, idPOorder),
contraint fk_product_seller foreign key (idPOproduct) references product(idProduct),
contraint fk_product_product foreign key (idPOorder) references orders(idOrder)
);

create table storagelocation(
idLproduct int,
idLstorage int,
location varchar(255) not null,
primary key (idLproduct, idLstorage),
constraint fk_product_seller foreign key (idLproduct) references product(idProduct),
constraint fk_product_product foreign key (idLstorage) references orders(productSeller)
);