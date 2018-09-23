"""
	
Project Euler - Problem 24 - Lexicographic permutations
https://projecteuler.net/problem=24

"""
import timing
from itertools import permutations

def main():
	limit = 1000000
	
	nums = '0123456789'
	perm = permutations(nums, 10)
	print(''.join(list(perm)[limit-1]))


if __name__ == '__main__':
	main()

