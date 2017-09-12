/* Todos os códigos das views serão adicionados aqui */
/**
 * View para selecionar a quantidade de usuários cadastrados por mês
 * @author Daniel Moreira Cardoso
 */
 
 CREATE VIEW `quantidade_de_usuarios_por_mes` AS
    (SELECT 
        DATE_FORMAT(`usuarios`.`data_cadastro`, '%M/%Y') AS `Mês_Ano`,
        COUNT(*) AS `Quantidade de novos usuários`
    FROM
        `usuarios`
    GROUP BY `Mês_Ano`
    ORDER BY `usuarios`.`data_cadastro`);
	
/**
 * View para selecionar a quantidade de comentários do usuário
 * @author Gusttavo Nunes Gomes
 */
 CREATE VIEW quantidade_de_comentarios_do_usuario AS
	(SELECT
		`usuarios`.`nome` AS `Usuário`,
		COUNT(*) AS `Qtde. Comentários`
		
	FROM 
		((usuarios 
		INNER JOIN `postagens` ON `usuarios`.`id` = `postagens`.`usuario`)
		INNER JOIN `comentarios` ON `comentarios`.`postagem` = `postagens`.`id`)
	GROUP BY `usuarios`.`id`
	ORDER BY `Qtde. Comentários`);
    
/**
 * View para selecionar os aportes mais "upados"
 * @author Andrey Silva Ribeiro
 */
 CREATE VIEW aportes_mais_upados AS
	(SELECT
		`postagens`.`curtidas` AS `Quantidade de UPs`,
        `aportes`.`titulo` AS `Titulo do aporte`
	FROM 
		(postagens
        INNER JOIN `aportes` ON `postagens`.`id` = `aportes`.`postagem`)
	GROUP BY `aportes`.`titulo`
    ORDER BY `postagens`.`curtidas` desc);
    
/**
 * View da quantidade de usuários por sexo
 * @author Andrey Silva Ribeiro
 */
 CREATE VIEW quantidade_usuario_sexo AS
 SELECT sexo, count(sexo) AS `Qtde. Usuarios por sexo`
 FROM usuarios
 GROUP BY sexo
 ORDER BY sexo desc;
 
/**
 * View para mostrar os aportes mais visualizados
 * @author Jônatas de Souza Rezende
 */
CREATE VIEW aportes_mais_visualizados AS
SELECT ap.id AS id_aporte, titulo AS titulo_do_aporte, post.visualizacoes AS quantidade_de_visualizacoes 
FROM aportes ap
INNER JOIN postagens post ON ap.postagem = post.id
ORDER BY post.visualizacoes DESC
LIMIT 1;

/**
 * View para mostrar a quantidade de usuários por estado
 * @author Jônatas de Souza Rezende
 */
CREATE VIEW usuarios_por_estado AS
SELECT est.nome AS Estado, pai.nome AS Pais, COUNT(est.nome) AS Qtde
FROM usuarios us
INNER JOIN cidades cid ON us.cidade = cid.id
INNER JOIN estados est ON cid.estado = est.id
INNER JOIN paises pai ON est.pais = pai.id
GROUP BY est.nome
ORDER BY est.nome;

/**
 * View para mostrar a quantidade de vezes que uma palavra-chave foi usada nas postagens
 * @author Thalia Santos de Santana
 */
create view palavra_chave_postagem as
select palavras_chave.descricao as 'Palavra-chave', count(palavras_chave.descricao) as 'Quantidade' from palavras_chave
inner join postagens_palavras_chave on postagens_palavras_chave.palavra_chave = palavras_chave.id
inner join postagens on postagens_palavras_chave.postagem = postagens.id 
group by palavras_chave.descricao 
order by palavras_chave.descricao desc;

/**
 * View para mostrar a quantidade de vezes que uma palavra-chave foi usada nos aportes
 * @author Thalia Santos de Santana
 */
create view palavra_chave_aporte as
select palavras_chave.descricao as 'Palavra-chave', count(palavras_chave.descricao) as 'Quantidade' from palavras_chave
inner join postagens_palavras_chave on postagens_palavras_chave.palavra_chave = palavras_chave.id
inner join postagens on postagens_palavras_chave.postagem = postagens.id 
inner join aportes on postagens_palavras_chave.postagem = aportes.postagem
group by palavras_chave.descricao 
order by palavras_chave.descricao desc;