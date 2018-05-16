"""

Project Euler - Problem 001 - Multiples of 3 and 5
https://projecteuler.net/problem=1

"""
import timing


def main():
	print(calc())


def calc():
	return sum([x for x in range(1000) if x % 3 == 0 or x % 5 == 0])


if __name__ == '__main__':
	main()