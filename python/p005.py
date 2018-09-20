"""
    
Project Euler - Problem 5 - Smallest multiple
https://projecteuler.net/problem=5

"""
import timing
from functools import reduce

def main():
    print(calc(20))


def calc(n):
	nums = [1]

	for i in range(2, n+1):
		for j in nums:
			if i % j == 0:
				i /= j
				if i == 1: break	
		nums.append(i)
	return reduce(lambda x, y: x * y, nums)
    

if __name__ == '__main__':
    main()
