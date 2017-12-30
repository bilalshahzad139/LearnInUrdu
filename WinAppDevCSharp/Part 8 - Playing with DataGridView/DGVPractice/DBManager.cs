using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DGVPractice
{
    public class DBManager
    {
        public static DataTable GetTestData()
        {
            //Create an object of DataTable
            DataTable dt = new DataTable("Test");

            //Add Two columns in our Table
            DataColumn dc = new DataColumn("ID", typeof(System.Int32));
            dt.Columns.Add(dc);

            dc = new DataColumn("Name", typeof(System.String));
            dt.Columns.Add(dc);

            dc = new DataColumn("Age", typeof(System.Int32));
            dt.Columns.Add(dc);


            //Create a row which can be added in our datatable
            DataRow dr = dt.NewRow();
            dr["ID"] = 1;
            dr["Name"] = "Bilal";
            dr["Age"] = 20;

            dt.Rows.Add(dr);


            dr = dt.NewRow();
            dr["ID"] = 2;
            dr["Name"] = "Bilal 2";
            dr["Age"] = 30;

            dt.Rows.Add(dr);

            return dt;
        }
    }
}
