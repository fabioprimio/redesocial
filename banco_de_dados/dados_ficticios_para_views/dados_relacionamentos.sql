/*Inserção de país*/
INSERT INTO `paises`(nome) VALUES ('Brasil');
/*Inserção de Estado*/
INSERT INTO `estados`(nome,pais) VALUES ('Goiás',1);
/*Inserção de Cidade*/
INSERT INTO `cidades`(nome,estado) VALUES ('Itapuranga',1);
/*Inserção de 20 usuários*/
INSERT INTO `usuarios` (nome, email, senha, data_nascimento, sexo, data_cadastro, status, cidade) VALUES 
							/* 5 usuários relacionados*/
							('Daniel','qualquer','batata','1999-01-06','M','2017-09-05 15:38:37',1,1),
							('Pedro','qualquer','batata','1999-01-06','M','2017-09-05 15:38:48',1,1),
							('Augusto','qualquer','batata','1999-01-06','M','2017-09-05 15:38:49',1,1),
							('Joao','qualquer','batata','1999-01-06','M','2017-09-05 15:38:49',1,1),
							('Antonio','qualquer','batata','1999-01-06','M','2017-09-05 15:38:49',1,1);


/*Inserção de tipos de relacionamento*/
INSERT INTO `tipos`(nome) VALUES
	('Amizade'),
    ('Conhecido');

/*Inserção de relacionamento*/
INSERT INTO `relacionamentos`(usuario_1, usuario_2, tipo) VALUES 
	(1,2,1),
	(1,3,1),
    (1,4,1),
    (3,2,2),
    (2,5,2);
