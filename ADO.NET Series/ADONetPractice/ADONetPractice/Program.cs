using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADONetPractice
{
    class Program
    {
        static void Main(string[] args)
        {
            //Video-3 Testing
            
            V3 obj = new V3();
            obj.ReadAndPrint();
            

            /*
            V4 obj = new V4();
            //obj.Save("Test Std", DateTime.Now);
            //obj.Update(1, "New Student", DateTime.Now);
            obj.Delete(2);
            obj.ReadAndPrint();
            */


            /*
            V5 obj = new V5();
            StudentDTO dto = new StudentDTO();
            dto.Name = "Shahzad";
            dto.DOB = DateTime.Now.AddYears(-33);

            obj.Save(dto);

            var list = obj.GetAllStudents();

            foreach (var std in list)
            {
                Console.WriteLine("Id is:{0}", std.StudentID);
                Console.WriteLine("Name is:{0}", std.Name);
                Console.WriteLine("DoB is:{0}", std.DOB.ToShortDateString());
                Console.WriteLine("------------------------------");
            }
            */


            /*
           V6 obj = new V6();
           StudentDTO dto = new StudentDTO();
           dto.Name = "Shahzad";
           dto.DOB = DateTime.Now.AddYears(-33);

           obj.Save(dto);
           */


            /*
            V7 obj = new V7();
          StudentDTO dto = new StudentDTO();
          dto.Name = "Shahzad";
          dto.DOB = DateTime.Now.AddYears(-33);

          obj.Save(dto);
         */

            /*
            V8 obj = new V8();
            DataTable dt = obj.CreateDummyDataTable();

            Console.WriteLine("-----------------------------------------");
            foreach (DataRow row in dt.Rows)
            {
                Console.WriteLine("State:{0}", row.RowState);
            }
            Console.WriteLine("-----------------------------------------");

            Console.WriteLine("Press key to see states after AcceptChanges()");
            Console.ReadKey();
            //It will set RowStat to "Unchanged"
            dt.AcceptChanges();
            Console.WriteLine("-----------------------------------------");
            foreach (DataRow row in dt.Rows)
            {
                Console.WriteLine("State:{0}", row.RowState);
            }

            Console.WriteLine("-----------------------------------------");
            Console.WriteLine("Press key to see states after updating a value in a row");
            Console.ReadKey();

            Console.WriteLine("-----------------------------------------");
            //Changing a cell value will change the RowState to "Modified"
            dt.Rows[0]["Name"] = "Bilal 123";
            foreach (DataRow row in dt.Rows)
            {
                Console.WriteLine("State:{0}", row.RowState);
            }

            Console.WriteLine("Press any key to see detail of datatable");
            Console.ReadKey();
            Console.WriteLine("-----------------------------------------");
            obj.PrintDataTable(dt);
            */

            /*
            var frm1 = new Form1();
            frm1.ShowDialog();
            */

            /*
            var frm = new Form2();
            frm.ShowDialog();
            */


            var frm = new Form3();
            frm.ShowDialog();

            Console.ReadKey();







        }
    }
}
