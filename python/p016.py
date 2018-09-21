"""
    
Project Euler - Problem 16 - Power digit sum
https://projecteuler.net/problem=16

"""
import timing
from eulerutil import is_even

def main():
	n = 2**1000
	s = str(n)
	x = [int(s[d]) for d in range(len(s))]
	print(sum(x))

if __name__ == '__main__':
    main()

