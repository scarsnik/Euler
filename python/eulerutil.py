from math import floor, sqrt

try:
	long
except NameError: 
	long = int


def prime_decomposition(n):
	step = lambda x: 1 + (x<<2) - ((x>>1)<<1)
	maxq = long(floor(sqrt(n)))
	d = 1
	q = n % 2 == 0 and 2 or 3 
	while q <= maxq and n % q != 0:
		q = step(d)
		d += 1
	return q <= maxq and [q] + prime_decomposition(n//q) or [n]





"""      BELOW HERE IS MY OLD CODE    """




# Miller-Rabin witness choices based on:
#     http://mathoverflow.net/questions/101922/smallest-collection-of-bases-for-prime-testing-of-64-bit-numbers
#     http://primes.utm.edu/prove/merged.html
#     http://miller-rabin.appspot.com
#



def is_prime(n):
	''' CHECK IF N IS A PRIME NUMBER '''
	
	if n == 2 or n == 3: 
		return True

	if n < 2 or n % 2 == 0 or n % 3 == 0: 
		return False

	if n < 9: 
		return True

	f = 5
	while f <= int(n**0.5):
		if n % f == 0 or n % (f + 2) == 0:
			return False
		else:
			f += 6
	return True

def prime_sieve(limit):
	''' RETURN A LIST OF PRIMES UP TO LIMIT '''

	sieve = [2]+list(range(3,limit+1,2))
	i = 0 
	while True:
		i += 1
		p = sieve[i]
		if p**2 < limit+1:
			for j in sieve[sieve.index(p**2):]:
				if j % p == 0: sieve.remove(j)
		else:
			break
	return sieve
	
def sieve_for_primes_to(n):
	size = n//2
	sieve = [1]*size
	limit = int(n**0.5)
	for i in range(1,limit):
		if sieve[i]:
			val = 2*i+1
			tmp = ((size-1) - i)//val 
			sieve[i+val::val] = [0]*tmp
			# print(sieve)
	return [2] + [i*2+1 for i, v in enumerate(sieve) if v and i>0]
# print(len([2] + [i*2+1 for i, v in enumerate(sieve_for_primes_to(10000000)) if v and i>0]))

# def prime_factors(n):
# 	''' RETURN A LIST OF PRIME FACTORS OF N '''

# 	if n == 1: return [1]
# 	prime_factors = []

# 	for p in [2]+list(range(3,int(n**0.5)+1,2)):
# 		if is_prime(p):
# 			if p*p > n: break
# 			while n % p == 0:
# 				prime_factors.append(p)
# 				n //= p
# 	if n > 1: prime_factors.append(n)

# 	return prime_factors

def prime_factors(n):
	"""Returns all the prime factors of a positive integer"""
	factors = []
	d = 2
	while n > 1:
		while n % d == 0:
			factors.append(d)
			n /= d
		d = d + 1
		if d*d > n:
			if n > 1: factors.append(n)
			break
	return factors

def product(L):
	''' RETURN THE PRODUCT OF A LIST '''
	n = 1
	for i in list(L):
		n *= i
	return n

def long_division(n,d):
	m, r = divmod(n,d)
	ans, rem = str(m)+".", dict()
	i = len(ans)
	while True:
		if r in rem:
			ans = ans[:rem[r]] + "(" + ans[rem[r]:] +")"
			break
		rem[r] = i
		m, r = divmod(r*10,d)
		ans, i = ans+str(m), i+1
	return ans

def gcd(a,b):
	return b if a%b==0 else gcd(b,a%b)

def lcm(a,b):
	return a*b/gcd(a,b)

def is_pandigital(num_list,digits):
	s = sorted(''.join([str(x) for x in num_list]))
	return ''.join(s) == digits

def tri(n):
	return n*(n+1)/2

def is_tri(n):
	t = int(0.5+sqrt(0.25+2*n))
	return n==tri(t)

def pent(n):
	return n*(3*n-1)/2

def is_pent(n):
	p = int((0.5+sqrt(0.25+(6*n)))/3)
	return n==pent(p)

def hex(n):
	return n*(2*n-1)

def is_hex(n):
	h = int((1+sqrt(1+8*n))/4)
	return n==hex(h)

def EulerProduct(n,factors):
	# http://en.wikipedia.org/wiki/Euler's_totient_function
	product = n
	for i in set(factors):
		product *= (1-1/i)
	return product