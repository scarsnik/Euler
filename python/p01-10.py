from eulerutil import *

def P1():
	''' SUM OF MULTIPLE OF 3 OR 5 BELOW 1000 '''
	return sum([x for x in range(1000) if x%3==0 or x%5==0])

def P2():
	''' SUM OF EVEN FIBONACCI NUMBERS BELOW 4 MILLION '''
	fib = [1,2]
	while fib[-1] < 4000000:
		fib.append(sum(fib[-2:]))
	return sum([x for x in fib if x % 2 == 0])
	
def P3():
	''' LARGEST PRIME FACTOR OF 600851475143 '''
	n = 600851475143
	return prime_factors(n)[-1]

	
def P4():
	''' LARGEST PALINDRONE MADE FROM THE PRODUCT OF TWO 3-DIGIT NUMBERS '''
	digits = list(range(10))
	pal6 = [10**5*a + 10**4*b + 10**3*c + 10**2*d + 10*e + f \
				for a in digits \
				for b in digits \
				for c in digits \
				for d in digits \
				for e in digits \
				for f in digits \
				if a==f and b==e and c==d ]	
	for i in range(1,len(pal6)):
		d = [x for x in range(1,1000) if pal6[-i] % x == 0]
		if product(d[-2:]) == pal6[-i]: return pal6[-i]

def P5(n):
	''' SMALLEST POSITIVE NUMBER THAT IS EVENLY DIVISIVLE BY ALL THE NUMBERS FROM 1 TO 20 '''
	nums = [1]
	
	for i in range(2,n+1):
		for j in nums:
			if i % j == 0:
				i /= j
				if i == 1: break	
		nums.append(i)
	return product(nums)

def P6():
	''' FIND THE DIFFERENT BETWEEN THE SUM OF THE SQUARES OF THE FIRST ONE HUNDRED NATURAL NUMBERS AND THE SQUARE OF THE SUM '''
	sum_sqr = sum([x**2 for x in range(101)])
	sqr_sum = sum([x for x in range(101)]) ** 2
	return sqr_sum - sum_sqr

def P7():
	''' THE 10,001st prime number '''
	return prime_sieve(200000)[10000]

def P8():
	''' FIND THE GREATEST PRODUCT OF FIVE CONSECUTIVE DIGITS IN THE 1000-DIGIT NUMBER '''
	f = open("P8.txt")
	n = ""
	for line in f:
		n += line.replace("\n","")	
	max = 0
	for i in range(0,len(n)-5):
		prod = product(list([int(x) for x in n[i:i+5]]))
		if prod > max:
			max = prod
	return max

def P9():
	''' THERE EXISTS EXACTLY ONE PYTHAGOREAN TRIPLET FOR WHICH A + B + C = 1000. FIND THE PRODUCT ABC '''
	a = (m**2) - (n**2)
	b = 2 * m * n
	c = (m**2) + (n**2)

