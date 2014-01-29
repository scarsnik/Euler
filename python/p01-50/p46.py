import timing
from eulerutil import *
'''
Goldbach's other conjecture
Problem 46

It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.

9  = 7 + 2×1^2
15 = 7 + 2×2^2
21 = 3 + 2×3^2
25 = 7 + 2×3^2
27 = 19 + 2×2^2
33 = 31 + 2×1^2

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
'''

count = 0
n = 5601
done = False
while not done:
	n+=2
	count+=1
	if count%100==0: print(n)
	found = False
	if not is_prime(n):
		for p in prime_sieve(n):
			if sqrt((n-p)/2)%1==0: 
				found = True
				break
		if not found:
			print(n)
			done = True
			break

