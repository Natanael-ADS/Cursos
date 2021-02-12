CREATE DATABASE mercado_economico;

CREATE TABLE departamento(
  codigo smallint(4) primary key auto_increment, 
  nome varchar(255)
  );
CREATE TABLE cargo(
  codigo smallint(4) primary key auto_increment,
  nome varchar(255),
  salario numeric(7,2), 
  codigoDepartamento smallint(4)
  );
CREATE TABLE empregados(
  codigo smallint(4) primary key auto_increment, 
  cpf varchar(11),
  nome varchar(255),
  codCargo smallint(4),
  ajusteSalario numeric(7,2)
  );


