create database punxBay
default character set utf8
default collate utf8_general_ci;

use punxBay;

/*Tabela que registra os usuários do sistema. */
CREATE TABLE usuario(
    id_usuario SERIAL PRIMARY KEY,
    nome varchar(60),
    username varchar(10)
);

/* Tipos de contato. */
CREATE TABLE tipo_contato(
    id_tipo_contato SERIAL PRIMARY KEY,
    tipo_contato varchar(60)
);

/* Registros dos contatos cadastrados. */
CREATE TABLE contato(
    id_contato SERIAL PRIMARY KEY,
    fk_id_usuario integer not null,
    fk_id_tipo_contato integer not null,
    contato varchar(50)
);

/* Listagem dos eventos cadastrados na plataforma.  */
CREATE TABLE evento(
    id_evento SERIAL PRIMARY KEY,
    nome varchar(60),
    fk_id_usuario integer not null,
    data_evento date,
    descricao_evento varchar(1000),
    valor float(10),
    fk_id_endereco integer not null
);

/* Bancas de merch cadastradas no market-place. */
CREATE TABLE banquinha(
    id_banquinha SERIAL PRIMARY KEY,
    nome varchar(60),
    fk_id_usuario integer not null
);

/* */
CREATE TABLE estoque_banquinha(
    id_estoque SERIAL PRIMARY KEY,
    fk_id_banquinha integer not null
);

/* */
CREATE TABLE tipo_produto(
    id_tipo_produto SERIAL PRIMARY KEY,   
    descricao_tipo_produto varchar(50)
);

/* */
CREATE TABLE produto(
    id_produto SERIAL PRIMARY KEY,
    nome_produto varchar(250),
    fk_id_tipo_produto integer not null,
    descricao_produto varchar (140),
    fk_id_banquinha integer not null,
    valor_produto float(10) not null, 
    quantidade_produto integer NOT NULL DEFAULT 0
);

/* */
CREATE TABLE rua(
    id_rua SERIAL PRIMARY KEY,
    nome varchar(60),
    cep float(10)
);

/* */
CREATE TABLE bairro(
    id_bairro SERIAL PRIMARY KEY,
    nome varchar(60)
);

/* */
CREATE TABLE cidade(
    id_cidade SERIAL PRIMARY KEY,
    nome varchar(60)
);

/* */
CREATE TABLE estado(
    id_estado SERIAL PRIMARY KEY,
    nome varchar(60),
    UF varchar(2)
);

/* */
CREATE TABLE endereco(
    id_endereco SERIAL PRIMARY KEY,
    fk_id_rua integer not null,
    numero_local integer,
    referencia varchar(250),
    fk_id_cidade integer not null,
    fk_id_bairro integer not null,
    fk_id_estado integer not null
);

/* */
CREATE TABLE dados_bancarios(
    id_dados_bancarios SERIAL PRIMARY KEY,
    fk_id_usuario integer not null,
    numero_cartao varchar(10),
    codigo_verificacao varchar(4)
);

/* */
CREATE TABLE forma_pagamento(
    id_forma_pagamento SERIAL PRIMARY KEY,
    forma_pagamento varchar(50)
);


/* */
CREATE TABLE item_pedido(
    fk_id_pedido integer not null,
    quantidade integer not null,
    fk_id_produto integer not null
);

/* */
CREATE TABLE pedido(
    id_pedido SERIAL PRIMARY KEY,
    fk_id_usuario integer not null,
    data_pedido DATE,
    fk_id_forma_pagamento integer not null
);

INSERT INTO usuario (nome, username ) 
VALUES 
('Francisco Guilherme Siqueira Viana', 'chicogui'),
('Vitor Lima siqueira' , 'xvitaox'),
('Naldolfo gente boa' , 'nandolfoxx'),
('Heitor Riguette' , 'tozila'),
('cliente um da silva' , 'cliente1'),
('Cliente 2 gomes' , 'cliente2'),
('cliente 3 oliveira' , 'cliente3'),
('cliente 4 soares' , 'cliente4'),
('Cliente 5 nunes' , 'cliente5'),
('Cliente 6 bragatto' , 'cliente6'),
('Cliente 7 moreira' , 'cliente7'),
('Cliente 8 gomes' , 'cliente8');

