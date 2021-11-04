using System;
using System.Data.SqlClient;

namespace queries
{
    public class RetornaTodosOsNomesDasMusicasDeUmDadoGeneroAsQuaisPertencemAPeloMenosUmaPlaylist : Query
    {
        public String genero { get;set; }
        public override String sql
        {
            get
            {
                return @"select distinct musicas.nome from musicas
                        join genero_caracteriza_audio on genero_caracteriza_audio.id_audio = musicas.id_audio
                        join adiciona on musicas.id_audio = adiciona.id_produzivel
                        join playlists on playlists.id = adiciona.id_playlist
                        where genero_caracteriza_audio.tipo_genero like '"+ genero +"';";
            }
        } 

        public override void ResponseLine(SqlDataReader reader)
        {
            Console.WriteLine("{0}", reader.GetString(0));
        }

        public override void ExecuteQuery(SqlConnectionStringBuilder builder)
        {
            Console.WriteLine("\nInforme um genero por favor:");
            this.genero = Console.ReadLine();
            this.genero += '%';
            base.ExecuteQuery(builder);
        }

        public override string GetQueryName()
        {
            return "RetornaTodosOsNomesDasMusicasDeUmDadoGeneroAsQuaisPertencemAPeloMenosUmaPlaylist";
        }
    }
}