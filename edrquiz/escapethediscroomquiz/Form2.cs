using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form2 : Form
    {
        static string serverName = "127.0.0.1";
        static string port = "5432";
        static string userName = "postgres";
        static string password = "pgadmin";
        static string databaseName = "quiz";
        NpgsqlConnection pgsqlconnection = null;
        string stringConexao = null;
        private Form1 form1;
        public Form2(Form1 form1)
        {
            InitializeComponent();
            this.form1 = form1;
        }
        public Form2()
        {
            InitializeComponent();
        }
        public void button1_Click(object sender, EventArgs e)
        {
            stringConexao = String.Format("Server={0}; Port={1}; UserId={2}; Password={3}; Database={4};", serverName, port, userName, password, databaseName);
            int pontuacao = form1.pontuacao;
            string nome = textBox1.Text;
            AddNomeEPontosBanco(nome, pontuacao);
            AtualizarListBox();
        }
        private void AddNomeEPontosBanco(string nome, int pontuacao)
        {
            using (pgsqlconnection = new NpgsqlConnection(stringConexao))
            {
                pgsqlconnection.Open();
                string sql = "CREATE TABLE IF NOT EXISTS quiz (nome VARCHAR(50), pontuacao VARCHAR(2)); INSERT INTO quiz VALUES (@nome, @pontuacao);";
                NpgsqlCommand command = new NpgsqlCommand(sql, pgsqlconnection);
                command.Parameters.AddWithValue("@nome", nome);
                command.Parameters.AddWithValue("@pontuacao", pontuacao);
                command.ExecuteNonQuery();
                pgsqlconnection.Close();
            }
        }
        private void AtualizarListBox()
        {
            listBox1.Items.Clear();
            using (pgsqlconnection = new NpgsqlConnection(stringConexao))
            {
                pgsqlconnection.Open();
                string sql = "SELECT nome, pontuacao FROM quiz ORDER BY pontuacao DESC;";
                NpgsqlCommand Command = new NpgsqlCommand(sql, pgsqlconnection);
                NpgsqlDataAdapter Adapt = new NpgsqlDataAdapter(sql, pgsqlconnection);
                DataTable dt = new DataTable();
                NpgsqlDataReader reader = Command.ExecuteReader();
                while (reader.Read())
                {
                    string exibirTexto = reader["Nome"] + " - " + reader["Pontuacao"] + " pontos";
                    listBox1.Items.Add(exibirTexto);
                    textBox1.Clear();
                }
                pgsqlconnection.Close();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form1 form1 = new Form1 ();
            form1.Show();
            this.Hide();
        }
    }
}
