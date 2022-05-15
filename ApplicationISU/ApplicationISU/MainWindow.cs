using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ApplicationISU
{
    public partial class MainWindow : Form
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var student = new Student();
            student.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var subject = new Subjects();
            subject.Show();
            this.Hide();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            var teacher = new TeacherList();
            teacher.Show();
            this.Hide();
        }
    }
}
