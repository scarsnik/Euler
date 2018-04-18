import timing
from time import time
from eulerutil import *

'''
Consecutive prime sum
Problem 50
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
'''
start = time()
limit = 1000000
primelist = [p for p in range(limit) if is_prime(p)]
primeset = set(primelist)
size = len(primelist)

p, q, m, n = 0, 0, 0, 0
for i in range(size-1):
	sum = primelist[i]
	for j in range(i+1,size):
		sum+=primelist[j]
		if sum > limit: break
		if sum in primeset:
			if j-i+1 > m:
				p, q, m, n = i, j, j-i+1, sum

print(p,q,m,n)
print(primelist[p:q+1])


