import timing

'''
Powerful digit counts
Problem 63

The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit number, 134217728=8^9, is a ninth power.

How many n-digit positive integers exist which are also an nth power?
'''

count = 0
for n in range(1,10000):
	p = 1
	while True:
		if len(str(n**p))==p:
			print(n,p,n**p)
			count +=1
		else:
			break
		p+=1
print(count)
