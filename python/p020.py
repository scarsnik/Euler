"""
	
Project Euler - Problem 20 - Factorial digit sum
https://projecteuler.net/problem=20

"""
import timing
from math import factorial

def main():
	f = factorial(100)
	s = str(f)
	answer = sum([int(i) for i in s])
	print(answer)
		
if __name__ == '__main__':
	main()
