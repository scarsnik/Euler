"""

Project Euler - Problem 21 - Amicable numbers
https://projecteuler.net/problem=21

"""



def main():


def prime_decomposition(n):
	"""
	Source: https://rosettacode.org/wiki/Prime_decomposition#Python
	"""
	step = lambda x: 1 + (x<<2) - ((x>>1)<<1)
    maxq = long(floor(sqrt(n)))
    d = 1
    q = n % 2 == 0 and 2 or 3 
    while q <= maxq and n % q != 0:
        q = step(d)
        d += 1
    return q <= maxq and [q] + fac(n//q) or [n]
 


"""
Let d(n) be defined as the sum of proper divisors of n (numbers less than n 
which divide evenly into n).

If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and 
each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 
and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 
142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
"""

if __name__ == "__main__":
	main()