INSERT INTO tipo_contato( tipo_contato) 
VALUES 
('email'),
('celular'),
('fixo');

INSERT INTO contato(fk_id_usuario, fk_id_tipo_contato, contato) 
VALUES 
(1, 1, 'chicogui@email.com'),
(2, 1, 'vitor@email.com'),
(3, 1, 'naldolfo@email.com'),
(4, 1, 'heitor@email.com'),
(5, 1, 'cliente1@email.com'),
(6, 1, 'cliente2@email.com'),
(7, 1, 'cliente3@email.com'),
(8, 1, 'cliente4@email.com'),
(9, 1, 'cliente5@email.com'),
(10, 1, 'cliente6@email.com'),
(11, 1, 'cliente7@email.com'),
(12, 1, 'cliente8@email.com');


INSERT INTO evento(nome, fk_id_usuario, data_evento, descricao_evento, valor, fk_id_endereco) 
VALUES 
('SotãoLab Apresenta nº 1', '1', '2020-01-04', 'Show com as bandas antilyrical, histona e tarde mais densa', '10.00', '1'),
('Matilha punx Apresenta nº 1', '2', '2020-01-11', 'Show com as bandas Prayana, esclerose e dhumavathi', '15.00', '2'),
('SotãoLab Apresenta nº 2', '1', '2020-02-15', 'Show com as bandas antilyrical, Ment, Loyal Gun e Horace green', '20.00', '5'),
('Tour PunkFx', '1', '2020-03-04', 'Show com as bandas Ment(SP), Loyal Gun(SP) e Horace Green(SP)', '20.00', '3'),
('Girls Attack', '1', '2020-04-04', 'Show com as bandas Bioma(SP), Hayz(SP), Whatever Hapenned to Baby Jane', '20.00', '4'),
('Lupe de Lupe', '2', '2020-04-11', 'Show com as bandas Lupe de Lupe(BH)', '20.00', '4');

INSERT INTO banquinha(nome, fk_id_usuario) 
VALUES 
('antilyrical store', 1),
('matilha punx', 2),
('prayana', 3),
('subtrópico', 4);

INSERT INTO estoque_banquinha(fk_id_banquinha) 
VALUES 
(1),
(2),
(3),
(4);

INSERT INTO tipo_produto(descricao_tipo_produto) 
VALUES 
('camisa'),
('moleton'),
('boné'),
('patch'),
('CD'),
('LP/Vinil'),
('ecobag'),
('palheta'),
('meia'),
('shape');

INSERT INTO produto(fk_id_tipo_produto, nome_produto, descricao_produto, fk_id_banquinha, valor_produto, quantidade_produto) 
VALUES 
(1, 'camiseta logotipo', "100% algodão. nas cores pretas e rosa", 1, 20.00, 10),
(1, 'camiseta capa ep antilyrical', "100% algodão. nas cores pretas e rosa", 1, 30.00, 10),
(1, 'camiseta logotipo 2016', "100% algodão. nas cores pretas e rosa", 3, 20.00, 10),
(1, 'camiseta logotipo 2018', "100% algodão. nas cores pretas e rosa", 3, 20.00, 10),
(1, 'camiseta capa split', "100% algodão. nas cores pretas e rosa", 3, 30.00, 10),
(3, 'boné logotipo', "boné trucker, nas cores preto e vinho", 1, 50.00, 10),
(5, 'demo 2020', "Demo antilyrical 2020", 1, 5.00, 50),
(3, 'ep antilyrical', "antilyrical ep 2020 6 músicas", 1, 10.00, 100),
(4, 'patch lettering', "patch bordado", 1, 10.00, 20),
(4, 'patch logotipo', "patch bordado", 1, 10.00, 20),
(4, 'patch lettering', "patch bordado", 3, 10.00, 20),
(4, 'patch logotipo', "patch bordado", 3, 10.00, 20),
(4, 'patch lettering', "patch bordado", 4, 10.00, 20),
(4, 'patch logotipo', "patch bordado", 4, 10.00, 20),
(1, 'camiseta logotipo', "100% algodão. nas cores pretas, branca e azul", 4, 20.00, 10),
(10, 'shape Deriva', "shape marfim. pintura hanfmade", 1, 80.00, 10);


