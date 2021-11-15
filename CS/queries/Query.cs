using System;
using System.Data.SqlClient;


namespace queries
{
    public abstract class Query
    {
        public virtual String Columns 
        { 
            get
            {
                return "columns";
            }
        }
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
                            ResponseColumns();
                            while (reader.Read())
                            {
                                ResponseLine(reader);
                            }
                        }
                    }
            } 
        }

        public virtual void ResponseColumns(){
            Console.WriteLine(Columns);
            String lineSeparator = "-";
            for(int i=0; i < Columns.Length; i++)
            {
                lineSeparator = lineSeparator + "-";
            }
            Console.WriteLine(lineSeparator);
        }
        public virtual void ResponseLine(SqlDataReader reader)
        {
            Console.WriteLine();
        }

        public virtual String GetQueryName() => "Query";

        public virtual void ResponseDisplay() => Console.WriteLine("\n\n-------------------------\n Resultados Da consulta:\n-------------------------");
    }
}