-- Item 2:
-- 2.a. Visões:

-- podcats:
create view podcasts
as select nome, id_audio, tempo_duracao, numero_reproducoes, id_criador, data_criacao 
from produziveis
join audios on produziveis.id_audio = audios.id
where tipo = 'pod';

select * from podcasts;


-- músicas:
create view musicas
as select nome, id_audio, tempo_duracao, numero_reproducoes, id_criador, data_criacao 
from produziveis
join audios on produziveis.id_audio = audios.id
where tipo = 'mus';

select * from musicas;


-- 2.b. Consultas:
-- 2.b.a.1: número de reprodução médio, máximo e mínimo de cada música por gênero
select generos.tipo, avg(cast(musicas.numero_reproducoes as float)) media, max(musicas.numero_reproducoes) maximo, min(musicas.numero_reproducoes) minimo
from generos 
join genero_caracteriza_audio 
on genero_caracteriza_audio.tipo_genero = generos.tipo
join musicas
on musicas.id_audio = genero_caracteriza_audio.id_audio
group by generos.tipo;


-- 2.b.a.2: para cada álbum que cleberson ouviu, indicar a quantidade de músicas ouvidas 
-- obs.: se ele ouvir 2x a mesma música, conta como 2 repetições. Assim como, se ele ouvir 1 vez duas músicas difentes, também conta como 2 repetições
select perfis.nome, albuns.id album, count(registro.id_produzivel) reproducoes 
from perfis
join registro 
on registro.id_perfil = perfis.id
join musicas 
on musicas.id_audio = registro.id_produzivel
join musica_compoe_album
on musicas.id_audio = musica_compoe_album.id_musica
join albuns
on albuns.id = musica_compoe_album.id_album
group by perfis.nome, albuns.id
having perfis.nome like 'cleberson%'
order by reproducoes;



-- 2.b.d.1: nome de todos os usuários que tem pink floyd na fila, mas não tem david bowie
select distinct perfis.nome
from perfis
join usuarios_nao_pagantes 
on perfis.id = usuarios_nao_pagantes.id_perfil
join fila 
on fila.id_perfil = perfis.id
join produziveis
on produziveis.id_audio = fila.id_produzivel
join audios
on audios.id = produziveis.id_audio
where perfis.id in (
	-- pegar todos os perfis que tiverem pink floyd na fila
	select distinct fila.id_perfil
	from fila 
	where fila.id_produzivel in (
		-- pegar músicas da banda pink floyd
		select id_audio
		from produziveis
		where id_criador = (
			-- pegar o id do perfil da banda pink floyd
			select perfis.id
			from perfis 
			join clientes
			on clientes.id_perfil = perfis.id
			join criadores
			on criadores.id_cliente = clientes.id_perfil
			where criadores.nome_artistico like 'Pink Floyd'
			)
		)
	)
-- não queremos ninguém que tenha bowie na fila
and perfis.id not in(
	-- pegar todos os perfis que tiverem david bowie na fila
	select distinct fila.id_perfil
	from fila 
	where fila.id_produzivel in (
		-- pegar todas as músicas do bowie
		select id_audio
		from produziveis
		where id_criador = (
			-- pegar o id do bowie
			select id
			from perfis 
			join clientes
			on clientes.id_perfil = perfis.id
			join criadores
			on criadores.id_cliente = clientes.id_perfil
			where perfis.nome like 'David Bowie'
			)
		)
	);

-- 2.b.d.2: o nome do artista cujo álbum tem o maior número de reprodução dentre todos 
select distinct perfis.nome 
from perfis 
join clientes
on clientes.id_perfil = perfis.id
join criadores
on criadores.id_cliente = clientes.id_perfil
join albuns
on albuns.id_criador = perfis.id
where perfis.id in (
	select id_criador
	from albuns
	where albuns.numero_reproducoes = (
		select max(albuns.numero_reproducoes)
		from albuns
		)
	);

-- 2.b.c.1: o nome e o id dos administradores de playlists que administram exatamente as mesmas playlists que Cleberson administra desde que esses perfis sejam clientes
select distinct p_ext.nome, p_ext.id
from perfis p_ext
join administra
on p_ext.id = administra.id_administrador
join clientes
on clientes.id_perfil = p_ext.id
where p_ext.nome not like 'Cleberson%'
and not exists (
	-- playlists administradas por cleberson - playlists administradas por um usuário qualquer
	select *
	from perfis 
	join administra
	on perfis.id = administra.id_administrador
	where perfis.nome like 'Cleberson%'
	and administra.id_playlist not in (
		select distinct id_playlist 
		from administra
		where administra.id_administrador = p_ext.id
		)
	)
and not exists (
	-- playlists administradas por um usuário qualquer - playlists administradas por cleberson
	select * 
	from administra 
	where administra.id_administrador = p_ext.id
	and administra.id_playlist not in (
		select distinct id_playlist
		from administra join perfis 
		on perfis.id = administra.id_administrador
		where perfis.nome like 'Cleberson%'));

-- 2.b.d.1: todos os nomes das músicas de pop que pertencem a pelo menos uma playlist
select distinct musicas.nome from musicas
join genero_caracteriza_audio on genero_caracteriza_audio.id_audio = musicas.id_audio
join adiciona on musicas.id_audio = adiciona.id_produzivel
join playlists on playlists.id = adiciona.id_playlist
where genero_caracteriza_audio.tipo_genero like 'pop';

-- 2.b.d.2: indicar nome (perfil), nome (podcast), data (quando o podcast foi ouvido) para vez que um podcast foi ouvido
select distinct perfis.nome, podcasts.nome, registro.data_reproducao 
from perfis 
join registro on registro.id_perfil = perfis.id
join podcasts on registro.id_produzivel = podcasts.id_audio;
