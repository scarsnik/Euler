import timing
import math
'''
Diophantine equation
Problem 66
Consider quadratic Diophantine equations of the form:

x^2 – Dy^2 = 1

For example, when D=13, the minimal solution in x is 649^2 – 13×180^2 = 1.

It can be assumed that there are no solutions in positive integers when D is square.

By finding minimal solutions in x for D = {2, 3, 5, 6, 7}, we obtain the following:

3^2 – 2×2^2 = 1
2^2 – 3×1^2 = 1
9^2 – 5×4^2 = 1
5^2 – 6×2^2 = 1
8^2 – 7×3^2 = 1

Hence, by considering minimal solutions in x for D ≤ 7, the largest x is obtained when D=5.

Find the value of D ≤ 1000 in minimal solutions of x for which the largest value of x is obtained.
'''

D = {x for x in range(2,1001) if math.sqrt(x)%1!=0}
print(D)

xmax = 0
for d in D:
	y = 1
	while True:
		# if y%10000000==0: print(y,d)
		r = d*y**2 + 1
		x = math.sqrt(r)
		if x%1==0:
			if x > xmax: xmax = x
			# print(str(int(x))+"^2 - "+str(d)+"*"+str(y)+"^2 = 1")
			break
		y+=1
print("x = "+str(xmax))


========================================
0:00:00.000 - Start Program
========================================
x = 2178548422.0
========================================
2:07:28.448 - End Program
Elapsed time: 2:07:28.444
========================================

