import timing

'''
Permuted multiples
Problem 52

It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.
'''

n = 1
while True:
	x1,x2,x3,x4,x5,x6 = n,n*2,n*3,n*4,n*5,n*6
	s1 = sorted(str(x1))
	s2 = sorted(str(x2))
	s3 = sorted(str(x3))
	s4 = sorted(str(x4))
	s5 = sorted(str(x5))
	s6 = sorted(str(x6))
	if s1==s2==s3==s4==s5==s6:
		print(x1,x2,x3,x4,x5,x6)
		break
	n+=1


