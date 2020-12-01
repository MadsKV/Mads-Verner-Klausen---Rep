﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using CardForm;


namespace CardForm
{
    public partial class CardGeneratorIndex : Form
    {
        Deck myDeck;
        public CardGeneratorIndex()
        {
            InitializeComponent();
        }
        public static SqlConnection Connection()
        {
            SqlConnectionStringBuilder builder =
            new SqlConnectionStringBuilder();

            //Finds and Uses the correct Database
            builder.DataSource = @"MADS-V-KLAUSEN\MSSQLSERVER01";
            //builder.DataSource = @"DESKTOP-CHHJASV\SQLEXPRESS";
            builder.InitialCatalog = "Cards";
            builder.IntegratedSecurity = true;

            //Opens the database's connection
            SqlConnection connection = new SqlConnection(builder.ConnectionString);
            connection.Open();
            return connection;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        //Generates the deck, sorts it out in Value, Suit and color and afterwards prints it to the textbox.
        private void generateDeck_Click(object sender, EventArgs e)
        {
            myDeck = new Deck();
            //deck.FillDeck();
            //deck.PrintDeck();
            myDeck.FillDeck2();
            string newLine = Environment.NewLine;
            textWindow.Text = myDeck.PrintDeck2();

        }
        //Choose if you want to modify the deck your about to create.
        private void chooseDeck_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void missingCard_Click(object sender, EventArgs e)
        {

        }

        private void userWindow_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //Asks for confirmation and terminates the application.
        private void exit_Click(object sender, EventArgs e)
        {
            const string message = "Are you sure you want to close the application?";
            const string caption = "Form Closing";
            var result = MessageBox.Show(message, caption, MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation);
            Close();
        }

        private void textWindow_TextChanged(object sender, EventArgs e)
        {
            textWindow.ScrollBars = ScrollBars.Vertical;
        }

        //Sends the sorted deck into the DB by the press of the database button.
        public void Database_Click(object sender, EventArgs e)
        {
            CardsToDB cardsToDB = new CardsToDB();
            List<Card> cards1 = myDeck.Cards2;
            SqlConnection connection = Connection();
            foreach (Card card in cards1)
            {
                string c = card.Color.ToString();
                string t = card.Suite.ToString();
                string o = card.Value.ToString();
                cardsToDB.InsertCards(o, t, c, connection);
                //s += card.ToString() + newline;
            }
            
            const string message = "The deck have been saved.";
            const string caption = "Form Closing";
            var result = MessageBox.Show(message, caption, MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
        }
    }
}
