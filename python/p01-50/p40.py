import timing

'''
Champernowne's constant
Problem 40
An irrational decimal fraction is created by concatenating the positive integers:

0.123456789101112131415161718192021...

It can be seen that the 12th digit of the fractional part is 1.

If dn represents the nth digit of the fractional part, find the value of the following expression.

d1 × d10 × d100 × d1,000 × d10,000 × d100,000 × d1,000,000
'''
'''
1 x 10^0 x 9 = 9
2 x 10^1 x 9 = 99
3 x 10^2 x 9 = 999
4 x 10^3 x 9 = 9,999
5 x 10^4 x 9 = 99,999
6 x 10^5 x 9 = 999,999
7 x 10^6 x 9 = 9,999,999
'''

Champernowne = ""
for i in range(1000001):
	Champernowne += str(i)

d = [1,1e1,1e2,1e3,1e4,1e5,1e6]
prod = 1
for i in d:
	print(int(i),Champernowne[int(i)])
	prod *= int(Champernowne[int(i)])
print("prod=",prod)






