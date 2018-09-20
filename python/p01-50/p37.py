import timing
from eulerutil import isprime
'''
Truncatable primes


Problem 37


The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

'''

def truncate(n):
	num = str(n)
	result = [num]
	for i in range(1,len(num)):
		result.append(num[:i])
		result.append(num[i:])
	return [int(x) for x in result]

count, i = 0, 11
truncatable_primes = []
while True:
	if count>=11: break
	if isprime(i):
		if all([isprime(x) for x in truncate(i)]):
			count += 1
			truncatable_primes.append(i)
	i+=1
	if i%100000==0: print(i,count)

print(truncatable_primes)
print(sum(truncatable_primes))

