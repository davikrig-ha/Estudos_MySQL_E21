create database exercicios;

use exercicios;

create table ALUNO (

nome varchar(20),
DataNascimento date,
sobrenome varchar(20),
endereco  varchar(20)

);

drop table aluno;

create table aluno (

nome           varchar(20),
sobrenome      varchar(20),
nome_do_pai    varchar(50),
nome_da_mae    varchar(50),
endereco       varchar(100),
numero_da_casa int(10),
nome_da_cidade varchar(40),
estado         varchar(2)
);

create table instituicao_ensino (

nome           varchar(100),
endereco       varchar(100),
razao_social   varchar(100),
telefone       int(12),
observacao     varchar(100)
);

alter table instituicao_ensino drop column observacao;

alter table instituicao_ensino add nome_reitor varchar(50);
alter table instituicao_ensino add nome_vice_reitor varchar(50);

alter table instituicao_ensino add data_inauguracao timestamp;

alter table instituicao_ensino drop column nome_reitor;
alter table instituicao_ensino drop column nome_vice_reitor;

create table professor (

nome           varchar(20),
titularidade   varchar(20),
endereco       varchar(50)
);

alter table professor drop column endereco;
alter table professor drop column salario_professor;





alter table professor add cidade_residencial varchar(50);
alter table professor add cidade_residencial varchar(50);
alter table professor add cidade_nascimento varchar(50);
alter table professor add salario_professor float;

ALTER TABLE professor modify column salario_professor float(999999.00);

rename table instituicao_ensino to faculdade;


create table departamento (

nome           varchar(100),
nome_presidente   varchar(100),
localizacao   varchar(100),
orcamento_mensal      float

);

rename table departamento to centro;



create table livro (
nome            varchar(50),
ano_publicacao  int,
autor           varchar(50),
paginas         int

);



INSERT INTO livro (nome, ano_publicacao, autor, paginas) 
VALUES ('Dom Quixote', 1605, 'Miguel de Cervantes', 378);

INSERT INTO livro (nome, ano_publicacao, autor, paginas) 
VALUES ('Guerra e Paz', 1869, 'Liev Tolstoi', 652);

INSERT INTO livro (nome, ano_publicacao, autor, paginas) 
VALUES ('A Montanha Mágica', 1924, 'Thomas Mann', 847);

INSERT INTO livro (nome, ano_publicacao, autor, paginas) 
VALUES ('Ulisses', 1922, 'James Joyce', 65);

INSERT INTO livro (nome, ano_publicacao, autor, paginas) 
VALUES ('Cem Anos de Solidão', 1967, 'Gabriel García Márquez', 987);

INSERT INTO livro (nome, ano_publicacao, autor, paginas) 
VALUES ('A Divina Comédia', 1321, 'Dante Alighieri', 587);

INSERT INTO livro (nome, ano_publicacao, autor, paginas) 
VALUES ('Em Busca do Tempo Perdido', 1913, 'Marcel Proust', 872);

INSERT INTO livro (nome, ano_publicacao, autor, paginas) 
VALUES ('O Som e a Fúria', 1929, 'William Faulkner', 254);

select * from livro where ano_publicacao > 1900;
select * from livro where ano_publicacao < 1605;
select * from livro where ano_publicacao >= 1967;
select * from livro where autor = 'Liev Tolstoi';
select * from livro where autor = 'James Joyce' or autor = 'Marcel Proust';
select * from livro where paginas >= 600;
select * from livro where paginas > 367 or ano_publicacao = 1605;
select * from livro where nome = 'Ulisses' and paginas >= 65;
select nome, ano_publicacao from livro;
select autor from livro where paginas > 400;
select * from livro where nome like '%Anos%' or autor like '%Liev%';
select * from livro where autor like '%w%';
select * from livro where nome like 'g%';
select nome, autor, ano_publicacao from livro;
select nome, ano_publicacao, (ano_publicacao - 2021) as idade, (ano_publicacao - 2000) as idade_2000 from livro;
select nome, autor , ano_publicacao from livro;

INSERT INTO livro (nome, ano_publicacao, autor, paginas) 
VALUES ('Chapeuzinho vermelho', 1899, 'Miguel De Cervantes',12 );

INSERT INTO livro (nome, ano_publicacao, autor, paginas) 
VALUES ('Dona florinda',1968 , 'Miguel De Cervantes', 59);

select autor, ano_publicacao from livro order by ano_publicacao desc;

alter table livro add volume int;

UPDATE livro SET volume = 1 WHERE nome = 'Dom Quixote';

UPDATE livro SET volume = 1 WHERE nome = 'Guerra e Paz';

UPDATE livro SET volume = 1 WHERE nome = 'A Montanha Mágica';

UPDATE livro SET volume = 1 WHERE nome = 'Ulisses';

UPDATE livro SET volume = 1 WHERE nome = 'Cem Anos de Solidão';

UPDATE livro SET volume = 1 WHERE nome = 'A Divina Comédia';

UPDATE livro SET volume = 1 WHERE nome = 'Em Busca do Tempo Perdido';

UPDATE livro SET volume = 1 WHERE nome = 'O Som e a Fúria';

UPDATE livro SET volume = 1 WHERE nome = 'Chapeuzinho vermelho';

UPDATE livro SET volume = 1 WHERE nome = 'Dona florinda';

