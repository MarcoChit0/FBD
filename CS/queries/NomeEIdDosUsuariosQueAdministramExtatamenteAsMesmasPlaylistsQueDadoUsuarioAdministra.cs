using System;
using System.Data.SqlClient;


namespace queries
{
    public class NomeEIdDosUsuariosQueAdministramExtatamenteAsMesmasPlaylistsQueDadoUsuarioAdministra : Query
    {
        public String name { get;set; }
        public override String sql
        {
            get
            {
                return @"select distinct p_ext.nome, p_ext.id
                from perfis p_ext
                join administra
                on p_ext.id = administra.id_administrador
                join clientes
                on clientes.id_perfil = p_ext.id
                where p_ext.nome not like 'Cleberson%'
                and not exists (
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
                    select * 
                    from administra 
                    where administra.id_administrador = p_ext.id
                    and administra.id_playlist not in (
                        select distinct id_playlist
                        from administra join perfis 
                        on perfis.id = administra.id_administrador
                        where perfis.nome like '" + name + "'));";
            }
        } 

        public override void ResponseLine(SqlDataReader reader)
        {
            Console.WriteLine("{0} {1}", reader.GetString(0), reader.GetInt32(1));
        }

        public override void ExecuteQuery(SqlConnectionStringBuilder builder)
        {
            Console.WriteLine("\nInforme um nome de alguém que administre de playlists por favor:");
            this.name = Console.ReadLine();
            this.name += '%'; 
            base.ExecuteQuery(builder);

        }

        public override string GetQueryName()
        {
            return "NomeEIdDosUsuariosQueAdministramExtatamenteAsMesmasPlaylistsQueDadoUsuarioAdministra";
        }
    }
}