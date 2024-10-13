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
    public partial class Form1 : Form
    {
        int respostacerta, totalperguntas;
        public int pontuacao { get; set; }
        int numeropergunta = 1;

        public Form1()

        {
            InitializeComponent();

            Perguntar(numeropergunta);
            totalperguntas = 5;
            pontuacao = 0;
        }
        private void button5_Click(object sender, EventArgs e)
        {
            Form2 frm2rank = new Form2(this);
            frm2rank.Show();
            this.Hide();
        }
        public void EventoChecarResposta(object sender, EventArgs e)
        {
            var senderObject = (Button)sender;

            int buttontag = Convert.ToInt16(senderObject.Tag);
            if (buttontag == respostacerta)
            {
                pontuacao = pontuacao + 5;
            }

            if (numeropergunta == totalperguntas)
            {
                MessageBox.Show("Parabéns, você chegou ao fim do quiz!" + Environment.NewLine + "Agora é só clicar no botão \"Ranking\" para ver a sua pontuação.");
            }
            numeropergunta++;
            Perguntar(numeropergunta);

        }
        public void Perguntar(int numperg)
        {
            switch (numperg)
            {
                case 1:
                    pictureBox1.Image = Properties.Resources.ft1;

                    lblpergunta.Text = "Quantas fases o jogo tem?";

                    button1.Text = "2 fases";
                    button2.Text = "6 fases";
                    button3.Text = "5 fases";
                    button4.Text = "4 fase";

                    respostacerta = 2;

                    break;

                case 2:
                    pictureBox1.Image = Properties.Resources.ft5;

                    lblpergunta.Text = "Quantas vidas o personagem tem?";

                    button1.Text = "3";
                    button2.Text = "1";
                    button3.Text = "2";
                    button4.Text = "4";

                    respostacerta = 3;

                    break;

                case 3:
                    pictureBox1.Image = Properties.Resources.ft2;

                    lblpergunta.Text = "Qual o nome do jogo?";

                    button1.Text = "Escape the Castle";
                    button2.Text = "Protect your Brain";
                    button3.Text = "Escape the Disc Room";
                    button4.Text = "Killer Saws";

                    respostacerta = 3;

                    break;

                case 4:
                    pictureBox1.Image = Properties.Resources.ft3;

                    lblpergunta.Text = "O que as chaves fazem no jogo?";

                    button1.Text = "Passam para a fase seguinte";
                    button2.Text = "Deixam o personagem mais forte";
                    button3.Text = "Liberam personagens novos";
                    button4.Text = "Abrem um baú com tesouros";

                    respostacerta = 1;

                    break;

                case 5:
                    pictureBox1.Image = Properties.Resources.ft4;

                    lblpergunta.Text = "Qual o objetivo do jogo?";

                    button1.Text = "Fugir de vampiros e coletar amuletos";
                    button2.Text = "Sobreviver a ataques de zumbis";
                    button3.Text = "Conseguir a maior quantidade de serras";
                    button4.Text = "Desviar das serras e abrir a porta seguinte";

                    respostacerta = 4;

                    break;
            }
        }
    }
}
