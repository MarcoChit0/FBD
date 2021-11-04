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
                    new RetornaNomeDoPerfilENomeDoPodcastEDataDeQuandoOPodcastFoiOuvidoPara(),
                    new NomeDoArtistaCujoAlbumEhOQueTemMaisReproducoes(),
                    new NomeEIdDosUsuariosQueAdministramExtatamenteAsMesmasPlaylistsQueDadoUsuarioAdministra(),
                    new RetornaNomeDeTodosOsUsuariosQueTemUmaDadaBandaNaFilaMasNaoTemOutraDadaBandaNaFila(),
                    new RetornaASomaDaQuantidadeDeReproducoesDasMusicasDeUmAlbumParaCadaAlbumReproduzidoParaUmDadoUsuario(),
                    new RetornaNumeroDeReproducoesMedioEMaximoEMinimoDeCadaMusicaPorGanero(),
                    new RetornaTodosOsNomesDasMusicasDeUmDadoGeneroAsQuaisPertencemAPeloMenosUmaPlaylist()
                };
                bool exit = false;
                String line;
                int lineContent;
                do
                {
                    Console.WriteLine("Informe um valor:");
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
                        case 7: exit = true; break;
                        default: Console.WriteLine("Informe um valor valido"); break;
                    }
                }while(!exit);
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.ToString());
            }
        }
    }
}
