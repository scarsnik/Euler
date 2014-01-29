import timing
from itertools import permutations, combinations
from eulerutil import *
'''
Prime permutations
Problem 49

The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this sequence?
'''

def spacing(L):
	slist = sorted(list(L))
	return [slist[i]-slist[i-1] for i in range(1,len(L))]

for nums in range(1000,9999):
	digits = str(nums)
	if "0" not in digits:
		comb4digits = [''.join(p) for p in list(combinations(digits,4))]
		for p in comb4digits:
			permute4 = [int(''.join(i)) for i in list(permutations(p,4))]
			primes4 = [p for p in permute4 if is_prime(p)]

			comb3 = list(combinations(primes4,3))
			spacing3 = {i:spacing(list(i)) for i in comb3}
			for x in spacing3:
				# print(x,spacing3[x])
				if spacing3[x][0]==spacing3[x][1] and spacing3[x][1]!=0:
					print(x,spacing3[x])
