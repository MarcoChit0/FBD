using System;
using System.Data.SqlClient;


namespace queries
{
    public abstract class Query
    {
        public virtual String sql 
        {
            get
            {
                return "sql command";
            }
        }

        public virtual void ExecuteQuery(SqlConnectionStringBuilder builder){
            ResponseDisplay();
            using (SqlConnection connection = new SqlConnection(builder.ConnectionString))
                {   
                    connection.Open();       

                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                ResponseLine(reader);
                            }
                        }
                    }
            } 
        }
        public virtual void ResponseLine(SqlDataReader reader)
        {
            Console.WriteLine();
        }

        public virtual String GetQueryName() => "Query";

        public virtual void ResponseDisplay() => Console.WriteLine("\n\n-------------------------\n Resultados Da consulta:\n-------------------------");
    }
}