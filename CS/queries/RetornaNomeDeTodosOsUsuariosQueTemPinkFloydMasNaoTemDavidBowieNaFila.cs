using System;
using System.Data.SqlClient;


namespace queries
{
    public class RetornaNomeDeTodosOsUsuariosQueTemUmaDadaBandaNaFilaMasNaoTemOutraDadaBandaNaFila : Query
    {
        public String BandaQuePrecisaEstarNaFila { get;set; }
        public String BandaQueNaoPodeEstarNaFila { get;set; }
        public override String sql
        {
            get
            {
                return @"select distinct perfis.nome
                        from perfis
                        join usuarios_nao_pagantes 
                        on perfis.id = usuarios_nao_pagantes.id_perfil
                        join fila 
                        on fila.id_perfil = perfis.id
                        join produziveis
                        on produziveis.id_audio = fila.id_produzivel
                        join audios
                        on audios.id = produziveis.id_audio
                        where perfis.id in (
                            select distinct fila.id_perfil
                            from fila 
                            where fila.id_produzivel in (
                                select id_audio
                                from produziveis
                                where id_criador = (
                                    select perfis.id
                                    from perfis 
                                    join clientes
                                    on clientes.id_perfil = perfis.id
                                    join criadores
                                    on criadores.id_cliente = clientes.id_perfil
                                    where criadores.nome_artistico like '"+ BandaQuePrecisaEstarNaFila + @"'
                                    )
                                )
                            )
                        and perfis.id not in(
                            select distinct fila.id_perfil
                            from fila 
                            where fila.id_produzivel in (
                                select id_audio
                                from produziveis
                                where id_criador = (
                                    select id
                                    from perfis 
                                    join clientes
                                    on clientes.id_perfil = perfis.id
                                    join criadores
                                    on criadores.id_cliente = clientes.id_perfil
                                    where perfis.nome like '"+ BandaQueNaoPodeEstarNaFila + @"'
                                    )
                                )
                            );";
            }
        } 

        public override string Columns
        {
            get
            {
                return "nomePerfil";
            }
        }

        public override void ExecuteQuery(SqlConnectionStringBuilder builder)
        {
            Console.WriteLine("\nInforme uma banda que precisa estar na fila por favor:");
            this.BandaQuePrecisaEstarNaFila = Console.ReadLine();
            this.BandaQuePrecisaEstarNaFila += '%';
            Console.WriteLine("\nInforme uma banda que nao pode estar na fila por favor:");
            this.BandaQueNaoPodeEstarNaFila = Console.ReadLine();
            this.BandaQueNaoPodeEstarNaFila += '%';     
            base.ExecuteQuery(builder);

        }
        public override void ResponseLine(SqlDataReader reader)
        {
            Console.WriteLine("{0}", reader.GetString(0));
        }

        public override string GetQueryName()
        {
            return "Retorna Nome De Todos Os Usuarios Que Tem Uma Dada Banda Na Fila Mas Nao Tem Outra Dada Banda Na Fila";
        }
    }
}