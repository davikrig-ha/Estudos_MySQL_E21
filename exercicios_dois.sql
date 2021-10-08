create database exercicios;

use exercicios;

CREATE TABLE PAI(
    CODIGO int(18) NOT NULL PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL
);

CREATE TABLE MAE(
    CODIGO int(18) NOT NULL PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL
);

CREATE TABLE FILHO(
    CODIGO int(18) NOT NULL PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL,
    PAI_CODIGO int(18),
    MAE_CODIGO int(18),
    FOREIGN KEY (PAI_CODIGO) REFERENCES PAI (CODIGO),
    FOREIGN KEY (MAE_CODIGO) REFERENCES MAE (CODIGO)
);

INSERT INTO MAE (CODIGO, NOME)
VALUES (1, 'Maria');

INSERT INTO MAE (CODIGO, NOME)
VALUES (2, 'Joana');

INSERT INTO MAE (CODIGO, NOME)
VALUES (3, 'Gabriela');

INSERT INTO MAE (CODIGO, NOME)
VALUES (4, 'Juliana');

INSERT INTO MAE (CODIGO, NOME)
VALUES (5, 'Marina');


INSERT INTO PAI (CODIGO, NOME)
VALUES (1, 'Alfredo');

INSERT INTO PAI (CODIGO, NOME)
VALUES (2, 'Joaquim');

INSERT INTO PAI (CODIGO, NOME)
VALUES (3, 'Juca');

INSERT INTO PAI (CODIGO, NOME)
VALUES (4, 'Juliano');

INSERT INTO PAI (CODIGO, NOME)
VALUES (5, 'Moacir');


INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (1, 'Zézinho', 2, 1);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (2, 'Tuca', null, 1);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (3, 'Jucelino', 3, 1);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (4, 'Marcelo', 4, 3);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (5, 'Chiquinha', 1, 4);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (6, 'Margarida', null, null);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (7, 'Rosa', 5, 5);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (8, 'Murilo', 1, 4);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (9, 'Rodrigo', 2, 2);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (10, 'Gustavo', 1, 2);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (11, 'Leônidas', 3, 3);

COMMIT;



select nome, IF(PAI_CODIGO >= 0, 'Tem Pai', 'Não Tem Pai') as Pai , 
IF(MAE_CODIGO >= 0 , 'Tem Mãe' , 'Não Tem Mãe') As Mae
from FILHO;

SELECT NOME as 'Nome do Filho' , 
CASE 
WHEN MAE_CODIGO is null then 'não tem mãe'
when MAE_CODIGO = 1  then 'Maria'
when MAE_CODIGO = 2  then 'Joana'
when MAE_CODIGO = 3  then 'Gabriela'
when MAE_CODIGO = 4  then 'Juliana'
when MAE_CODIGO = 5  then 'Marina'
end as 'Nome da Mãe'
FROM FILHO;


SELECT f.NOME as 'Nome do Filho',
m.NOME as 'Nome da Mãe',
CASE 
WHEN f.PAI_CODIGO is null then 'não tem pai'
when f.PAI_CODIGO = 1  then 'Alfredo'
when f.PAI_CODIGO = 2  then 'Joaquim'
when f.PAI_CODIGO = 3  then 'Juca'
when f.PAI_CODIGO = 4  then 'Juliano'
when f.PAI_CODIGO = 5  then 'Moacir'
end as 'Nome do pai'
FROM FILHO f 
inner join MAE m 
on f.MAE_CODIGO = m.CODIGO;


 SELECT COUNT(*) as 'Numero de Filhos que não tem pai ou mãe' 
FROM FILHO where PAI_CODIGO is NULL;

SELECT p.NOME, COUNT(f.CODIGO) as Qtd_Filhos from FILHO f 
inner join PAI p
on f.PAI_CODIGO = p.CODIGO GROUP by p.NOME;

SELECT f.nome, m.nome 
from FILHO f
inner join MAE m
on f.MAE_CODIGO = m.CODIGO 
order by m.NOME;

SELECT nome 
from FILHO
WHERE MAE_CODIGO = 3 or MAE_CODIGO = 4;

select nome
from FILHO 
where PAI_CODIGO in (1 , 2 , 5);
 
SELECT  p.NOME, COUNT(*) AS Qtd_Filhos
FROM FILHO f 
INNER JOIN PAI p  ON f.PAI_CODIGO = p.CODIGO
GROUP BY PAI_CODIGO HAVING COUNT(*) > 1 
union
SELECT  m.NOME, COUNT(*) AS Qtd_Filhos
FROM FILHO f 
INNER JOIN MAE m ON f.MAE_CODIGO = m.CODIGO
GROUP BY MAE_CODIGO HAVING COUNT(*) > 1;

SELECT m.NOME as Nome_Mae, p.NOME as Nome_Pai, COUNT(*)
from FILHO f 
inner join PAI p on f.PAI_CODIGO = p.CODIGO
inner join MAE m on f.MAE_CODIGO = m.CODIGO 
GROUP by MAE_CODIGO, PAI_CODIGO;

SELECT m.NOME as Nome_Mae, p.NOME as Nome_Pai, COUNT(*),
CASE
WHEN m.NOME = 'Juliana' and p.NOME = 'Alfredo' THEN 'Tem um casal'
ELSE 'Tem um filho' 
END AS Observacao
from FILHO f 
inner join PAI p on f.PAI_CODIGO = p.CODIGO
inner join MAE m on f.MAE_CODIGO = m.CODIGO 
GROUP by MAE_CODIGO, PAI_CODIGO;


 SELECT COUNT(*) as 'Numero de Filhos que não tem pai e mãe' 
FROM FILHO where PAI_CODIGO is NULL and MAE_CODIGO is null;

select * from MAE;

SELECT  f.NOME as Filho, p.NOME as Pai 
from FILHO f
inner join PAI p 
on f.PAI_CODIGO = p.CODIGO
where f.NOME LIKE '%ri%'
order by p.NOME DESC;

SELECT NOME, CHARACTER_LENGTH(NOME) as quantidade_Letras
FROM PAI
order by NOME ASC;

	SELECT NOME, 'Filho sem pais' AS Pai FROM FILHO
WHERE PAI_CODIGO IS NULL
UNION 
SELECT NOME, 'Filho com pai' FROM FILHO
WHERE PAI_CODIGO IS NOT NULl;