import timing

'''
Powerful digit sum
Problem 56

A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.

Considering natural numbers of the form, a^b, where a, b < 100, what is the maximum digital sum?
'''

max_sum = 0
for a in range(100):
	for b in range(100):
		ab = str(a**b)
		sum_digits = sum([int(i) for i in ab])
		if sum_digits > max_sum:
			max_sum = sum_digits
print(max_sum)


