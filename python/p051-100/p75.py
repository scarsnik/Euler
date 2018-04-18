import timing
from eulerutil import *

'''
Singular integer right triangles
Problem 75
It turns out that 12 cm is the smallest length of wire that can be bent to form an integer sided right angle triangle in exactly one way, but there are many more examples.

12 cm: (3,4,5)
24 cm: (6,8,10)
30 cm: (5,12,13)
36 cm: (9,12,15)
40 cm: (8,15,17)
48 cm: (12,16,20)

In contrast, some lengths of wire, like 20 cm, cannot be bent to form an integer sided right angle triangle, and other lengths allow more than one solution to be found; for example, using 120 cm it is possible to form exactly three different integer sided right angle triangles.

120 cm: (30,40,50), (20,48,52), (24,45,51)

Given that L is the length of the wire, for how many values of L ≤ 1,500,000 can exactly one integer sided right angle triangle be formed?
'''
def abc(m,n):
	return (m**2-n**2), (2*m*n), (m**2+n**2)

limit = 1500000
length = dict()
start, end = 1,1000
for n in range(start,end-1):
	for m in range(n+1,end):
		if (m-n)%2==1 and gcd(m,n)==1:
			a,b,c = abc(m,n)
			total = a+b+c
			if total <= limit: 
				length[total] = 1 if total not in length else length[total]+1
			k = 2
			while True:
				if total*k > limit: break
				length[total*k] = 1 if total*k not in length else length[total*k]+1
				k+=1

print(sum([1 for k in length if length[k]==1]))





