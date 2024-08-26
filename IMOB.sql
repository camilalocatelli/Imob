create database imobiliaria_joao_de_barro;
use imobiliaria_joao_de_barro;

create table proprietario(
	cpf varchar(11) not null,
    nome varchar(50) not null,
    telefone varchar(15) not null,
    email varchar(30) not null,
    constraint pk_proprietario primary key (cpf)
);

create table sindico(
	matricula int(5) not null auto_increment,
    nome varchar(50) not null,
    endereco varchar(250) not null,
    telefone varchar(15) not null,
    constraint pk_sindico primary key (matricula)
);

create table condominio(
	codigo int(5) not null auto_increment,
    nome varchar(20) not null,
    endereco varchar(250) not null,
    matricula_sindico int(5) not null,
    constraint pk_condominio primary key (codigo),
    constraint fk_matri_sind foreign key (matricula_sindico) references sindico (matricula)
);

create table apartamento(
	numero int(5) not null,
    tipo varchar(9) not null,
    cpf_proprietario varchar(11) not null,
    codigo_condominio int(5) not null,
    constraint pk_apartamento primary key (numero),
    constraint fk_cpf_proprietario foreign key (cpf_proprietario) references proprietario (cpf),
    constraint fk_cod_cond foreign key (codigo_condominio) references condominio (codigo)
);

create table garagem(
	numero int(5) not null,
    constraint fk_garagem_apartamento foreign key (numero) references apartamento (numero)
);
