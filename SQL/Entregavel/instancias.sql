-------------------------------------------------------------------------
--								TABELAS:
-------------------------------------------------------------------------
create table perfis(
nome varchar(100) not null, 
genero varchar(20),
email varchar(100) not null unique, 
pais varchar(50) not null, 
id int identity(1,1) primary key,
data_nascimento date not null,
numero_seguidores bigint, 
); 


create table clientes(
id_perfil int primary key, 
proxima_fatura date not null,
foreign key (id_perfil) references perfis
); 


create table usuarios_nao_pagantes(
id_perfil int primary key, 
foreign key (id_perfil) references perfis
);


create table criadores(
id_cliente int primary key,
nome_artistico varchar(100),
foreign key (id_cliente) references clientes
);


create table audios(
numero_reproducoes int, 
conteudo varchar(200) not null, 
nome varchar(100) not null, 
id int identity(1,1) primary key,
tempo_duracao time not null, 
);


create table produziveis(
id_audio int primary key,
tipo char(3) not null check(tipo = 'mus' or tipo = 'pod'),
id_criador int not null foreign key references perfis,
data_criacao date not null,
foreign key (id_audio) references audios,
);


create table anunciantes(
nome varchar(100) primary key,
);


create table anuncios(
id_audio int not null, 
id_anunciante varchar(100) not null, 
foreign key (id_audio) references audios,
foreign key (id_anunciante) references anunciantes,
);


create table generos(
tipo varchar(50) primary key,
);


create table playlists(
id int identity(1,1) primary key,
numero_seguidores int, 
tempo_duracao time not null,
id_criador int not null foreign key references perfis,
data_criacao date not null,
-- pub	:	público
-- pri	:	privado
tipo char(3) not null check(tipo like 'pub' or tipo like 'pri'), 
nome varchar(100) not null,
);


create table albuns(
id int identity(1,1) primary key,
tempo_duracao time not null,
nome varchar(100) not null, 
id_criador int not null foreign key references perfis,
data_criacao date not null,
numero_reproducoes int,
unique (id_criador, nome),
);


create table genero_caracteriza_audio(
tipo_genero varchar(50) not null,
id_audio int not null,
foreign key (tipo_genero) references generos,
foreign key (id_audio) references audios,
unique (id_audio, tipo_genero),
);


create table artista_grava_produzivel(
id_artista int not null,
id_produzivel int not null,
data_gravacao date not null,
foreign key (id_artista) references criadores,
foreign key (id_produzivel) references produziveis,
);


create table artista_grava_album(
id_artista int not null,
id_album int not null,
data_gravacao date not null,
foreign key (id_artista) references criadores,
foreign key (id_album) references albuns,
);


create table musica_compoe_album(
id_musica int not null,
id_album int not null,
posicao int not null,
foreign key (id_musica) references produziveis,
foreign key (id_album) references albuns,
unique (id_album, posicao),
);


-- perfil fila produzivel
create table fila(
id_produzivel int not null,
id_perfil int not null,
posicao int not null,
foreign key (id_produzivel) references produziveis,
foreign key (id_perfil) references perfis,
primary key(id_perfil, posicao),
);


-- perfil registro produzivel
create table registro(
id_produzivel int not null,
id_perfil int not null,
tempo_reproduzido time, 
data_reproducao date not null,
foreign key (id_produzivel) references produziveis,
foreign key (id_perfil) references perfis,
);


-- perfil segue perfil
create table perfil_segue_perfil(
id_seguidor int not null, 
id_seguido int not null,
foreign key (id_seguidor) references perfis,
foreign key (id_seguido) references perfis,
unique (id_seguidor, id_seguido),
);


-- perfil segue playlist 
create table perfil_segue_playlist(
id_seguidor int not null, 
id_playlist int not null,
foreign key (id_seguidor) references perfis,
foreign key (id_playlist) references playlists,
unique (id_seguidor, id_playlist),
);


-- perfil administra playlist
create table administra(
id_administrador int not null, 
id_playlist int not null,
foreign key (id_administrador) references perfis,
foreign key (id_playlist) references playlists,
primary key(id_administrador, id_playlist),
);


