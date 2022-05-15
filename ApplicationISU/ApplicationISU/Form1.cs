using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ApplicationISU
{
    public partial class Student : Form
    {
        MySqlConnection conn = DBConnection.DbConnect();
        public Student()
        {
            InitializeComponent();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string univer = comboBox1.SelectedItem.ToString();
            string student = textBox1.Text.ToString();
            conn.Open();
            string sqlStatement = "INSERT INTO student (name_student, id_univer) VALUES (@name_student, (SELECT id from university WHERE NAME = @id_univer));";
            MySqlCommand cmd = new MySqlCommand(sqlStatement, conn);
            cmd.Parameters.AddWithValue("@name_student", student);
            cmd.Parameters.AddWithValue("@id_univer", univer);
            cmd.ExecuteNonQuery();
            
            conn.Close();
            MessageBox.Show("Маълумот ба БМ ворид карда шуд.");
            
            textBox1.Text = " ";
        }

       

        private void Form1_Load(object sender, EventArgs e)
        {
            conn.Open();

            string sqlCombo = "Select name from university";            
            MySqlCommand cmd = new MySqlCommand(sqlCombo, conn);
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                string name = reader.GetString("name");
                comboBox1.Items.Add(name);
            }

            reader.Close();
            conn.Close();
            comboBox1.SelectedIndex = 0;
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            MainWindow main = new MainWindow();
            main.Show();
            this.Hide();
        }
    }
}
