using System;
using System.Data.SqlClient;


namespace queries
{
    public class RetornaTodasAsMusicasESeusRespectivosIdsParaTodasAsMusicasQueForamGravadasMasNaoCriadasPorUmDadoCriadorDeConteudo : Query
    {
        public String name { get;set; }
        public override String sql
        {
            get
            {
                return @"select musicas.nome, musicas.id_audio
                        from musicas 
                        join artista_grava_produzivel
                        on musicas.id_audio = artista_grava_produzivel.id_produzivel
                        join criadores
                        on criadores.id_cliente = artista_grava_produzivel.id_artista
                        where criadores.nome_artistico like '"+ name +@"'
                        and musicas.id_audio not in (
                        select id_audio
                        from musicas 
                        where id_criador in (
                            select id
                            from perfis
                            join clientes
                            on clientes.id_perfil = perfis.id
                            join criadores
                            on criadores.id_cliente = clientes.id_perfil 
                            where criadores.nome_artistico like '"+ name +@"'
                            )
                        )
                        union
                        select musicas.nome, musicas.id_audio
                        from criadores 
                        join artista_grava_album
                        on artista_grava_album.id_artista = criadores.id_cliente
                        join albuns 
                        on artista_grava_album.id_album = albuns.id
                        join musica_compoe_album
                        on musica_compoe_album.id_album = albuns.id
                        join musicas
                        on musicas.id_audio = musica_compoe_album.id_musica
                        where nome_artistico like '"+ name +@"'
                        and musicas.id_criador not in (
                            select id_cliente
                            from criadores
                            where nome_artistico like '"+ name +@"'
                        )
                        and albuns.id_criador not in (
                            select id_cliente
                            from criadores
                            where nome_artistico like '"+ name +@"'
                        );";
            }
        } 

        public override void ResponseLine(SqlDataReader reader)
        {
            Console.WriteLine("{0} {1}", reader.GetString(0), reader.GetInt32(1));
        }

        public override void ExecuteQuery(SqlConnectionStringBuilder builder)
        {
            Console.WriteLine("\nInforme um nome de um criador de conteudo por favor:");
            this.name = Console.ReadLine();
            this.name += '%';    
            base.ExecuteQuery(builder);
        }

        public override string GetQueryName()
        {
            return "RetornaTodasAsMusicasESeusRespectivosIdsParaTodasAsMusicasQueForamGravadasMasNaoCriadasPorUmDadoCriadorDeConteudo";
        }
    }
}