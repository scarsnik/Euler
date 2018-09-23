"""
	
Project Euler - Problem 23 - Non-abundant sums
https://projecteuler.net/problem=23

"""
import timing
from eulerutil import is_abundant, proper_divisors

def main():
	limit = 28123
	
	abundant_set = set()
	abundant_sums = set()

	for n in range(1, limit+1):
		if is_abundant(n):
			abundant_set |= {n}
			abundant_sums |= sum_all(limit, abundant_set, n)

	answer = sum(set(range(limit+1)) - abundant_sums)
	print(answer)


def sum_all(limit, nums, n):
	result = set()
	for i in nums:
		s = n + i
		if s <= limit:
			result |= {s}
	return result

if __name__ == '__main__':
	main()

