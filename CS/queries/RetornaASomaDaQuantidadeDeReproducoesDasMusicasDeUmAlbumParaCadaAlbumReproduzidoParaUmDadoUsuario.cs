using System;
using System.Data.SqlClient;


namespace queries
{
    public class RetornaASomaDaQuantidadeDeReproducoesDasMusicasDeUmAlbumParaCadaAlbumReproduzidoParaUmDadoUsuario : Query
    {
        public String name { get;set; }
        public override String sql
        {
            get
            {
                return @"select perfis.nome, albuns.id album, albuns.nome albumNome, count(registro.id_produzivel) reproducoes 
                        from perfis
                        join registro 
                        on registro.id_perfil = perfis.id
                        join musicas 
                        on musicas.id_audio = registro.id_produzivel
                        join musica_compoe_album
                        on musicas.id_audio = musica_compoe_album.id_musica
                        join albuns
                        on albuns.id = musica_compoe_album.id_album
                        group by perfis.nome, albuns.id, albuns.nome
                        having perfis.nome like '" + name +
                        "' order by reproducoes;";
            }
        } 

        public override string Columns
        {
            get
            {
                return "nomePerfil  |   idAlbum   |   nomeAlbum |   reproducoes";
            }
        }

        public override void ResponseLine(SqlDataReader reader)
        {
            Console.WriteLine("{0} \t {1} \t {2} \t {3}", reader.GetString(0), reader.GetInt32(1), reader.GetString(2),reader.GetInt32(3));
        }

        public override void ExecuteQuery(SqlConnectionStringBuilder builder)
        {
            Console.WriteLine("\nInforme um nome de usuario por favor:");
            this.name = Console.ReadLine();
            this.name += '%';    
            base.ExecuteQuery(builder);
        }

        public override string GetQueryName()
        {
            return "Retorna A Soma Da Quantidade De Reproducoes Das Musicas De Um Album Para Cada Album Reproduzido Para Um Dado Usuario";
        }
    }
}