"""
	
Project Euler - Problem 39 - Integer right triangles
https://projecteuler.net/problem=39

"""
import timing
from math import gcd
from eulerutil import pythagorean_triple, odd


def main():
    limit = 1001
    freq = {}

    n = 2
    while True:
        for m in range(1, n):
            if gcd(m, n) != 1 or (odd(m) and odd(n)): continue 
            perim = sum(pythagorean_triple(m, n))
            
            if perim > limit:
                n += 1
                break

            k = 1
            while True:
                if k * perim > limit: break 
                freq[perim*k] = freq.get(perim*k, 0) + 1
                k += 1
        else:
            n += 1
        if sum(pythagorean_triple(1, n)) > limit or n > 30:
            break

    print(max(freq, key=lambda x: freq[x]))


if __name__ == '__main__':
	main()
