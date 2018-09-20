"""
    
Project Euler - Problem 10 - Summation of primes
https://projecteuler.net/problem=10

"""
import timing
from eulerutil import primes

def main():
	
	answer = 0
	for p in primes(2000000):
		answer += p

	print(answer)


if __name__ == '__main__':
    main()
