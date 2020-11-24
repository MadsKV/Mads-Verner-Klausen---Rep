﻿using CardForm;
using System;
using System.Collections.Generic;

namespace CardForm
{

    public class Card
	{
		public enum Suites
		{
			Hearts = 0,
			Diamonds,
			Clubs,
			Spades
		}

		public int Value
		{
			get;
			set;
		}

		public Suites Suite
		{
			get;
			set;
		}

		public string NamedValue
		{
			get
			{
				string name = string.Empty;
				switch (Value)
				{
					case (14):
						name = "Ace";
						break;
					case (13):
						name = "King";
						break;
					case (12):
						name = "Queen";
						break;
					case (11):
						name = "Jack";
						break;
					default:
						name = Value.ToString();
						break;
				}

				return name;
			}
		}

		public string Name
		{
			get
			{
				return NamedValue + " of  " + Suite.ToString();
			}
		}

		public Card(int Value, Suites Suite)
		{
			this.Value = Value;
			this.Suite = Suite;
		}
	}
}
public class Deck
{
	public List<Card> Cards = new List<Card>();
	public void FillDeck()
	{
		int val = 0;
		for (int i = 0; i < 52; i++)
		{
			Card.Suites suite = (Card.Suites)(Math.Floor((decimal)i / 13));
			val = i % 13 + 2;
			Cards.Add(new Card(val, suite));
		}
	}

	public string PrintDeck()
	{
		string s = "";
		string newline = Environment.NewLine;
		Console.WriteLine(Cards.Count);
		foreach (Card card in this.Cards)
        {
            s += card.Name + newline;
			Console.WriteLine(s);
        }
	
		return s;
	}
}