alter table livro add data_edicao datetime;



UPDATE livro SET data_edicao = '2016-06-23' WHERE nome = 'Dom Quixote';

UPDATE livro SET data_edicao = '1989-02-28' WHERE nome = 'Guerra e Paz';

UPDATE livro SET data_edicao = '2015-02-01 14:25' WHERE nome = 'A Montanha Mágica';

UPDATE livro SET data_edicao = '1989-12-09' WHERE nome = 'Ulisses';

UPDATE livro SET data_edicao = '1902-08-29' WHERE nome = 'Cem Anos de Solidão';

UPDATE livro SET data_edicao = '1806-09-28' WHERE nome = 'A Divina Comédia';

UPDATE livro SET data_edicao = '2005-09-08' WHERE nome = 'Em Busca do Tempo Perdido';

UPDATE livro SET data_edicao = '2005-09-08' WHERE nome = 'O Som e a Fúria';

UPDATE livro SET data_edicao = '2005-09-08' WHERE nome = 'Chapeuzinho vermelho';

UPDATE livro SET data_edicao = '2005-09-08' WHERE nome = 'Dona florinda';

select nome, autor from livro order by data_edicao;

select nome, date_format(data_edicao, '%m/%y') data_edicao from livro;

SELECT autor FROM livro WHERE data_edicao BETWEEN '1989-01-01' AND '1989-12-31';


alter table livro MODIFY nome varchar(100) not null;

alter table livro MODIFY autor varchar(100) not null;

alter table livro MODIFY  data_edicao datetime not null;


INSERT INTO livro (nome, autor) 
VALUES ('Cem Anos de Solidão','Gabriel García Márquez');

INSERT INTO livro (nome, autor, data_edicao) 
VALUES ('Cem Anos de Solidão','Gabriel García Márquez', '1879-06-03');

select nome, date_format(data_edicao, '%y') data_edicao from livro order by data_edicao desc;

INSERT INTO livro (nome, data_edicao, autor) 
VALUES ('A volta dos que não foram','1789-01-01', 'Liev Tolstoi');

INSERT INTO livro (nome, data_edicao, autor) 
VALUES ('Poeira em alto mar','1809-01-01', 'Thomas Mann');

INSERT INTO livro (nome, data_edicao, autor) 
VALUES ('Grande visões de um cego','1968-01-01', 'James Joyce');

INSERT INTO livro (nome, data_edicao, autor) 
VALUES ('Lucidez de um louco','1709-01-01', 'Gabriel García Márquez');

select nome, data_edicao from livro where ano_publicacao = null;

UPDATE livro SET ano_publicacao = '1789' WHERE nome = 'A volta dos que não foram';

UPDATE livro SET ano_publicacao = '1809' WHERE nome = 'Poeira em alto mar';

UPDATE livro SET ano_publicacao = '1968' WHERE nome = 'Grande visões de um cego';

UPDATE livro SET ano_publicacao = '1709' WHERE nome = 'Lucidez de um louco';


UPDATE livro SET paginas = '100' WHERE nome = 'A volta dos que não foram';

UPDATE livro SET paginas = '100' WHERE nome = 'Poeira em alto mar';

UPDATE livro set paginas = '100' WHERE nome = 'Grande visões de um cego';

UPDATE livro SET paginas = '100' WHERE nome = 'Lucidez de um louco';

select distinct autor from livro;

select nome from livro where nome like '%a%';

SELECT SUM(paginas) AS 'Soma de Páginas' FROM livro where data_edicao > '2005-01-01';

alter table livro add valor float;

UPDATE livro SET valor = 35.99 WHERE autor =  'Miguel De Cervantes';

UPDATE livro SET valor = 35.99 WHERE autor =  'Liev Tolstoi';

UPDATE livro SET valor = 35.99 WHERE autor =  'Thomas Mann';

UPDATE livro SET valor = 12.89 WHERE nome =  'Em Busca do Templo Perdido';

UPDATE livro SET valor = 12.89 WHERE nome =  'O Som e a Fúria';

UPDATE livro SET valor = 12.89 WHERE nome =  'Chapeuzinho vermelho';

UPDATE livro SET valor = 12.89 WHERE nome =  'Dona florinda';

select * from livro;

UPDATE livro SET valor = 19.70 WHERE data_edicao <  '2006-01-01';

SELECT  AVG(valor) AS media_de_precos FROM livro;

SELECT nome FROM livro HAVING data_edicao < '2015-01-01';

SELECT nome, data_edicao
,IF(data_edicao > '2015-01-01', 'O livro é de no máximo dois anos', 'O livro é mais velho que dois') AS Observacao
FROM livro;

Select nome, count(volume) as quantidade from livro group by nome;

select DISTINCT date_format(data_edicao, '%m') data_edicao, COUNT(nome) as quantidade
from livro group by data_edicao;

SELECT nome
,IF(nome like '%a%' and '%e%' AND '%i%' AND '%o%' AND '%u%' , 'O livro não possue vogal', 'O livro possue vogal') AS Observacao
FROM livro;

SELECT nome, AVG(valor) as media 
,IF(nome like '%a%' and '%e%' AND '%i%' AND '%o%' AND '%u%' , 'O livro não possue vogal', 'O livro possue vogal') AS Observacao
FROM livro group by nome;


