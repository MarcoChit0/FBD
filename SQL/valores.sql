-- perfis
insert into perfis(nome,email,pais,data_nascimento,numero_seguidores)
values ('David Bowie','blackstar@gmail.com','uk','1947-02-08',38219332);
insert into perfis(nome,email,pais,data_nascimento,numero_seguidores)
values ('New York Times','ny@times.com','us','1851-09-18',2340944);
insert into perfis(nome,email,pais,data_nascimento,numero_seguidores)
values ('Pink Floyd','anotheraccountinthegoogle@gmail.com','uk','1966-01-01',3090943);
insert into perfis(nome,genero,email,pais,data_nascimento,numero_seguidores)
values ('Amanda','F','amanda@gmail.com','br','1987-07-30',5);
insert into perfis(nome,genero,email,pais,data_nascimento,numero_seguidores)
values ('Cleberson Alves','M','clebinho@gmail.com','br','2003-02-02',1);
insert into perfis(nome,genero,email,pais,data_nascimento,numero_seguidores)
values ('Hannah','F','hhaann@gmail.com','us','2000-11-20',73);
insert into perfis(nome,genero,email,pais,data_nascimento,numero_seguidores)
values ('Cleiton Azevedo','M','cleitado@gmail.com','br','2000-10-03',41);
insert into perfis(nome,email,pais,data_nascimento,numero_seguidores)
values ('Jossoares','jo@gmail.com','br','1972-08-08',340934);
insert into perfis(nome,email,pais,data_nascimento,numero_seguidores)
values ('Taylor','taylor@capital.com','us','1995-05-05',4304334);
select * from perfis;


-- clientes
insert into clientes(id_perfil, proxima_fatura)
values(1,'2021-10-5');
insert into clientes(id_perfil, proxima_fatura)
values(2,'2021-10-5');
insert into clientes(id_perfil, proxima_fatura)
values(3,'2021-10-5');
insert into clientes(id_perfil, proxima_fatura)
values(9,'2021-10-5');
insert into clientes(id_perfil, proxima_fatura)
values(8,'2021-10-5');
insert into clientes(id_perfil, proxima_fatura)
values(6,'2021-10-5');
select * from clientes;


-- usuarios não pagantes
insert into usuarios_nao_pagantes 
values (5);
insert into usuarios_nao_pagantes 
values (7);
insert into usuarios_nao_pagantes 
values (4);
select * from usuarios_nao_pagantes;


-- criadores de conteúdo
insert into criadores
values(1, 'David Bowie');
insert into criadores
values(2, 'The Daily');
insert into criadores
values(3, 'Pink Floyd');
select * from criadores;


-- aúdios
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(3300000,'https://www.youtube.com/watch?v=fn1R-5p_j5c','Welcome to the Machine','00:07:43');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(17000000,'https://www.youtube.com/watch?v=tbdpv7G_PPg','Have A Cigar','00:05:07');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(223000000,'https://www.youtube.com/watch?v=IXdNnw99-Ic','Wish You Were Here','00:04:53');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(3000000,'https://www.youtube.com/watch?v=7KEn0uOEILs','Ziggy Stardust','00:03:13');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(245000,'https://www.youtube.com/watch?v=aDRi30GNFMc','The Bewlay Brothers','00:05:27');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(491000,'https://www.youtube.com/watch?v=bc-E78guBLI','Aladdin Sane','00:05:11');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(113000,'https://open.spotify.com/episode/3qMnfMUhAMEwPEOCyQPyQL','A Conversation With an Afghan General','00:46:24');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(114000,'https://open.spotify.com/episode/2CfUbHqXnuyXz3bMsLJBvr','Another Crisis at ther Border','00:25:21');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(200000,'https://open.spotify.com/episode/7E8JZ26orWUzNFUEyJWAmW','Germany, and Europe, After Merkel','00:38:00');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(72000000,'https://www.youtube.com/watch?v=-ggE3y918HU','Shopee Jackie Chan','00:00:30');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(320000,'https://www.youtube.com/watch?v=EDdWSzc3uR0','BLACK FRIDAY NA NERDSTORE!!!','00:03:01');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(580000,'https://www.youtube.com/watch?v=GyY15Jkkg2A','Pepsi : Vending Machine','00:00:30');
select * from audios;


-- produíveis
-- podcasts
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(7,'pod',2,'2021-9-29');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(8,'pod',2,'2021-9-28');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(9,'pod',2,'2021-9-25');
-- musicas
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(1,'mus',3,'2021-09-30');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(2,'mus',3,'2021-09-29');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(3,'mus',3,'2021-09-27');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(4,'mus',1,'2021-09-26');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(5,'mus',1,'2021-09-26');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(6,'mus',1,'2021-09-25');
select * from produziveis;


-- anunciantes
insert into anunciantes
values('Pepsi');
insert into anunciantes
values('Jovem Nerd');
insert into anunciantes
values('Shopee');
select * from anunciantes;


-- anuncios
insert into anuncios values (12,'Pepsi');
insert into anuncios values (11,'Jovem Nerd');
insert into anuncios values (10,'Shopee');
select * from anuncios;


-- generos
insert into generos values('rock');
insert into generos values('pop');
insert into generos values('funk');
insert into generos values('classic');
insert into generos values('hard-rock');
select * from generos;


