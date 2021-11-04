using System;
using System.Data.SqlClient;


namespace queries
{
    public class RetornaOsNomesEOsRespectivosIdsDeTodosOsCriadoresDeConteudoQueNaoSeguemNenhumaDasPlaylistsQueUmDadoUsuarioSegue : Query
    {
        public String name { get;set; }
        public override String sql
        {
            get
            {
                return @"select distinct p_ext.nome, p_ext.id
                        from perfis p_ext
                        join perfil_segue_playlist
                        on p_ext.id = perfil_segue_playlist.id_seguidor
                        join clientes
                        on clientes.id_perfil = p_ext.id
                        join criadores
                        on criadores.id_cliente = clientes.id_perfil
                        where p_ext.nome not like '"+ name + @"'
                        and not exists (
                            select *
                            from perfil_segue_playlist
                            where perfil_segue_playlist.id_seguidor = p_ext.id 
                            and perfil_segue_playlist.id_playlist in (
                                select id_playlist
                                from perfil_segue_playlist
                                join perfis
                                on perfis.id = perfil_segue_playlist.id_seguidor
                                where perfis.nome like '" + name + "'));";
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
            return "RetornaOsNomesEOsRespectivosIdsDeTodosOsCriadoresDeConteudoQueNaoSeguemNenhumaDasPlaylistsQueUmDadoUsuarioSegue";
        }
    }
}