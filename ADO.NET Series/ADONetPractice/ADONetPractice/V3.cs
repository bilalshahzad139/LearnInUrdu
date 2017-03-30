using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADONetPractice
{
    class V3
    {
        public void ReadAndPrint()
        {
            //Step - 1 Build Connection using Connection String
            //String connStr = @"Data Source=.\SQLEXPRESS2012;Initial Catalog=TestDB2;Integrated Security= True;Persist Security Info=True;";
            String connStr = @"Data Source=.\SQLEXPRESS2012;Initial Catalog=TestDB2;User Id=sa;Password=12345;";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                //Step 2 Open conneciton
                conn.Open();

                //Step 3 Build your query
                String sqlQuery = "Select * from dbo.Students";

                //Step 4 Build Command Object
                SqlCommand command = new SqlCommand(sqlQuery, conn);

                //Step 5 Execute Command (ExecuteReader) in this case
                SqlDataReader reader = command.ExecuteReader();

                //Step 6 Iterate reader and print values

                while (reader.Read() == true)
                {

                    //Get value by Index but convert it
                    Int32 id = (Int32) reader.GetValue(0);
                    //Get converted value by by index
                    Int32 id2 = reader.GetInt32(0);
                    //Find index first and then get value
                    Int32 id3 = reader.GetInt32(reader.GetOrdinal("StudentID"));

                    Console.WriteLine("Id is:{0}", id);
                    Console.WriteLine("Name is:{0}", reader.GetString(1));
                    Console.WriteLine("DoB is:{0}", reader.GetDateTime(2));

                }

            }
        }
    }
}
