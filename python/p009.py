"""
    
Project Euler - Problem 9 - Special Pythagorean triplet
https://projecteuler.net/problem=9

"""
import timing
from functools import reduce
from eulerutil import pythagorean_triple

def main():
	
	for m in range(1000):
		for n in range(1000):
			triple = pythagorean_triple(m, n)
			if sum(triple) == 1000:
				answer = reduce(lambda x, y: x * y, triple)
				break

	print(answer)


if __name__ == '__main__':
    main()
