import timing
from eulerutil import *

'''
Prime digit replacements
Problem 51

By replacing the 1st digit of the 2-digit number *3, it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.

By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit number is the first example having seven primes among the ten generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and 56993. Consequently 56003, being the first member of this family, is the smallest prime with this property.

Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with the same digit, is part of an eight prime value family.
'''

def diff(a,b):
	# input - int a,int b
	# output - a set of digit positions that are different
	index = tuple(i for i in range(len(str(a))) if str(a)[i]!=str(b)[i])
	chars = tuple(str(a)[i] if i not in index else "*" for i in range(len(str(a))))
	return index, chars

minp = 1000
maxp = 10000
primes = {x for x in range(minp,maxp) if is_prime(x)}

diff_matrix = dict()
for p in primes:
	for q in primes-{p}:
		if (tuple(diff(p,q))) in diff_matrix:
 			diff_matrix[tuple(diff(p,q))] |= {p,q}
 		else:
 			diff_matrix[tuple(diff(p,q))] = {p,q}

for x in diff_matrix:
	if len(diff_matrix[x])==8:
		print(x,diff_matrix[x])













