import timing
import math
'''
1000-digit Fibonacci number


Problem 25


The Fibonacci sequence is defined by the recurrence relation:

Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.

Hence the first 12 terms will be:

F1 = 1
 F2 = 1
 F3 = 2
 F4 = 3
 F5 = 5
 F6 = 8
 F7 = 13
 F8 = 21
 F9 = 34
 F10 = 55
 F11 = 89
 F12 = 144

The 12th term, F12, is the first term to contain three digits.

What is the first term in the Fibonacci sequence to contain 1000 digits?
'''

def fib(n):
	phi = (1+math.sqrt(5))/2
	return int(((phi**n)-((-phi)**(-n)))/math.sqrt(5))

f = {1:1,2:1}
i = 3
while True:
	f[i] = f[i-1]+f[i-2]
	if len(str(f[i])) >= 1000:
		print(i,f[i])
		break
	i+=1
