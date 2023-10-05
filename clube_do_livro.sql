-- CRIANDO A TABELA LIVROS
create table LIVROS (
ID_LIVRO INT NOT NULL,
NOME_LIVRO varchar(100) NOT NULL,
AUTORIA varchar(100) NOT NULL,
EDITORA VARCHAR(100) NOT NULL,
CATEGORIA varchar(100) NOT NULL,
PRECO decimal(5,2) NOT NULL,

primary key (ID_LIVRO)
);

-- CRIANDO A TABELA DE ESTOQUE
create table ESTOQUE(
ID_LIVRO INT NOT NULL,
QTD_ESTOQUE INT NOT NULL,

primary key (ID_LIVRO)
);

-- CRIANDO A TABELA VENDAS
create table VENDAS (
ID_PEDIDO INT NOT NULL,
ID_VENDEDOR INT NOT NULL,
ID_LIVRO INT NOT NULL,
QTD_VENDIDA INT NOT NULL,
DATA_VENDA DATE NOT NULL,

primary key (ID_VENDEDOR, ID_PEDIDO)
);

-- CRIANDO A TABELA VENDEDORES
create table VENDEDORES(
ID_VENDEDOR INT NOT NULL,
NOME_VENDEDOR varchar(255) NOT NULL,

primary key (ID_VENDEDOR)
);

-- Alterar a chave estrangeira da tabela ESTOQUE referenciando da tabela LIVROS a chave primária ID_LIVRO
ALTER table ESTOQUE ADD constraint CE_ESTOQUE_LIVROS
foreign key (ID_LIVRO)
references LIVROS (ID_LIVRO)
ON delete NO ACTION
ON update NO action;

-- DESATIVAR A CHAVE ESTRANGEIRA
SET FOREIGN_KEY_CHECKS = 0;

-- INSERIR DADOS NUMA TABELA (livro em LIVROS)
INSERT INTO livros VALUE(
1,
"Percy Jackson e o Ladrão de Raios",
"Rick Riordan",
"Intríseca",
"Aventura",
34.65
);

-- INSERIR VÁRIOS DADOS DE UMA SÓ VEZ NUMA TABELA (livro em LIVROS)
INSERT INTO livros VALUE
(2,    'A Volta ao Mundo em 80 Dias',    'Júlio Verne',         'Principis',     'Aventura',    21.99),
(3,    'O Cortiço',                     'Aluísio de Azevedo',  'Panda Books',   'Romance',    47.8),
(4,    'Dom Casmurro',                     'Machado de Assis',    'Via Leitura',   'Romance',    19.90),
(5,    'Memórias Póstumas de Brás Cubas',    'Machado de Assis',    'Antofágica',    'Romance',    45),
(6,    'Quincas Borba',                 'Machado de Assis',    'L&PM Editores', 'Romance',    48.5),
(7,    'Ícaro',                             'Gabriel Pedrosa',     'Ateliê',          'Poesia',    36),
(8,    'Os Lusíadas',                     'Luís Vaz de Camões',  'Montecristo',   'Poesia',    18.79),
(9,    'Outros Jeitos de Usar a Boca',    'Rupi Kaur',          'Planeta',          'Poesia',    34.8);

-- INSERIR DADOS NA TABELA VENDEDORES
INSERT INTO VENDEDORES VALUES
(1,'Paula Rabelo'),
(2,'Juliana Macedo'),
(3,'Roberto Barros'),
(4,'Barbara Jales');

-- INSERIR DADOS NA TABELA VENDAS
INSERT INTO VENDAS VALUES 
(1, 3, 7, 1, '2020-11-02'),
(2, 4, 8, 2, '2020-11-02'),
(3, 4, 4, 3, '2020-11-02'),
(4, 1, 7, 1, '2020-11-03'),
(5, 1, 6, 3, '2020-11-03'),
(6, 1, 9, 2, '2020-11-04'),
(7, 4, 1, 3, '2020-11-04'),
(8, 1, 5, 2, '2020-11-05'),
(9, 1, 2, 1, '2020-11-05'),
(10, 3, 8, 2, '2020-11-11'),
(11, 1, 1, 4, '2020-11-11'),
(12, 2, 10, 10, '2020-11-11'),
(13, 1, 12, 5, '2020-11-18'),
(14, 2, 4, 1, '2020-11-25'),
(15, 3, 13, 2,'2021-01-05'),
(16, 4, 13, 1, '2021-01-05'),
(17, 4, 4, 3, '2021-01-06'),
(18, 2, 12, 2, '2021-01-06');

