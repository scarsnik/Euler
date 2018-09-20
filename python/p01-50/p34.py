import timing
import math

'''
Digit factorials

Problem 34

145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
'''

nums = []
for n in range(3,50000):
	total = sum([math.factorial(int(s)) for s in [x for x in str(n)]])
	if total == n:
		nums.append(n)
		print(n)
print("total sum:",sum(nums))
