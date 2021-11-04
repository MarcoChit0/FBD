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
                return @"select perfis.nome, albuns.id album, count(registro.id_produzivel) reproducoes 
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
                        having perfis.nome like '" + name +
                        "' order by reproducoes;";
            }
        } 

        public override void ResponseLine(SqlDataReader reader)
        {
            Console.WriteLine("{0} {1} {2}", reader.GetString(0), reader.GetInt32(1), reader.GetInt32(2));
        }

        public override void ExecuteQuery(SqlConnectionStringBuilder builder)
        {
            Console.WriteLine("Informe um nome por favor:");
            this.name = Console.ReadLine();
            this.name += '%';    
            base.ExecuteQuery(builder);

        }
    }
}