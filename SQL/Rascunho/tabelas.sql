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
