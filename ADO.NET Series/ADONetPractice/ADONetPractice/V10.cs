using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADONetPractice
{
    class V10
    {
        SqlDataAdapter _adapter = null;

        public void SetupAdapter()
        {
            _adapter = new SqlDataAdapter();

            /* ---------------- Select Command Building ----------------------------*/
            SqlCommand selCommand = new SqlCommand("Select StudentID,Name,DOB from dbo.Students");
            _adapter.SelectCommand = selCommand;

            /* ---------------- Insert Command Building ----------------------------*/

            String sqlQuery = String.Format(@"INSERT INTO dbo.Students(Name, DOB) VALUES(@StudentName,@DOB);");
            SqlCommand insertCommand = new SqlCommand(sqlQuery);

            SqlParameter param = new SqlParameter();
            param.ParameterName = "StudentName";
            param.SqlDbType = System.Data.SqlDbType.VarChar;
            param.SourceColumn = "Name";

            insertCommand.Parameters.Add(param);

            param = new SqlParameter();
            param.ParameterName = "DOB";
            param.SqlDbType = System.Data.SqlDbType.DateTime;
            param.SourceColumn = "DOB";

            insertCommand.Parameters.Add(param);

            _adapter.InsertCommand = insertCommand;


            /* ---------------- Update Command Building ----------------------------*/

            sqlQuery = String.Format(@"Update dbo.Students SET Name =@StudentName , DOB= @DOB Where StudentID=@StudentID;");
            SqlCommand updateCommand = new SqlCommand(sqlQuery);

            SqlParameter param1 = new SqlParameter();
            param1.ParameterName = "StudentName";
            param1.SqlDbType = System.Data.SqlDbType.VarChar;
            param1.SourceColumn = "Name";

            updateCommand.Parameters.Add(param1);

            param1 = new SqlParameter();
            param1.ParameterName = "DOB";
            param1.SqlDbType = System.Data.SqlDbType.DateTime;
            param1.SourceColumn = "DOB";

            updateCommand.Parameters.Add(param1);

            param1 = new SqlParameter();
            param1.ParameterName = "StudentID";
            param1.SqlDbType = System.Data.SqlDbType.Int;
            param1.SourceColumn = "StudentID";

            updateCommand.Parameters.Add(param1);

            _adapter.UpdateCommand = updateCommand;


            /* ---------------- DELETE Command Building ----------------------------*/

            sqlQuery = String.Format(@"DELETE From dbo.Students Where StudentID=@StudentID;");
            SqlCommand deleteCommand = new SqlCommand(sqlQuery);

            SqlParameter param2 = new SqlParameter();
            param2.ParameterName = "StudentID";
            param2.SqlDbType = System.Data.SqlDbType.Int;
            param1.SourceColumn = "StudentID";

            deleteCommand.Parameters.Add(param2);

            _adapter.DeleteCommand = deleteCommand;

        }

        public DataTable GetData()
        {
            String connStr = @"Data Source=.\SQLEXPRESS2012;Initial Catalog=TestDB2;Integrated Security= True;Persist Security Info=True;";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                _adapter.SelectCommand.Connection = conn;

                DataTable dt = new DataTable();
                _adapter.Fill(dt);

                return dt;
            }
        }
        public void PersistChanges(DataTable dt)
        {
            String connStr = @"Data Source=.\SQLEXPRESS2012;Initial Catalog=TestDB2;Integrated Security= True;Persist Security Info=True;";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                _adapter.InsertCommand.Connection = conn;
                _adapter.UpdateCommand.Connection = conn;
                _adapter.DeleteCommand.Connection = conn;

                _adapter.Update(dt);

            }
        }
    }
}
