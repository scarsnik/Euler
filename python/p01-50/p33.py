import timing
from eulerutil import *

'''
Digit canceling fractions


Problem 33


The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
'''



for a in range(1,10):
	for b in range(1,10):
		for i in range(1,10):
			for j in range(1,10):
				n = a*10+b
				d = i*10+j
				if n < d:
					if a==i and n/d == b/j:
						print(n,d,n/d)
					elif a==j and n/d == b/i:
						print(n,d,n/d)
					elif b==i and n/d == a/j:
						print(n,d,n/d)
					elif b==j and n/d == a/i:
						print(n,d,n/d)

print(0.25*0.2*0.4*0.5)
d = 16/64*19/95*26/65*49/98
print(d)

print(lcm(98,lcm(65,lcm(64,95))))