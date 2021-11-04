using System;
using System.Data.SqlClient;


namespace queries
{
    public class AgruparTodasAsMusicasDeUmDadoUsuarioPorGeneroEIndicarQuantasMusicasDiferentesExistemPorCadaGenero : Query
    {
        public String name { get;set; }
        public override String sql
        {
            get
            {
                return @"select genero_caracteriza_audio.tipo_genero genero, count(distinct musicas.id_audio) as quantidade_reproducoes
                        from (select * from perfis where nome like '"+ name + @"') perfis_nome
                        join fila
                        on fila.id_perfil = perfis_nome.id
                        join musicas
                        on musicas.id_audio = fila.id_produzivel
                        join genero_caracteriza_audio
                        on genero_caracteriza_audio.id_audio = musicas.id_audio
                        group by genero_caracteriza_audio.tipo_genero;
                        ";
            }
        } 

        public override void ResponseLine(SqlDataReader reader)
        {
            Console.WriteLine("{0} {1}", reader.GetString(0), reader.GetInt32(1));
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
            return "AgruparTodasAsMusicasDeUmDadoUsuarioPorGeneroEIndicarQuantasMusicasDiferentesExistemPorCadaGenero";
        }
    }
}