-- INSERIR DADOS NA TABELA ESTOQUE
INSERT INTO ESTOQUE VALUES
(1,  7),
(2,  10),
(3,  2),
(8,  4),
(10, 5),
(11, 3),
(12, 3);

-- INSERINDO INFORMAÇÕES FORA DE ORDEM
INSERT INTO LIVROS 
(CATEGORIA, AUTORIA, NOME_LIVRO, EDITORA, ID_LIVRO, PRECO)
VALUES
('Biografia' ,    'Malala Yousafzai', 'Eu sou Malala'       , 'Companhia das Letras', 11, 22.32),
('Biografia' ,    'Michelle Obama'  , 'Minha história'      , 'Objetiva'            ,    12,    57.90),
('Biografia' ,    'Anne Frank'      , 'Diário de Anne Frank', 'Pe Da Letra'         , 13, 34.90);

-- PARA SELECIONAR OS ELEMENTOS DE UMA TABELA
select * FROM LIVROS;

-- PARA SELECIONAR UM CAMPO DA MINHA TABELA E RENOMEAR O QUE SERÁ APRESENTADO EM TELA
select ID_LIVRO AS "CÓDIGO DO LIVRO",
 NOME_LIVRO  FROM LIVROS;
 
-- SELECIONAR USANDO O WHERE PARA FAZER UM FILTRO 
select * FROM livros
WHERE CATEGORIA = "BIOGRAFIA";

-- UMA TABELE COM OS ROMANCES QUE CUSTAM MENOS DE 48 REAIS.
select * FROM livros
WHERE CATEGORIA = "ROMANCE" AND PRECO < 48;

-- POESIAS QUE NÃO SÃO NEM DE LUÍS VAZ DE CAMÕES E NEM DE GABRIEL PEDROSA.
select * FROM livros
WHERE CATEGORIA = "POESIA" AND NOT (AUTORIA = "Luís Vaz de Camões" OR AUTORIA = "GABRIEL PEDROSA");
;

-- VERIFICAÇÃO USANDO O DISTINCT
select * FROM VENDAS;
select distinct ID_LIVRO FROM VENDAS
where ID_VENDEDOR = 1
ORDER BY ID_LIVRO;

-- RETIRAR UM DADO DE UMA TABELA
delete FROM livros 
WHERE ID_LIVRO = 8;

-- ALETRAR INFORMAÇÕES COM O UPDATE DE UMA TABELA
update LIVROS 
SET PRECO = 0.9 * PRECO;

-- USANDO O GROUP BY PARA AGRUPAR TABELAS
SELECT VENDAS.ID_VENDEDOR, vendedores.NOME_VENDEDOR, SUM(vendas.QTD_VENDIDA)
FROM VENDAS, vendedores
where VENDAS.ID_VENDEDOR = vendedores.ID_VENDEDOR
group by vendas.ID_VENDEDOR;

-- USANDO O INNER JOIN PARA UNIR AS TABELAS
select 
	VENDAS.ID_VENDEDOR, 
    VENDEDORES.NOME_VENDEDOR, 
    SUM(VENDAS.QTD_VENDIDA)
FROM VENDAS INNER JOIN VENDEDORES 
ON VENDAS.ID_VENDEDOR = VENDEDORES.ID_VENDEDOR
group by VENDAS.ID_VENDEDOR;

-- SABER A MAIOR VENDA DO CLUBE DO LIVRO
select MAX(QTD_VENDIDA) 
FROM VENDAS;

 -- SABER A MAIOR VENDA POR CÓDIGO DE PESSOA VENDEDORA
SELECT MAX(QTD_VENDIDA) FROM VENDAS
GROUP BY(ID_VENDEDOR);

-- TRAZER INFORMAÇÕES À ESQUERDA E À DIREITA DE UMA TABELA QDO COMPARADA
select livros.NOME_LIVRO,
	   vendas.QTD_VENDIDA
FROM LIVROS LEFT JOIN VENDAS
ON LIVROS.ID_LIVRO = VENDAS.ID_LIVRO
WHERE VENDAS.QTD_VENDIDA IS NULL;

select  vendas.ID_LIVRO,
		livros.NOME_LIVRO,
		vendas.QTD_VENDIDA
FROM LIVROS RIGHT JOIN VENDAS
ON LIVROS.ID_LIVRO = VENDAS.ID_LIVRO;