-- playlists
insert into playlists values (15,'00:43:21' ,7,  '2021-11-02' ,'pri', 'Playlist Suprema');
insert into playlists values (15,'00:43:21',8,	 '2021-11-02' ,'pri', 'Playlist Suprema');
insert into playlists values (12845,'03:38:29',9,'2021-11-02' ,'pub', 'pop playlist');
select * from playlists;

-- albuns
insert into albuns values ('00:17:43','Wish You Were Here',3,'2021-11-02' , 240330000);
insert into albuns values ('00:03:13','David Bowie The Rise and Fall of Ziggy Stardust and the Spiders from Mars', 1,'2021-11-02', 3000000);
insert into albuns values ('00:05:27','Hunky Dory', 1,'2021-11-02', 245000);
select * from albuns;


-- genero caracteriza audio
insert into genero_caracteriza_audio values ('rock',1);
insert into genero_caracteriza_audio values ('rock',2);
insert into genero_caracteriza_audio values ('rock',3);
insert into genero_caracteriza_audio values ('pop',4);
insert into genero_caracteriza_audio values ('rock',4);
insert into genero_caracteriza_audio values ('pop',5);
select * from genero_caracteriza_audio;


-- artista grava produzivel
insert into artista_grava_produzivel values (2,7, '2021-11-02');
insert into artista_grava_produzivel values (2,8, '2021-11-02');
insert into artista_grava_produzivel values (2,9, '2021-11-02');
insert into artista_grava_produzivel values (1,4,'2021-11-02');
insert into artista_grava_produzivel values (1,5,'2021-11-02');
insert into artista_grava_produzivel values (1,6,'2021-11-02');
insert into artista_grava_produzivel values (3,1,'2021-11-02');
insert into artista_grava_produzivel values (3,2,'2021-11-02');
insert into artista_grava_produzivel values (3,3,'2021-11-02');
select * from artista_grava_produzivel;


-- artista grava album
insert into artista_grava_album values (1,2,'2021-11-02');
insert into artista_grava_album values (1,3,'2021-11-02');
insert into artista_grava_album values (3,1,'2021-11-02');
select * from artista_grava_album;


-- musica compoe album
insert into musica_compoe_album values(1,1,1);
insert into musica_compoe_album values(2,1,2);
insert into musica_compoe_album values(3,1,3);
insert into musica_compoe_album values(4,2,1);
insert into musica_compoe_album values(5,3,1);
select * from musica_compoe_album;


-- fila
insert into fila (id_perfil, id_produzivel, posicao) values(4,1,1);
insert into fila (id_perfil, id_produzivel, posicao) values(5,6,3);
insert into fila (id_perfil, id_produzivel, posicao) values(7,6,27);
select * from fila;


-- registro
insert into registro (id_perfil, id_produzivel, tempo_reproduzido, data_reproducao) values(6,9,'00:38:00','2021-11-02');
insert into registro (id_perfil, id_produzivel, tempo_reproduzido, data_reproducao) values(6,8,'00:17:19','2021-11-02');
insert into registro (id_perfil, id_produzivel, data_reproducao) values(6,1,'2021-11-02');
insert into registro (id_perfil, id_produzivel, data_reproducao) values(5,1,'2021-11-02');
insert into registro (id_perfil, id_produzivel, data_reproducao) values(5,2,'2021-11-02');
insert into registro (id_perfil, id_produzivel, data_reproducao) values(5,3,'2021-11-02');
insert into registro (id_perfil, id_produzivel, data_reproducao) values(5,4,'2021-11-02');
insert into registro (id_perfil, id_produzivel, data_reproducao) values(5,5,'2021-11-02');
insert into registro (id_perfil, id_produzivel, data_reproducao) values(5,6,'2021-11-02');
insert into registro (id_perfil, id_produzivel, data_reproducao) values(5,1,'2021-11-02');
insert into registro (id_perfil, id_produzivel, data_reproducao) values(5,2,'2021-11-02');
insert into registro (id_perfil, id_produzivel, data_reproducao) values(5,3,'2021-11-02');
insert into registro (id_perfil, id_produzivel, data_reproducao) values(5,1,'2021-11-02');
insert into registro (id_perfil, id_produzivel, data_reproducao) values(5,1,'2021-11-02');
select * from registro;


-- perfil segue perfil
insert into perfil_segue_perfil values (4,1);
insert into perfil_segue_perfil values (5,1);
insert into perfil_segue_perfil values (7,1);
select * from perfil_segue_perfil;


-- perfil segue playlist
insert into perfil_segue_playlist values (4,1);
insert into perfil_segue_playlist values (6,2);
insert into perfil_segue_playlist values (5,3);
select * from perfil_segue_playlist;


-- perfil administra playlist
insert into administra values(9,3);
insert into administra values(5,3);
insert into administra values(9,2);
insert into administra values(5,2);
insert into administra values(7,2);
insert into administra values(7,1);
insert into administra values(4,3);
insert into administra values(4,1);
select * from administra;


-- admistrador adiciona produzivel
insert into adiciona values (9,3,4,'2021-09-29');
insert into adiciona values (5,3,5,'2021-09-29');
insert into adiciona values (7,1,9,'2021-09-29');
select * from adiciona;