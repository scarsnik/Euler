import timing
from eulerutil import gcd
'''
Ordered fractions
Problem 71
Consider the fraction, n/d, where n and d are positive integers. If n<d and HCF(n,d)=1, it is called a reduced proper fraction.

If we list the set of reduced proper fractions for d ≤ 8 in ascending order of size, we get:

1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8

It can be seen that 2/5 is the fraction immediately to the left of 3/7.

By listing the set of reduced proper fractions for d ≤ 1,000,000 in ascending order of size, find the numerator of the fraction immediately to the left of 3/7.
'''

max_d = 1000000
rpf = dict()
lower = 0
upper = 3/7
for d in range(1,max_d+1):
	for n in range(int(lower*d),d):
		if n/d > upper: break
		if lower <= n/d <= upper:
			if gcd(n,d)==1:
				rpf[n,d] = n/d
				if len(rpf.keys())>1:
					i,j = sorted(rpf, key=rpf.get)[-2]
					lower = i/j
					# answer = rpf
					rpf = {key:rpf[key] for key in rpf if rpf[key]>=lower}

print(sorted(rpf, key=rpf.get))
# print(sorted(rpf, key=rpf.get)[-2])
# print(max_d,len(rpf))

# rpf = dict()
# for d in range(1,max_d+1):
# 	for n in range(1,d):
# 		if n/d > 3/7: break
# 		if n/d <= 3/7 and gcd(n,d)==1:
# 			rpf[n,d] = n/d
# print(sorted(rpf, key=rpf.get)[:-4:-1])				