-- insere adiciona musica
create table adiciona(
id_administrador int not null,
id_playlist int not null,
id_produzivel int not null,
data_insercao date not null,
foreign key (id_administrador, id_playlist) references administra,
foreign key (id_produzivel) references produziveis,
);




-------------------------------------------------------------------------
--								VALORES:
-------------------------------------------------------------------------
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
insert into perfis(nome,email,pais,data_nascimento,numero_seguidores)
values ('Jovem Nerd','jn@podcasts.com','br','2008-06-22',7431828);
insert into perfis(nome,email,pais,data_nascimento,numero_seguidores)
values ('The Weekend','the_weekend@hotmail.com','us','1990-02-16',891913181);
insert into perfis(nome,email,pais,data_nascimento,numero_seguidores)
values ('Xadrez Verbal','xadrez_verbal@central3.com','br','2015-08-31',30954);
insert into perfis(nome,email,pais,data_nascimento,numero_seguidores)
values ('Tom Jobim','tom_jobim@gmail.com','br','1927-01-25',420984);
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
insert into clientes(id_perfil, proxima_fatura)
values(10,'2021-10-5');
insert into clientes(id_perfil, proxima_fatura)
values(11,'2021-10-5');
insert into clientes(id_perfil, proxima_fatura)
values(12,'2021-10-5');
insert into clientes(id_perfil, proxima_fatura)
values(13,'2021-10-5');
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
insert into criadores
values(10, 'Jovem Nerd');
insert into criadores
values(11, 'The Weekend');
insert into criadores
values(12, 'Xadrez Verbal');
insert into criadores
values(13, 'Tom Jobim');
insert into criadores
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
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(34098324,'https://jovemnerd.com.br/nerdcast/em-duna-o-choro-nao-e-livre/','Em Duna, o choro não é livre','02:32:00');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(439872,'https://jovemnerd.com.br/nerdcast/extra/arcane-ato-i-ciencia-e-magia/','Arcane – Ato I: Ciência e Magia','00:50:00');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(509842324,'https://jovemnerd.com.br/nerdcast/rpg-call-of-cthulhu-1-o-misterio-de-william-faraday/','RPG Call of Cthulhu 1: O mistério de William Faraday
','02:41:00');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(510033958,'https://www.youtube.com/watch?v=4NRXx6U8ABQ','Blinding Lights','00:04:22');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(1746313326,'https://www.youtube.com/watch?v=yzTuBuRdAyA','The Hills','00:03:54');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(584327257,'https://www.youtube.com/watch?v=XXYlFuWEuKI','Save your tears','00:04:08');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(10000,'https://www.youtube.com/watch?v=SUICYV_eHS8','Xadrez Verbal #273 - 16a Cúpula do G20','04:42:00');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(12000,'https://www.youtube.com/watch?v=1fp9dDsVRwI','Golpe No Sudão','04:12:00');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(12000,'https://www.youtube.com/watch?v=9rxfyLd_yDY','Xadrez Verbal #271 + Especial Coronavírus #41','04:51:30');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(17000000,'https://www.youtube.com/watch?v=E1tOV7y94DY','Elis Regina & Tom Jobim - "Aguas de Março" - 1974','00:03:30');
insert into audios (numero_reproducoes, conteudo, nome, tempo_duracao)
values(45000000,'https://www.youtube.com/watch?v=KJzBxJ8ExRk','Tom Jobim: Garota de Ipanema (com Vinicius de Moraes)','00:03:37');
select * from audios;


-- produíveis
-- podcasts
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(7,'pod',2,'2021-9-29');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(8,'pod',2,'2021-9-28');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(9,'pod',2,'2021-9-25');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(13,'pod',10,'2021-9-29');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(14,'pod',10,'2021-9-28');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(15,'pod',10,'2021-9-25');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(19,'pod',12,'2021-9-29');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(20,'pod',12,'2021-9-28');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(21,'pod',12,'2021-9-25');
-- musicas
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(1,'mus',3,'2021-09-30');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(2,'mus',3,'2021-09-29');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(3,'mus',3,'2021-09-27');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(4,'mus',1,'2021-09-26');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(5,'mus',1,'2021-09-26');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(6,'mus',1,'2021-09-25');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(16,'mus',11,'2021-09-26');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(17,'mus',11,'2021-09-26');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(18,'mus',11,'2021-09-25');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(22,'mus',13,'2021-09-26');
insert into produziveis (id_audio, tipo, id_criador, data_criacao) values(23,'mus',13,'2021-09-26');
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
insert into generos values('mpb');
insert into generos values('eletronica');
select * from generos;


-- playlists
insert into playlists values (15,'00:43:21' ,7,  '2021-11-02' ,'pri', 'Playlist Suprema');
insert into playlists values (15,'00:43:21',8,	 '2021-11-02' ,'pri', 'Playlist Suprema');
insert into playlists values (12845,'03:38:29',9,'2021-11-02' ,'pub', 'pop playlist');
insert into playlists values (1345,'00:43:21' ,7,  '2021-11-02' ,'pub',  'MPBzinho');
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
insert into genero_caracteriza_audio values ('eletronica',16);
insert into genero_caracteriza_audio values ('eletronica',17);
insert into genero_caracteriza_audio values ('eletronica',18);
insert into genero_caracteriza_audio values ('mpb',22);
insert into genero_caracteriza_audio values ('mpb',23);
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
insert into artista_grava_produzivel values (1,2,'2021-11-02');
insert into artista_grava_produzivel values (1,3,'2021-11-02');
insert into artista_grava_produzivel values (11,23,'2021-11-02');
insert into artista_grava_produzivel values (11,1,'2021-11-02');
insert into artista_grava_produzivel values (11,3,'2021-11-02');
insert into artista_grava_produzivel values (13,3,'2021-11-02');
insert into artista_grava_produzivel values (13,1,'2021-11-02');
insert into artista_grava_produzivel values (13,5,'2021-11-02');
insert into artista_grava_produzivel values (13,4,'2021-11-02');
select * from artista_grava_produzivel;


-- artista grava album
insert into artista_grava_album values (1,2,'2021-11-02');
insert into artista_grava_album values (1,3,'2021-11-02');
insert into artista_grava_album values (1,1,'2021-11-02');
insert into artista_grava_album values (3,1,'2021-11-02');
insert into artista_grava_album values (11,2,'2021-11-02');
insert into artista_grava_album values (13,3,'2021-11-02');
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
insert into fila (id_perfil, id_produzivel, posicao) values(7,5,28);
insert into fila (id_perfil, id_produzivel, posicao) values(7,4,29);
insert into fila (id_perfil, id_produzivel, posicao) values(7,3,30);
insert into fila (id_perfil, id_produzivel, posicao) values(7,2,31);
insert into fila (id_perfil, id_produzivel, posicao) values(7,1,32);
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
insert into perfil_segue_perfil values (4,3);
insert into perfil_segue_perfil values (9,12);
insert into perfil_segue_perfil values (6,11);
select * from perfil_segue_perfil;


-- perfil segue playlist
insert into perfil_segue_playlist values (4,1);
insert into perfil_segue_playlist values (6,2);
insert into perfil_segue_playlist values (5,3);
insert into perfil_segue_playlist values (1,1);
insert into perfil_segue_playlist values (2,2);
insert into perfil_segue_playlist values (3,3);
insert into perfil_segue_playlist values (1,2);
insert into perfil_segue_playlist values (2,1);
insert into perfil_segue_playlist values (1,3);
insert into perfil_segue_playlist values (5,4);
insert into perfil_segue_playlist values (6,4);
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
insert into administra values(7,4);
insert into administra values(6,4);
select * from administra;


-- admistrador adiciona produzivel
insert into adiciona values (9,3,4,'2021-09-29');
insert into adiciona values (5,3,5,'2021-09-29');
insert into adiciona values (7,1,9,'2021-09-29');
insert into adiciona values (7,4,23,'2021-09-29');
insert into adiciona values (7,4,22,'2021-09-29');
select * from adiciona;