"""
    
Project Euler - Problem 6 - Sum square difference
https://projecteuler.net/problem=6

"""
import timing
from functools import reduce

def main():
    print(calc(100))


def calc(n):
	sum_sqr = sum([x**2 for x in range(n+1)])
	sqr_sum = sum([x for x in range(n+1)]) ** 2
	return sqr_sum - sum_sqr
    

if __name__ == '__main__':
    main()
