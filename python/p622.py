"""

Project Euler - Problem 622 - Riffle Shuffles
https://projecteuler.net/problem=622

"""
import timing

def main():
	limit = 2500
	
	for target in range(12, 13):
		answer = 0

		for n in range(2, limit, 2):
			cards = Deck(n)
			i = 1		
			while True:
				cards.shuffle()
				if cards.cards == list(range(n)):
					if i == target:
						print(n, i)
						answer += n
					break
				i += 1
		print('====', target, answer)
		print('=====================================================')


class Deck():
	cards = []

	def __init__(self, size):
		self.size = size
		self.cards = list(range(size))

	def __str__(self):
		return str(self.cards)

	def shuffle(self):
		mid = self.size // 2
		left = self.cards[0:mid]
		right = self.cards[mid:self.size]
		for i in range(mid):
			self.cards[2*i] = left[i]
			self.cards[2*i+1] = right[i]


if __name__ == '__main__':
	main()