from math import floor, sqrt

'''Non-abundant sums
Problem 23
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
'''

def isAbundant(n):
	A = set()
	for i in range(1,floor(sqrt(n))+1):
		if n % i == 0:
			A |= {i}
			if i != 1: A |= {int(n/i)}
	return sum(A) > n

def abundantList(limit):
	S = set()
	for i in range(1,limit+1):
		if isAbundant(i): S |= {i}
	return sorted(list(S))

def sum2Abundant(A, limit):
	S = set()
	for i in range(len(A)):
		for j in range(i,len(A)):
			sum2 = A[i]+A[j]
			if sum2<=limit:
				S |= {sum2}
			else:
				break
	return S

n = 28123
A = abundantList(n)
sum2 = sum2Abundant(A, n)
nonSum2 = set(range(n+1))-sum2

print(sum(sum2))
print(sum(nonSum2))

# print(sum(sum2),sorted(list(sum2)))
# print(sum(nonSum2),sorted(list(nonSum2)))

