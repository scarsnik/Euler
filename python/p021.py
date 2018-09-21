"""
	
Project Euler - Problem 21 - Amicable numbers
https://projecteuler.net/problem=21

"""
import timing
from eulerutil import proper_divisors

def main():
	answer = 0
	for n in range(10000):
		if has_amicable_pair(n):
			answer += n

	print(answer)

def has_amicable_pair(n):
	b = sum(proper_divisors(n))
	a = sum(proper_divisors(b))
	return a == n and a != b

		
if __name__ == '__main__':
	main()
