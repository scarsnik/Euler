"""
    
Project Euler - Problem 9 - Special Pythagorean triplet
https://projecteuler.net/problem=9

"""
import timing
from functools import reduce

def main():
	
	for m in range(1000):
		for n in range(1000):
			triple = pythagorean_triple(m, n)
			if sum(triple) == 1000:
				answer = reduce(lambda x, y: x * y, triple)
				break

	print(answer)


def pythagorean_triple(m, n):
	a = (m**2) - (n**2)
	b = 2 * m * n
	c = (m**2) + (n**2)
	return a, b, c

if __name__ == '__main__':
    main()
