using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADONetPractice
{
    class V6
    {
        public int Save(StudentDTO dto)
        {
            //Step - 1 Build Connection using Connection String
            String connStr = @"Data Source=.\SQLEXPRESS2012;Initial Catalog=TestDB2;Integrated Security= True;Persist Security Info=True;";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                //Step 2 Open conneciton
                conn.Open();

                //Step 3 Build your query
                String sqlQuery = "";
                if(dto.StudentID > 0)
                {
                    sqlQuery = String.Format(@"Update dbo.Students SET Name='{0}', DOB='{1}' WHERE StudentID={2}", dto.Name, dto.DOB, dto.StudentID);
                }
                else
                {
                    sqlQuery = String.Format(@"INSERT INTO dbo.Students(Name, DOB) VALUES('{0}','{1}')", dto.Name, dto.DOB);
                    sqlQuery = sqlQuery + "; Select Scope_Identity()";
                }
                
                //Step 4 Build Command Object
                SqlCommand command = new SqlCommand(sqlQuery, conn);

                int studentid = 0;

                if (dto.StudentID > 0)
                {
                    command.ExecuteNonQuery();
                    studentid = dto.StudentID;
                }
                else
                {
                    // Step 5 Execute Scalar
                    studentid = Convert.ToInt32(command.ExecuteScalar());
                }


                return studentid;
            }
        }

       
    }
}
