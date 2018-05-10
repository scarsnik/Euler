import timing
from eulerutil import gcd

'''
Square root convergents
Problem 57

It is possible to show that the square root of two can be expressed as an infinite continued fraction.

sqrt(2) = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...

By expanding this for the first four iterations, we get:

1 + 1/2 = 3/2 = 1.5
1 + 1/(2 + 1/2) = 7/5 = 1.4
1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...

The next three expansions are 99/70, 239/169, and 577/408, but the eighth expansion, 1393/985, is the first example where the number of digits in the numerator exceeds the number of digits in the denominator.

In the first one-thousand expansions, how many fractions contain a numerator with more digits than denominator?

'''

max_iter = 1000
count, i = 0, 2
n, d = 1, 2
while True:
	if i >= max_iter: break
	d, n = 2*d+n, d
	num, i = (n+d,d), i+1
	if len(str(n+d)) > len(str(d)): count += 1

print(count)