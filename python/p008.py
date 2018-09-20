"""
    
Project Euler - Problem 8 - Largest product in a series
https://projecteuler.net/problem=8

"""
import timing
from functools import reduce

def main():
	n_digits = 13

	file = open('./data/p008.txt', 'r')
	thousand_digits = ''.join(file.readlines()).replace('\n', '')
	size = len(thousand_digits)

	answer = 0
	for i in range(size - n_digits):
		nums = map(lambda x: int(x), thousand_digits[i : i+n_digits])
		prod = reduce(lambda x, y: x * y, nums)
		if prod > answer:
			answer = prod

	print(answer)


if __name__ == '__main__':
    main()