INSERT INTO rua(nome, cep) 
VALUES 
('rua um', '11111111'),
('rua dois', '22222222'),
('rua três', '33333333'),
('rua quatro', '44444444'),
('rua cinco', '55555555'),
('rua seis', '66666666'),
('rua sete', '77777777'),
('rua oito', '88888888'),
('rua nove', '99999999'),
('rua dez', '10101010'),
('rua onze', '11111111'),
('rua doze', '12121212');

INSERT INTO bairro(nome) 
VALUES 
('centro'),
('jucutuquara'),
('conqueiral de itaparica'),
('laranjeiras'),
('itacibá'),
('Campo grande');

INSERT INTO cidade(nome) 
VALUES 
('Cariacica'),
('Vitória'),
('Serra'),
('Vila Velha'),
('São paulo');

INSERT INTO estado(nome, UF) 
VALUES 
('Espirito Santo', 'ES'),
('Rio de Janeiro', 'RJ' ),
('São Paulo', 'SP'),
('Minas Gerais', 'MG');

INSERT INTO endereco(fk_id_rua, numero_local, referencia, fk_id_bairro, fk_id_cidade, fk_id_estado) 
VALUES 
(1, 410, 'referencia pico 1', 1, 2, 1),
(2, 410, 'referencia pico 2', 1, 2, 1),
(3, 410, 'referencia pico 3', 2, 2, 1),
(4, 410, 'referencia pico 4', 2, 2, 1),
(5, 410, 'referencia pico 5', 5, 1, 1),
(6, 410, 'referencia pico 6', 6, 1, 1);


INSERT INTO dados_bancarios(fk_id_usuario, numero_cartao, codigo_verificacao) 
VALUES 
(1, 11111111, 111),
(2, 22222222, 222),
(3, 33333333, 333),
(4, 44444444, 444),
(5, 55555555, 555),
(6, 66666666, 666),
(7, 77777777, 777),
(8, 88888888, 888),
(9, 99999999, 999),
(10, 10101010, 100);

INSERT INTO forma_pagamento(forma_pagamento) 
VALUES 
('débito a vista'),
('crédito a vista'),
('crédito parcelado'),
('boleto bancario'),
('pic pay');


/* */
INSERT INTO item_pedido( Fk_id_pedido, quantidade, fk_id_produto)
VALUES
(1, 1, 1),
(1, 1, 2),
(2, 1, 3),
(2, 1, 4),
(2, 1, 5),
(1, 2, 9),
(3, 1, 16),
(4, 1, 16),
(4, 1, 2),
(4, 1, 2);

INSERT INTO pedido(fk_id_usuario, data_pedido, fk_id_forma_pagamento)
VALUES
(6, NOW(), 1),
(7, NOW(), 1),
(5, NOW(), 1),
(8, NOW(), 4);

select * from usuario;
select * from tipo_contato;
select * from contato;
select * from evento;
select * from banquinha;
select * from estoque_banquinha;
select * from tipo_produto;
select * from produto;
select * from rua;
select * from bairro;
select * from cidade;
select * from estado;
select * from endereco;
select * from dados_bancarios;
select * from forma_pagamento;
select * from item_pedido;
select * from pedido;

SELECT COUNT(*) AS 'Total de Eventos cadastrados' FROM evento;
SELECT COUNT(*) AS 'Total de itens Cadastrados' FROM produto;
SELECT COUNT(*) AS 'Total de Usuários Cadastrados' FROM usuario;
SELECT COUNT(*) AS 'Total de Pedidos Realizados' FROM pedido;

/* 9.2 CONSULTAS DAS TABELAS COM FILTROS WHERE (Mínimo 4) */
/*Exibe eventos cadastrados no espirito santo*/ 
select * from endereco
where fk_id_estado = '1';

