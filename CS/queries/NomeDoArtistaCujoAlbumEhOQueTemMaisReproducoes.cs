using System;
using System.Data.SqlClient;


namespace queries
{
    public class NomeDoArtistaCujoAlbumEhOQueTemMaisReproducoes : Query
    {
        public override String sql
        {
            get
            {
                return @"select distinct perfis.nome 
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
                            );";
            }
        } 

        public override void ResponseLine(SqlDataReader reader)
        {
            Console.WriteLine("{0}", reader.GetString(0));
        }

        public override string GetQueryName()
        {
            return "NomeDoArtistaCujoAlbumEhOQueTemMaisReproducoes";
        }
    }
}