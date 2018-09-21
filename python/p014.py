"""
    
Project Euler - Problem 14 - Longest Collatz sequence
https://projecteuler.net/problem=14

"""
import timing
from eulerutil import is_even

def main():
	limit = 1000000
	chain = {1: 1}
	longest = 1

	for seed in range(2, limit):
		length = 1
		n = seed
		while n > 1:
			n = collatz(n)
			if n in chain:	
				break
			length += 1
			
		chain[seed] = chain[n] + length
		
		if chain[seed] > chain[longest]:
			longest = seed

	print(f'length = {chain[longest]}')
	print(f'Seed = {longest}')



def collatz(n):
	if is_even(n):
		return n//2
	return 3*n+1

if __name__ == '__main__':
    main()
