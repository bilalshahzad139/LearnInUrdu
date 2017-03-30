using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADONetPractice
{
    class V8
    {
        public DataTable CreateDummyDataTable()
        {
            //Create an object of DataTable
            DataTable dt = new DataTable("Test");

            //Add Two columns in our Table
            DataColumn dc = new DataColumn("Name", typeof(System.String));
            dt.Columns.Add(dc);

            dc = new DataColumn("Age", typeof(System.Int32));
            dt.Columns.Add(dc);


            //Create a row which can be added in our datatable
            DataRow dr = dt.NewRow();
            dr["Name"] = "Bilal";
            dr["Age"] = 20;

            dt.Rows.Add(dr);


            dr = dt.NewRow();
            dr["Name"] = "Bilal 2";
            dr["Age"] = 30;

            dt.Rows.Add(dr);

            return dt;
            
        }

        public void PrintDataTable(DataTable dt)
        {
            Console.WriteLine("-----------------------------------------");
            Console.WriteLine("******************************************");
            Console.WriteLine("-----------------------------------------");
            Console.WriteLine("Total Columns:{0}", dt.Columns.Count);
            foreach (DataColumn dc1 in dt.Columns)
            {
                Console.WriteLine("Column Name:{0}", dc1.ColumnName);
                Console.WriteLine("Data Type:{0}", dc1.DataType);
            }

            foreach (DataRow row in dt.Rows)
            {
                Console.WriteLine("-----------------------------------------");
                if (row.RowState == DataRowState.Unchanged)
                {
                    Console.WriteLine("Name:{0}", (String)row["Name"]);
                    Console.WriteLine("Name:{0}", (Int32)row["Age"]);
                    Console.WriteLine("State:{0}", row.RowState);
                } 
                else if (row.RowState == DataRowState.Added)
                {
                    Console.WriteLine("Name:{0}", (String)row["Name"]);
                    Console.WriteLine("Name:{0}", (Int32)row["Age"]);
                    Console.WriteLine("State:{0}", row.RowState);
                }
                else if (row.RowState == DataRowState.Modified)
                {
                    Console.WriteLine("Name:{0}", (String)row["Name"]);
                    Console.WriteLine("Name:{0}", (Int32)row["Age"]);
                    Console.WriteLine("State:{0}", row.RowState);
                    Console.WriteLine("Original Values are:");
                    Console.WriteLine("Name:{0}", (String)row["Name", DataRowVersion.Original]);
                    Console.WriteLine("Name:{0}", (Int32)row["Age", DataRowVersion.Original]);

                }
                else if (row.RowState == DataRowState.Deleted)
                {
                    //If row is in deleted state, then you can't get values directly from row
                    Console.WriteLine("State:{0}", row.RowState);
                    Console.WriteLine("Name:{0}", (String)row["Name", DataRowVersion.Original]);
                    Console.WriteLine("Name:{0}", (Int32)row["Age", DataRowVersion.Original]);
                }
            }
        }
    }
}