/*ecibes produtos da banquinha 1 - Antilyrical store */
select * from produto
where fk_id_banquinha= '1';

/*exibe todos os produtos do tipo 1, camisa*/
select * from produto
where fk_id_tipo_produto= '1';

/*mostra todos os eventos cadastrados por vitor*/
select * from evento
where fk_id_usuario = '2';


/*9.3 CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E TABELAS OU CAMPOS RENOMEADOS (Mínimo 11)*/
/*a) Criar 5 consultas que envolvam os operadores lógicos AND, OR e Not*/

/*Selecionar  todas as camisetas da banquinha 1, antilyrycal store */
select * from produto
where fk_id_tipo_produto= '1' and fk_id_banquinha = '1';

/*Selecionar todas os produtos antilyrycal store que custam 30 reais ou menos*/
select * from produto
where valor_produto <= '20.00' and fk_id_banquinha = '1';

/*Seleciona todas os produtos do tipo 1(camiseta) que estejam ou na banquinha antilyrical ou prayana*/
select nome_produto as "Produto", descricao_produto as "detalhes" from produto
where fk_id_tipo_produto = '1' and fk_id_banquinha = '1' or fk_id_banquinha = '3';


/*b) Criar no mínimo 3 consultas com operadores aritméticos*/
/*seleciona todos os eventos que custam 20reais ou menos*/
select * from evento 
where valor <= '20.00';

/*Filtra os produtos na faixa de preços de 20 à 50 reais*/
select * from produto 
where valor_produto >= 20 and valor_produto <= '50.00';

/*Filtra todos os produtos cujo valor é menor que 50 reais*/
select * from produto 
where valor_produto <= '50.00';

/*c) Criar no mínimo 3 consultas com operação de renomear nomes de campos ou tabelas*/
SELECT nome_produto as 'produto disponível', descricao_produto as 'Detalhes do produto' FROM produto; 

/*9.4 CONSULTAS QUE USAM OPERADORES LIKE E DATAS (Mínimo 12)*/
/*a) Criar outras 5 consultas que envolvam like ou ilike*/
SELECT * FROM produto WHERE nome_produto LIKE '%camiseta%';

/*b) Criar uma consulta para cada tipo de função data apresentada.*/
    
/*9.5 ATUALIZAÇÃO E EXCLUSÃO DE DADOS (Mínimo 6)*/

/*atualizando o valor do shape deriva de 80 para 100 reais*/
UPDATE produto
SET valor_produto = 100
WHERE id_produto = 16;

/*alterando endereço de email referente ao usuário de id 5"*/
UPDATE contato
SET contato = 'cliente1@gmail.com'
WHERE id_contato = 5;


/*9.6 CONSULTAS COM JUNÇÃO E ORDENAÇÃO (Mínimo 6)*/

/*Junção de 6 tabelas, trazendo informações completas sobre evento*/
SELECT evento.nome as "evento", usuario.nome as "criado por", evento.descricao_evento as "detalhes do evento", DATE_FORMAT( evento.data_evento, "%d/%m/%Y" ) AS "data", rua.nome as "rua", endereco.referencia as "ponto de referência", bairro.nome as "bairro", cidade.nome as "cidade", estado.nome as "estado" 
FROM evento
inner join usuario
on evento.fk_id_usuario = usuario.id_usuario
inner join endereco
on evento.fk_id_endereco = endereco.id_endereco
inner join rua
on endereco.fk_id_rua = rua.id_rua
inner join bairro
on endereco.fk_id_bairro = bairro.id_bairro
inner join cidade
on endereco.fk_id_cidade = cidade.id_cidade
inner join estado
on endereco.fk_id_estado = estado.id_estado;

/*Junção de 5 tabelas, trazendo todos os enderecos completos*/
SELECT rua.nome as "rua", endereco.referencia as "ponto de referência", bairro.nome as "bairro", cidade.nome as "cidade", estado.nome as "estado" 
FROM endereco
inner join rua
on endereco.fk_id_rua = rua.id_rua
inner join bairro
on endereco.fk_id_bairro = bairro.id_bairro
inner join cidade
on endereco.fk_id_cidade = cidade.id_cidade
inner join estado
on endereco.fk_id_estado = estado.id_estado;

