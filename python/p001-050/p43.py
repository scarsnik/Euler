import timing

from itertools import permutations
from eulerutil import is_pandigital
'''
Sub-string divisibility
Problem 43

The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:
•d_2,d_3,d_4=406 is divisible by 2
•d_3,d_4,d_5=063 is divisible by 3
•d_4,d_5,d_6=635 is divisible by 5
•d_5,d_6,d_7=357 is divisible by 7
•d_6,d_7,d_8=572 is divisible by 11
•d_7,d_8,d_9=728 is divisible by 13
•d_8,d_9,d_10=289 is divisible by 17

Find the sum of all 0 to 9 pandigital numbers with this property.

'''

digits = "0123456789"
primes = [0,2,3,5,7,11,13,17]
perms =  [''.join(s) for s in list(permutations(digits,10))]

nums = []

for p in perms:
	state = True
	# print(p)
	for i in range(1,8):
		# print(int(str(p)[i:i+3]))
		if int(str(p)[i:i+3])%primes[i]!=0:
			state = False
	if state: nums+=[p]
print(nums)
print(sum([int(i) for i in nums]))
