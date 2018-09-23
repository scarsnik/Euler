"""
	
Project Euler - Problem 26 - Reciprocal cycles
https://projecteuler.net/problem=26

"""
import timing
from eulerutil import long_division

def main():
	limit = 1000
	answer = 0
	longest = 0

	for d in range(2, limit):
		r = long_division(1, d)
		l = len(r.split('(')[1])
		if l > longest:
			longest = l
			answer = d

	print(answer)


if __name__ == '__main__':
	main()
