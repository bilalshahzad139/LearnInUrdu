using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace TransactionPrac
{
    class Program
    {
        static void Main(string[] args)
        {
            var connStr = @"Data Source=.\SQLEXPRESS2012;Initial Catalog=TestDB;Integrated Security= True;Persist Security Info=True;";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                var tran = conn.BeginTransaction(IsolationLevel.ReadUncommitted);
                var query = "insert into dbo.Admins(AdminName,Login,Password) Values('abc','abc','abc')";
                SqlCommand command = new SqlCommand(query, conn, tran);


            }

        }
    }
}
