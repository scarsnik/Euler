import timing
from eulerutil import *
import math
'''
Spiral primes
Problem 58

Starting with 1 and spiralling anticlockwise in the following way, a square spiral with side length 7 is formed.

37 36 35 34 33 32 31
38 17 16 15 14 13 30
39 18  5  4  3 12 29
40 19  6  1  2 11 28
41 20  7  8  9 10 27
42 21 22 23 24 25 26
43 44 45 46 47 48 49

It is interesting to note that the odd squares lie along the bottom right diagonal, but what is more interesting is that 8 out of the 13 numbers lying along both diagonals are prime; that is, a ratio of 8/13 ≈ 62%.

If one complete new layer is wrapped around the spiral above, a square spiral with side length 9 will be formed. If this process is continued, what is the side length of the square spiral for which the ratio of primes along both diagonals first falls below 10%?
'''

threshold = 0.1
pre = [3,5,7,9]
size, primes, i = 1+len(pre), 3, 1
while True:
	# print(pre, size, primes)
	new = [pre[x-1]+i*8+2*x for x in range(1,5)]
	size += 4
	primes += len([p for p in new if is_prime(p)])
	pre = new
	if primes/size < threshold: break
	i+=1

print(new)
print(math.sqrt(new[3]))