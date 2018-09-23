"""
	
Project Euler - Problem 27 - Quadratic primes
https://projecteuler.net/problem=27

"""
import timing
from eulerutil import is_prime

def main():
	lo, hi = -999, 1000

	largest = 0
	answer = 0
	for a in range(lo, hi):
		for b in range(lo, hi):
			n = 0
			while is_prime(f(n, a, b)):
				n += 1

			if n > largest:
				largest = n
				answer = (a, b)

	print(largest, answer, answer[0]*answer[1])


def f(n, a, b):
	return (n**2) + (a*n) + b

if __name__ == '__main__':
	main()
