using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADONetPractice
{
    class V7
    {
        public int Save(StudentDTO dto)
        {
            //Step - 1 Build Connection using Connection String
            String connStr = @"Data Source=.\SQLEXPRESS2012;Initial Catalog=TestDB2;Integrated Security= True;Persist Security Info=True;";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                //Step 2 Open conneciton
                conn.Open();

                //Step 3 Build your "Parameterized" query
                String sqlQuery = "";


                //Note: Don't add quotes around DateTime Parameter.

                sqlQuery = String.Format(@"INSERT INTO dbo.Students(Name, DOB) VALUES(@StudentName,@DOB);");
                sqlQuery = sqlQuery + "Select Scope_Identity()";

                //Step 4 Build Command Object
                SqlCommand command = new SqlCommand(sqlQuery, conn);


                //Create Parameter and add in command

                SqlParameter param = new SqlParameter();
                param.ParameterName = "StudentName";
                param.SqlDbType = System.Data.SqlDbType.VarChar;
                param.Value = dto.Name;

                command.Parameters.Add(param);

                param = new SqlParameter();
                param.ParameterName = "DOB";
                param.SqlDbType = System.Data.SqlDbType.DateTime;
                param.Value = dto.DOB;

                command.Parameters.Add(param);


                int studentid = 0;

                // Step 5 Execute Scalar
                var v = command.ExecuteScalar();
                studentid = Convert.ToInt32(v);


                return studentid;
            }
        }


    }
}
