import timing
from math import sqrt
'''
Pentagon numbers
Problem 44

Pentagonal numbers are generated by the formula, Pn=n(3n−1)/2. The first ten pentagonal numbers are:

1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...

It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, their difference, 70 − 22 = 48, is not pentagonal.

Find the pair of pentagonal numbers, Pj and Pk, for which their sum and difference are pentagonal and D = |Pk − Pj| is minimised; what is the value of D?
'''

def pentagonal(n):
	return int(n*(3*n-1)/2)

def is_pentagonal(n):
	p = int((0.5+sqrt(0.25+(6*n)))/3)
	return pentagonal(p)==n

a, b = 1, 0
done = False
while not done:
	a += 1
	for b in range(1,a):
		j, k = pentagonal(a), pentagonal(b)
		if j!=k and is_pentagonal(j+k) and is_pentagonal(abs(j-k)):
			print(a,b,j,k,j+k,abs(j-k))
			done = True
			break