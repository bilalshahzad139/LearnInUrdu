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
    public partial class Form2 : Form
    {
        int _id = 0;
        public Form2(int id)
        {
            _id = id;
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            //DB Call, ID pass and get data
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
