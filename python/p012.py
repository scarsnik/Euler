"""
    
Project Euler - Problem 12 - Highly divisible triangular number
https://projecteuler.net/problem=12

"""
import timing
from eulerutil import proper_divisors

def main():
	limit = 500

	tri, i = 0, 1
	
	found = False
	while not found:
		tri, i = tri + i, i + 1
		divs = proper_divisors(tri)
		# print(tri, divs)
		found = True if len(divs) + 1 > limit else False

	print(tri)

if __name__ == '__main__':
    main()
