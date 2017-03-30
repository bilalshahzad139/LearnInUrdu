using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ADONetPractice
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            V9 obj = new V9();
            var dt = obj.GetAllStudents();

            dataGridView1.DataSource = dt;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)dataGridView1.DataSource;
            V9 obj = new V9();

            foreach (DataRow row in dt.Rows)
            {
                if (row.RowState == DataRowState.Added)
                {
                    StudentDTO dto = new StudentDTO();
                    dto.Name = (String)row["Name"];
                    dto.DOB = (DateTime)row["DOB"];

                    obj.Save(dto);
                }
                else if (row.RowState == DataRowState.Modified)
                {
                    StudentDTO dto = new StudentDTO();
                    dto.StudentID = (int)row["StudentID"];
                    dto.Name = (String)row["Name"];
                    dto.DOB = (DateTime)row["DOB"];

                    obj.Update(dto);
                }
                else if (row.RowState == DataRowState.Deleted)
                {
                    var sid= (int)row["StudentID", DataRowVersion.Original];
                    obj.Delete(sid);
                }
            }

            dt.AcceptChanges();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