/* Lista todos os produtos cadastrados, seus detalhes, o nome da banquinha que está cadastrado e a quantidade inicial cadastrada e o valor de cada unidade*/
SELECT produto.nome_produto as "item", tipo_produto.descricao_tipo_produto as "categoria de produto", produto.descricao_produto as "Detalhes", banquinha.nome as "cadastrado em", produto.quantidade_produto as "quantidade cadastrada", produto.valor_produto as "valor unidade"
FROM produto 
inner join tipo_produto
on produto.fk_id_tipo_produto = tipo_produto.id_tipo_produto
INNER JOIN banquinha 
ON produto.fk_id_banquinha = banquinha.id_banquinha;

/*lista todos os item pedidos, exibindo o códido do pedido, o item e seus detalhes, valor unitário, quantidade solicitada e valor total*/
SELECT pedido.id_pedido, DATE_FORMAT( pedido.data_pedido, "%d/%m/%Y" ) AS "realizado em",produto.nome_produto as "item pedido", produto.descricao_produto as "Detalhes", item_pedido.quantidade as "quantidade", produto.valor_produto as 'valor unitário', (produto.valor_produto * QUANTIDADE) as "valor total"
FROM produto
INNER JOIN item_pedido
ON item_pedido.fk_id_produto = produto.id_produto
INNER JOIN pedido 
ON pedido.id_pedido = item_pedido.fk_id_pedido;

/*lista todos os item pedidos referentes a um pedido específico, neste casao com o pedido de id 1, exibindo o códido do pedido, o item e seus detalhes, valor unitário, quantidade solicitada e valor total*/
SELECT pedido.id_pedido, DATE_FORMAT( pedido.data_pedido, "%d/%m/%Y" ) AS "realizado em",produto.nome_produto as "item pedido", produto.descricao_produto as "Detalhes", item_pedido.quantidade as "quantidade", produto.valor_produto as 'valor unitário', (produto.valor_produto * QUANTIDADE) as "valor total"
FROM produto
INNER JOIN item_pedido
ON item_pedido.fk_id_produto = produto.id_produto
INNER JOIN pedido 
ON pedido.id_pedido = item_pedido.fk_id_pedido;

/*lista todos os item pedidos referentes a um pedido específico, neste casao com o pedido de id 1, exibindo o códido do pedido, o item e seus detalhes, valor unitário, quantidade solicitada e valor total, neste caso exibindo referente ao pedido de id 2*/
SELECT pedido.id_pedido as "Nº do pedido", DATE_FORMAT( pedido.data_pedido, "%d/%m/%Y" ) AS "realizado em",produto.nome_produto as "item pedido", produto.descricao_produto as "Detalhes", item_pedido.quantidade as "quantidade", produto.valor_produto as 'valor unitário', (produto.valor_produto * QUANTIDADE) as "valor total"
FROM produto
INNER JOIN item_pedido
ON item_pedido.fk_id_produto = produto.id_produto
INNER JOIN pedido 
ON pedido.id_pedido = item_pedido.fk_id_pedido
where pedido.id_pedido = '2';

/*Exibe o número do pedido, nome do usuário e o valor total do pedido, neste caso exibindo referente ao pedido de id 2*/
SELECT pedido.id_pedido as "Nº do pedido", DATE_FORMAT( pedido.data_pedido, "%d/%m/%Y" ) AS "realizado em", usuario.nome as "Cliente", sum( (produto.valor_produto * QUANTIDADE)) as "valor total"
FROM produto
INNER JOIN item_pedido
ON item_pedido.fk_id_produto = produto.id_produto
INNER JOIN pedido 
ON pedido.id_pedido = item_pedido.fk_id_pedido
inner join usuario
on pedido.fk_id_usuario = usuario.id_usuario
inner join forma_pagamento
on pedido.fk_id_forma_pagamento = forma_pagamento.id_forma_pagamento
where item_pedido.fk_id_pedido = '2';