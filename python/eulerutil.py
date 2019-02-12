
from math import floor, sqrt


def sieve_primeness(limit):
	'Given an integer limit, this returns a list of Booleans'
	'where result[k] indicates whether k is a prime number.'

	if limit < 0:
		raise ValueError("Limit must be non-negative")
	result = [True] * (limit + 1)
	result[0] = False
	if limit > 0:
		result[1] = False
	for i in range(2, len(result)):
		if result[i]:
			for j in range(i * i, len(result), i):
				result[j] = False
	return result


def primes(arg):
	'Generator that gives you each prime in order up to some limit n'

	if type(arg) == list: sieve = arg
	if type(arg) == int:  sieve = sieve_primeness(arg)
	enum = enumerate(sieve)

	for i, p in filter(lambda x: x[1], enum):
		yield i


def sieve_omega(limit):
	' Given an integer limit, this returns a list of integers where result[k]'
	' is the number of unique prime factors (omega function) of k.'
	if limit < 0:
		raise ValueError("Limit must be non-negative")
	result = [0] * (limit + 1)
	for i in range(2, len(result)):
		if result[i] == 0:
			for j in range(i, len(result), i):
				result[j] += 1
	return result


def pythagorean_triple(m, n):
	if n > m:
		m, n = n, m
	a = (m**2) - (n**2)
	b = 2 * m * n
	c = (m**2) + (n**2)
	return a, b, c


def isqrt(n):  
    'isqrt(n) Return floor(sqrt(n)).'  
  
    if not isinstance(n, int):  
        raise TypeError('an int is required')  
    if n < 0:  
        raise ValueError('math domain error')  
  
    guess = (n >> n.bit_length() // 2) + 1  
    result = (guess + n // guess) // 2  
    while abs(result - guess) > 1:  
        guess = result  
        result = (guess + n // guess) // 2  
    while result * result > n:  
        result -= 1  
    return result


def proper_divisors(n):
	'Get all the proper divisors of a number (n).'
	'i.e. all integers less than n that divide n evenly.'
	
	divs = {1}
	if n < 2: 
		return divs

	isqrt = floor(sqrt(n))

	i = 2
	while i <= isqrt:
		if n % i == 0:
			divs |= {i, n//i}
		i += 1

	return divs


def is_abundant(n):
	'A number is abundant if the sum of its proper divisors are greater than the number itself'
	
	d = proper_divisors(n)
	return sum(d) > n


def even(n):
	return n % 2 == 0

def odd(n):
	return n % 2 != 0

def gcd(a, b):
	return b if a % b == 0 else gcd(b, a % b)

def lcm(a, b):
	return a * b / gcd(a, b)


def rotate(s):
	'Generator that gives you the rotations of a string'
	a = list(s)
	for i in a:
		a.insert(0, a.pop())
		yield ''.join(a)


def is_palindrome(s):
	return ''.join(reversed(s)) == s

def is_pandigital(n, digits):
	return ''.join(sorted(n)) == digits


def letter_value(a):
	return ord(a.lower()) - 96





def fib(n):
	'(n)th fibonacci number'
	phi = (1 + sqrt(5)) / 2
	num = (phi**n) - ((-phi)**(-n))
	return int(num / sqrt(5))


def long_division(n, d):
	m, r = divmod(n, d)
	ans, rem = str(m) + ".", dict()
	i = len(ans)
	
	while True:
		if r in rem:
			ans = ans[:rem[r]] + "(" + ans[rem[r]:] +")"
			break
		rem[r] = i
		m, r = divmod(r*10,d)
		ans, i = ans+str(m), i+1
	return ans







def is_prime(n):
	''' CHECK IF N IS A PRIME NUMBER '''
	
	if n <= 1: return False
	if n == 2: return True
	if n == 3: return True
	if n % 2 == 0: return False
	if n % 3 == 0: return False
	if n == 7: return True
	
	# i = 5
	# w = 2
	# while i * i <= n:
	# 	if n % i == 0:
	# 		return False
	# 	i += w
	# 	w = 6 - w
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