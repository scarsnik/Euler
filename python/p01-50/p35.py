import timing
import eulerutil
import itertools
import copy
'''
Circular primes

Problem 35

The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
'''
def rotations(n):
	results = []
	num = [str(i) for i in str(n)]
	for i in range(len(num)):
		num.insert(0,num.pop())
		results.append(''.join(list(num)))
	return results

max = 1000000
count = 0
for n in range(2,max):
	if eulerutil.isprime(n):
		if all([eulerutil.isprime(int(i)) for i in rotations(n)]):
			count += 1
		if n%10000==0: print(n)
print(count)