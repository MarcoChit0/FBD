using System;
using System.Data.SqlClient;


namespace queries
{
    public class RetornaNumeroDeReproducoesMedioEMaximoEMinimoDeCadaMusicaPorGanero : Query
    {
        public override String sql
        {
            get
            {
                return @" select generos.tipo, avg(cast(musicas.numero_reproducoes as float)) media, max(musicas.numero_reproducoes) maximo, min(musicas.numero_reproducoes) minimo
                                    from generos 
                                    join genero_caracteriza_audio 
                                    on genero_caracteriza_audio.tipo_genero = generos.tipo
                                    join musicas
                                    on musicas.id_audio = genero_caracteriza_audio.id_audio
                                    group by generos.tipo;";
            }
        } 

        public override void ResponseLine(SqlDataReader reader)
        {
            Console.WriteLine("{0} {1} {2} {3}", reader.GetString(0), reader.GetDouble(1), reader.GetInt32(2), reader.GetInt32(3));
        }
    }
}