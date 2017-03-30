using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADONetPractice
{
    class V9
    {
        public DataTable GetAllStudents()
        {
            //Step - 1 Build Connection using Connection String
            String connStr = @"Data Source=.\SQLEXPRESS2012;Initial Catalog=TestDB2;Integrated Security= True;Persist Security Info=True;";
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

                //Load data in a DataTable from reader
                DataTable dt = new DataTable();
                dt.Load(reader);

                return dt;
            }
        }

        public void Save(StudentDTO dto)
        {
            //Step - 1 Build Connection using Connection String
            String connStr = @"Data Source=.\SQLEXPRESS2012;Initial Catalog=TestDB2;Integrated Security= True;Persist Security Info=True;";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                //Step 2 Open conneciton
                conn.Open();

                //Step 3 Build your query
                String sqlQuery = String.Format(@"INSERT INTO dbo.Students(Name, DOB) 
                                                VALUES('{0}','{1}')", dto.Name, dto.DOB);

                //Step 4 Build Command Object
                SqlCommand command = new SqlCommand(sqlQuery, conn);

                // Step 5 Execute Non Query

                int recAff = command.ExecuteNonQuery();

                Console.WriteLine("Records Effected {0}", recAff);

            }
        }

        public void Update(StudentDTO dto)
        {
            //Step - 1 Build Connection using Connection String
            String connStr = @"Data Source=.\SQLEXPRESS2012;Initial Catalog=TestDB2;Integrated Security= True;Persist Security Info=True;";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                //Step 2 Open conneciton
                conn.Open();

                //Step 3 Build your query
                String sqlQuery = String.Format(@"Update dbo.Students SET Name='{0}', DOB='{1}' WHERE StudentID={2}", dto.Name,dto.DOB,dto.StudentID);

                //Step 4 Build Command Object
                SqlCommand command = new SqlCommand(sqlQuery, conn);

                // Step 5 Execute Non Query

                int recAff = command.ExecuteNonQuery();

                Console.WriteLine("Records Effected {0}", recAff);

            }
        }

        public void Delete(int pStudentId)
        {
            //Step - 1 Build Connection using Connection String
            String connStr = @"Data Source=.\SQLEXPRESS2012;Initial Catalog=TestDB2;Integrated Security= True;Persist Security Info=True;";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                //Step 2 Open conneciton
                conn.Open();

                //Step 3 Build your query
                String sqlQuery = String.Format(@"DELETE FROM dbo.Students WHERE StudentID={0}", pStudentId);

                //Step 4 Build Command Object
                SqlCommand command = new SqlCommand(sqlQuery, conn);

                // Step 5 Execute Non Query

                int recAff = command.ExecuteNonQuery();

                Console.WriteLine("Records Effected {0}", recAff);

            }
        }
    }
}
