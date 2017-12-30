using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PictureBoxPrac
{
    public partial class Form1 : Form
    {
        private int _idToEdit = 0;
        public Form1()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            var result = openFileDialog1.ShowDialog();
            if (result == System.Windows.Forms.DialogResult.OK)
            {
                var filePath = openFileDialog1.FileName;
                pictureBox1.Image = Image.FromFile(filePath);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            String name = textBox1.Text.Trim();
            String isHockey = (checkBox1.Checked == true ? "1" : "0");
            String unqiueName = "";

            if (pictureBox1.Image != null)
            {
                String applicationBasePath = System.IO.Path.GetDirectoryName(Application.ExecutablePath);
                String pathToSaveImage = applicationBasePath + @"\images\";

                unqiueName = Guid.NewGuid().ToString() + ".jpg";
                String imgPath = pathToSaveImage + unqiueName;

                pictureBox1.Image.Save(imgPath);
            }

            String connStr = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\LearningInUrdu\PictureBoxPrac\PictureBoxPrac\Database1.mdf;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    String query = "";
                    conn.Open();
                    if (_idToEdit > 0)
                    {
                        query = String.Format("Update dbo.Users SET name='{0}',IsHockey='{1}',UserImage='{2}' Where ID= {3}", name, isHockey, unqiueName, _idToEdit);
                    }
                    else
                    {
                        query = String.Format("INSERT INTO dbo.Users(Name,IsHockey,UserImage,CreatedOn) Values('{0}','{1}','{2}','{3}')", name, isHockey, unqiueName, DateTime.Now.ToString());
                    }
                    //String query = String.Format("INSERT INTO dbo.Users(Name,IsHockey,UserImage,CreatedOn) Values('{0}','{1}','{2}','{3}')", name, isHockey, unqiueName, DateTime.Now.ToString());
                    SqlCommand command = new SqlCommand(query, conn);
                    var recEff = command.ExecuteNonQuery();

                }
                catch (Exception ex)
                {

                }
            }


            LoadDataInGrid();


        }

        private void Form1_Load(object sender, EventArgs e)
        {
            dataGridView1.AutoGenerateColumns = false;
            String applicationBasePath = System.IO.Path.GetDirectoryName(Application.ExecutablePath);
            System.IO.Directory.CreateDirectory(applicationBasePath + @"\images\");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            LoadDataInGrid();
        }

        private void LoadDataInGrid()
        {
            String connStr = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\LearningInUrdu\PictureBoxPrac\PictureBoxPrac\Database1.mdf;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    String query = "Select * from dbo.Users;";
                    SqlCommand command = new SqlCommand(query, conn);
                    var reader = command.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(reader);

                    dataGridView1.DataSource = dt;

                }
                catch (Exception ex)
                {

                }
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 2) //Edit column
            {
                int id = (int)dataGridView1.CurrentRow.Cells[0].Value;
                LoadData(id);
            }
        }

        private void LoadData(int id)
        {
            String connStr = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\LearningInUrdu\PictureBoxPrac\PictureBoxPrac\Database1.mdf;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    String query = String.Format("Select * from dbo.Users Where ID = {0}", id);
                    SqlCommand command = new SqlCommand(query, conn);
                    var reader = command.ExecuteReader();

                    //We are expecting one record
                    if (reader.Read())
                    {
                        _idToEdit = reader.GetInt32(0);
                        var name = reader.GetString(1);
                        var isHockey = reader.GetBoolean(2);
                        var imageName = reader.GetString(3);

                        textBox1.Text = name;
                        checkBox1.Checked = isHockey;

                        String applicationBasePath = System.IO.Path.GetDirectoryName(Application.ExecutablePath);

                        String filePath = applicationBasePath + @"\images\" + imageName;
                        pictureBox1.Image = Image.FromFile(filePath);

                    }

                }
                catch (Exception ex)
                {

                }
            }
        }
    }
}
