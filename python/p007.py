"""
    
Project Euler - Problem 7 - 10,001st prime
https://projecteuler.net/problem=7

"""
import timing
from eulerutil import sieve_primeness, primes

def main():
	answer = None
	i = 0 
	for p in primes(200000):
		i += 1
		if i == 10001:
			answer = p
			break

	print(answer)
		

if __name__ == '__main__':
    main()
