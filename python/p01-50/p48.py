import timing

'''
Self powers

Problem 48

The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10,405,071,317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1,000^1,000.
'''

sum, max = 0, 1000
for i in range(1,max+1):
	sum += i**i
		
print(sum)