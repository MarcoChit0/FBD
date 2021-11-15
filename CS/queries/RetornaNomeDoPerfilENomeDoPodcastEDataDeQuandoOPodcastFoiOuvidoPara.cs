using System;
using System.Data.SqlClient;


namespace queries
{
    public class RetornaNomeDoCiradorDeConteudoEQuantidadeDePodcastsProduzidosPorEle : Query
    {
        public override String sql
        {
            get
            {
                return @"select distinct criadores.id_cliente, count(distinct podcasts.id_audio) numero_podcasts
                        from perfis
                        join clientes on clientes.id_perfil = perfis.id
                        join criadores on criadores.id_cliente = clientes.id_perfil
                        join podcasts on podcasts.id_criador = perfis.id
                        group by criadores.id_cliente;";
            }
        } 

        public override string Columns
        {
            get
            {
                return "idCriador   |   numeroPodcasts";
            }
        }

        public override void ResponseLine(SqlDataReader reader)
        {
            Console.WriteLine("{0} {1}", reader.GetInt32(0), reader.GetInt32(1));
        }

        public override string GetQueryName()
        {
            return "Retorna Nome Do Cirador De Conteudo E Quantidade De Podcasts Produzidos Por Ele";
        }
    }
}