"""
	
Project Euler - Problem 34 - Digit factorials
https://projecteuler.net/problem=34

"""
import timing
from math import factorial

def main():
    nums = []
    for n in range(3,50000):
        total = sum([factorial(int(s)) for s in [x for x in str(n)]])
        if total == n:
            nums.append(n)
    
    print(sum(nums))

if __name__ == '__main__':
	main()
