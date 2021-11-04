using System;
using System.Data.SqlClient;
using queries;
using System.Collections.Generic;

namespace cs
{
    class Program
    {
        static void Main(string[] args)
        {
            try 
            { 
                SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
                builder.ConnectionString = "Server=DESKTOP-F80E8TC;Database=fdb_trabalhofinal;Trusted_Connection=True;";
                List<Query> listOfQueries = new List<Query>()
                {
                    new AgruparTodasAsMusicasDeUmDadoUsuarioPorGeneroEIndicarQuantasMusicasDiferentesExistemPorCadaGenero(),
                    new NomeDoArtistaCujoAlbumEhOQueTemMaisReproducoes(),
                    new NomeEIdDosUsuariosQueAdministramExtatamenteAsMesmasPlaylistsQueDadoUsuarioAdministra(),
                    new RetornaASomaDaQuantidadeDeReproducoesDasMusicasDeUmAlbumParaCadaAlbumReproduzidoParaUmDadoUsuario(),
                    new RetornaNomeDeTodosOsUsuariosQueTemUmaDadaBandaNaFilaMasNaoTemOutraDadaBandaNaFila(),
                    new RetornaNomeDoPerfilENomeDoPodcastEDataDeQuandoOPodcastFoiOuvidoPara(),
                    new RetornaNumeroDeReproducoesMedioEMaximoEMinimoDeCadaMusicaPorGanero(),
                    new RetornaOsNomesEOsRespectivosIdsDeTodosOsCriadoresDeConteudoQueNaoSeguemNenhumaDasPlaylistsQueUmDadoUsuarioSegue(),
                    new RetornaTodasAsMusicasESeusRespectivosIdsParaTodasAsMusicasQueForamGravadasMasNaoCriadasPorUmDadoCriadorDeConteudo(),
                    new RetornaTodosOsNomesDasMusicasDeUmDadoGeneroAsQuaisPertencemAPeloMenosUmaPlaylist(),

                };
                bool exit = false;
                String line;
                int lineContent;
                do
                {
                    Display(listOfQueries);
                    line = Console.ReadLine();
                    if(!int.TryParse(line, out lineContent))
                        lineContent = - 1;
                    switch(lineContent)
                    {
                        case 0: listOfQueries[0].ExecuteQuery(builder) ; break;
                        case 1: listOfQueries[1].ExecuteQuery(builder) ; break;
                        case 2: listOfQueries[2].ExecuteQuery(builder) ; break;
                        case 3: listOfQueries[3].ExecuteQuery(builder) ; break;
                        case 4: listOfQueries[4].ExecuteQuery(builder) ; break;
                        case 5: listOfQueries[5].ExecuteQuery(builder) ; break;
                        case 6: listOfQueries[6].ExecuteQuery(builder) ; break;
                        case 7: listOfQueries[7].ExecuteQuery(builder) ; break;
                        case 8: listOfQueries[8].ExecuteQuery(builder) ; break;
                        case 9: listOfQueries[9].ExecuteQuery(builder) ; break;
                        case 10: exit = true; break;
                        default: Console.WriteLine("Informe um valor valido"); break;
                    }
                }while(!exit);
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.ToString());
            }
        }    
        public static void Display(List<Query> listOfQueries)
        {
            Console.WriteLine("\n\n---------------------------");
            int counter = 0;
            foreach(var query in listOfQueries){
                Console.WriteLine("{0} - {1}",counter,query.GetQueryName());
                counter ++;
            }
            Console.WriteLine("10 - PARAR EXECUCAO DO PROGRAMA");
            Console.WriteLine("---------------------------");
            Console.WriteLine("Por favor, selecione uma opcao:");
        }
    }
}
