using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DGVPractice
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            dataGridView1.AutoGenerateColumns = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DataTable dt = DBManager.GetTestData();
            dataGridView1.DataSource = dt;
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 3)
            {
                var id = (int)dataGridView1.CurrentRow.Cells[0].Value;
                Form2 frm = new Form2(id);
                frm.ShowDialog();
                MessageBox.Show(id.ToString());
            }
            else if (e.ColumnIndex == 4)
            {
                MessageBox.Show("delete is clicked");
            }

        }
    }
}
