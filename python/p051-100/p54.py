import timing
from itertools import permutations

'''
Poker hands
Problem 54

In the card game poker, a hand consists of five cards and are ranked, from lowest to highest, in the following way:

High Card: Highest value card.
One Pair: Two cards of the same value.
Two Pairs: Two different pairs.
Three of a Kind: Three cards of the same value.
Straight: All cards are consecutive values.
Flush: All cards of the same suit.
Full House: Three of a kind and a pair.
Four of a Kind: Four cards of the same value.
Straight Flush: All cards are consecutive values of same suit.
Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.

The cards are valued in the order:
2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

If two players have the same ranked hands then the rank made up of the highest value wins; for example, a pair of eights beats a pair of fives (see example 1 below). But if two ranks tie, for example, both players have a pair of queens, then highest cards in each hand are compared (see example 4 below); if the highest cards tie then the next highest cards are compared, and so on.

Consider the following five hands dealt to two players:

Hand		Player 1		Player 2		Winner
1		5H 5C 6S 7S KD		2C 3S 8S 8D TD		Player 2
		Pair of Fives		Pair of Eights		

2		5D 8C 9S JS AC		2C 5C 7D 8S QH		Player 1
		Highest card Ace	Highest card Queen		

3		2D 9C AS AH AC		3D 6D 7D TD QD		Player 2
		Three Aces			Flush with Diamonds

4		4D 6S 9H QH QC		3D 6D 7H QD QS		Player 1
		Pair of Queens		Pair of Queens		
		Highest card Nine	Highest card Seven		

5		2H 2D 4C 4D 4S		3C 3D 3S 9S 9D		Player 1
		Full House			Full House		
		With Three Fours	with Three Threes		

The file, poker.txt, contains one-thousand random hands dealt to two players. Each line of the file contains ten cards (separated by a single space): the first five are Player 1's cards and the last five are Player 2's cards. You can assume that all hands are valid (no invalid characters or repeated cards), each player's hand is in no specific order, and in each hand there is a clear winner.

How many hands does Player 1 win?
'''

def values(hand):
	nums, alpha, alpha_new = "23456789", "TJQKA", "ABCDE"
	return [h[0] if h[0] in nums else alpha_new[alpha.index(h[0])] for h in hand]

def suits(hand):
	return [h[1] for h in hand]

def is_1pair(hand):
	vals, pairs = values(hand), 0
	max = 0
	for i in set(vals):
		if vals.count(i) == 2: 
			pairs += 1
			max = i
	return pairs==1

def is_2pair(hand):
	vals, pairs = values(hand), 0
	for i in set(vals):
		if vals.count(i) == 2: pairs += 1
	return pairs==2

def is_3ofakind(hand):
	vals = values(hand)
	for i in set(vals):
		if vals.count(i) == 3: return True
	return False

def is_straight(hand):
	vals = values(hand)
	consecutive = ["23456","34567","45678","56789","6789A","789AB","89ABC","9ABCD","ABCDE"]
	return ''.join(sorted(vals)) in consecutive

def is_flush(hand):
	return len(set(suits(hand)))==1

def is_fullhouse(hand):
	return is_3ofakind(hand) and is_1pair(hand)

def is_4ofakind(hand):
	vals = values(hand)
	for i in vals:
		if vals.count(i) == 4: return True
	return False

def is_straightflush(hand):
	return is_straight(hand) and is_flush(hand)

def is_royalflush(hand):
	return is_flush(hand) and ''.join(sorted(values(hand))) == "ABCDE"

def get_hand(hand):
	if is_royalflush(hand):
		return "royal flush"
	elif is_straightflush(hand):
		return "straight flush"
	elif is_4ofakind(hand):
		return "4 of a kind"
	elif is_fullhouse(hand):
		return "full house"
	elif is_flush(hand):
		return "flush"
	elif is_straight(hand):
		return "straight"
	elif is_3ofakind(hand):
		return "3 of a kind"
	elif is_2pair(hand):
		return "2 pairs"
	elif is_1pair(hand):
		return "1 pair"
	else:
		return "high card"

def hand_value(hand):
	if is_royalflush(hand):
		return 9
	elif is_straightflush(hand):
		return 8
	elif is_4ofakind(hand):
		return 7
	elif is_fullhouse(hand):
		return 6
	elif is_flush(hand):
		return 5
	elif is_straight(hand):
		return 4
	elif is_3ofakind(hand):
		return 3
	elif is_2pair(hand):
		return 2
	elif is_1pair(hand):
		return 1
	else:
		return 0

def get_maxpair(hand):
	vals = values(hand)
	for i in set(vals):
		if vals.count(i) == 2: 
			return(i)


poker_hands = list(open("poker.txt"))
hand = [l.strip().split(" ") for l in poker_hands]

p1wins = 0
for game in hand:
	p1, p2 = game[:5], game[5:]
	p1v, p2v = max(values(p1)), max(values(p2))
	if hand_value(p1) > hand_value(p2): p1wins += 1
	if hand_value(p1) == hand_value(p2):
		if hand_value(p1) == 0:
			if p1v > p2v:
				p1wins += 1
		if hand_value(p1) == 1:
			if get_maxpair(p1) > get_maxpair(p2):
				p1wins += 1
			
print(p1wins)