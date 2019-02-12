"use strict";
//http://nsayer.blogspot.com.au/2007/07/algorithm-for-evaluating-poker-hands.html

function Card(value, suit) {
	
	// check if the constructor was NOT called with "new".
	if ( !(this instanceof Card) ) 
	{
	    return new Card(value, suit);
	} 

	var values = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"],
		suits = ["D", "C", "H", "S"],
		_value, 
		_suit, 
		_rank;
	
	var __construct = function() 
	{
		_value = value;
		_suit = suit;
		_rank = values.indexOf(value);
	}()

	this.getRank = function()
	{
		return _rank; 
	}

	this.getValue = function() 
	{
		return _value; 
	}

	this.getSuit = function() 
	{	
		return _suit; 
	}

	this.face = function() 
	{ 
		return _value + _suit; 
	}
}

function Hand(card1, card2, card3, card4, card5) {
	
	// if the constructor was not called with "new".
	if ( !(this instanceof Hand) ) 
	{ 
	    return new Hand(card1, card2, card3, card4, card5);
	} 

	var cards,
		rank;

	var __construct = function()
	{
		cards = [card1, card2, card3, card4, card5];
		rank = rankHand(cards);
	}()

	this.getCards = function() 
	{ 
		return cards; 
	}

	this.getRank = function() 
	{ 
		return rank; 
	}

	this.faces = function()
	{
		return cards
			.map(function(c) 
				{ 
					return c.face(); 
				}
			);
	}

	this.getSortedCards = function(isDescending) 
	{
		if (typeof isDescending == "undefined") 
		{
			isDescending = true;
		}

		return cards
			.sort(function(a, b) 
				{
					if (isDescending)
					{
						return a.getRank() < b.getRank();
					}
					else
					{
						return a.getRank() > b.getRank();
					}
				}
			)
	}

	this.compare = function(otherHand) {
		/*
		 *	Returns 1 of 3 outomes.
		 *	1 : this players hand wins
		 *	0 : the hands are tied
		 *	-1: the opponents hand wins 
		 */
		var thisRank = rank,
			otherRank = otherHand.getRank(),
			outcome = {
				"win": 1,
				"draw": 0,
				"lose": -1
			};

		if (thisRank > otherRank) 
		{
			return outcome.win;
		}
		else if (otherRank > thisRank) 
		{
			return outcome.lose;
		}
		else 
		{
			// the ranks are the same so we compare card ranks
			return compareHistogram(this, otherHand, outcome);
		}
	}
}

function ranks(s) 
{
	const ranks = 
	{
	 	"High card": 1,
	 	"One pair": 2,
	 	"Two pairs": 3,
	 	"Three of a kind": 4,
	 	"Straight": 5,
	 	"Flush": 6,
	 	"Full house": 7,
	 	"Four of a kind": 8,
	 	"Straight flush": 9,
	}

	return ranks[s];
}

function rankHand(cards) 
{
	var hist = histogram(cards),
		isF = isFlush(cards),
		isS = isStraight(cards);

	if (isF && isS) 
	{
		return ranks("Straight flush");
	}
	else if ( equal(hist, [4,1]) )
	{
		return ranks("Four of a kind");
	}
	else if ( equal(hist, [3,2]) )
	{
		return ranks("Full house");
	}
	else if (isF) 
	{
		return ranks("Flush");
	}
	else if (isS) 
	{
		return ranks("Straight");
	}
	else if ( equal(hist, [3,1,1]) )
	{
		return ranks("Three of a kind");
	}
	else if ( equal(hist, [2,2,1]) ) 
	{
		return ranks("Two pairs");	
	}
	else if ( equal(hist, [2,1,1,1]) ) 
	{
		return ranks("One pair");
	}

	return ranks("High card");
}

function histogram(cards, asMap) 
{
	if ( typeof asMap == "undefined" )
	{
		asMap = false;
	}

	var hist = {},
		key = 0;

	for (var i=0; i<5; i++) 
	{
		key = cards[i].getRank();

		if ( hist.hasOwnProperty(key) ) 
		{
			hist[key] += 1;	
		}
		else
		{
			hist[key] = 1;
		}
	}
	
	if ( asMap )
	{
		return hist;
	}
	else
	{
		return Object
			.keys(hist)
			.map(function(key) 
				{ 
					return hist[key]; 
				}
			)
			.sort(function(a, b) 
				{ 
					return b > a; 
				}
			);
	}
}

function equal(a, b) 
{
	// check if array a and array b are equal (element by element)
	if (a.length != b.length) 
	{
		return false;
	}

	for (var i=0, l=a.length; i<l; i++) 
	{
		if (a[i] != b[i]) 
		{
			return false;
		}
	}

	return true;
}

function isFlush(cards) 
{
	for (var i=1; i<5; i++) 
	{
		if (cards[i].getSuit() != cards[i-1].getSuit()) 
		{
			return false;
		}
	}

	return true;
}

function isStraight(cards) 
{
	var ranks = 
		cards
		.map(function(c) 
			{
				return c.getRank() 
			}
		)
		.sort(function(a, b) 
			{ 
				return a > b; 
			}
		);

	for (var i=1; i<5; i++) {
		if (ranks[i] != ranks[i-1] + 1)
		{
			return false;
		}
	}

	return true;
}

function compareHistogram(thisHand, otherHand, outcome)
{
	var a = toArray(histogram(thisHand.getCards(), true)).sort(descending),
		b = toArray(histogram(otherHand.getCards(), true)).sort(descending),
		l = a.length,
		i = 0;

	for (i=0; i<l; i++)
	{
		if (a[i][0] > b[i][0])
		{
			return outcome.win;
		}
		else if (b[i][0] > a[i][0])
		{
			return outcome.lose;
		}
	}

	return outcome.draw;
}

function toArray(object)
{
	var array = [];

	for (var key in object)
	{
		array.push([parseInt(key, 10), object[key]]);
	}

	return array;
}

function descending(a, b)
{
	// Used for .sort(descending)
	if (a[1] == b[1])
	{
		if (a[0] < b[0])
		{
			return 1;
		}
		else
		{
			return -1;
		}
	}
	else
	{
		return a[1] < b[1];
	}
}




// var c11 = new Card("A","C");
// var c12 = new Card("Q","C");
// var c13 = new Card("Q","C");
// var c14 = new Card("J","D");
// var c15 = new Card("J","C");
// var h1 = new Hand(c11, c12, c13, c14, c15);

// var c21 = new Card("4","D");
// var c22 = new Card("Q","D");
// var c23 = new Card("Q","C");
// var c24 = new Card("J","D");
// var c25 = new Card("J","D");
// var h2 = new Hand(c21, c22, c23, c24, c25);

// console.log(h1.getRank());
// console.log(h2.getRank());
// console.log(h1.compare(h2));

module.exports.Card = Card;
module.exports.Hand = Hand;