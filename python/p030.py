"""
	
Project Euler - Problem 30 - Digit fifth powers
https://projecteuler.net/problem=30

"""
import timing

def main():

	p = 5
	nums = [i for i in range(2, 1000000) if digit_powers(i, p) == i]
	print(nums)
	print(sum(nums))


def digit_powers(n, p):
	return sum([int(i)**p for i in str(n)])

if __name__ == '__main__':
	main()
