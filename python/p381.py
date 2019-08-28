"""
	
Project Euler - Problem 381 - (prime-k) factorial
https://projecteuler.net/problem=381

INFO:
https://stackoverflow.com/questions/9727962/fast-way-to-calculate-n-mod-m-where-m-is-prime
identity: (m-1)! ≡ -1 (mod m)

"""

import timing
import math
import eulerutil

def main():
	answer = 0
	limit = 100000000
	primes = eulerutil.primes(limit)

	fact_table = {'max': 1, 0: 1, 1: 1}

	for p in primes:
		if p < 5: continue
		answer += s(p)

	print(f'{limit} = {answer}')


def s(p):
	total = 0
	for k in range(1, 6):
		f = factorialMod(p-k, p)
		total += f % p
	return total % p

def factorialMod(n, modulus):
    ans=1
    if n <= modulus//2:
        #calculate the factorial normally (right argument of range() is exclusive)
        for i in range(1,n+1):
            ans = (ans * i) % modulus   
    else:
        #Fancypants method for large n
        for i in range(n+1,modulus):
            ans = (ans * i) % modulus
        ans = modinv(ans, modulus)
        ans = -1*ans + modulus
    return ans % modulus

# Iterative Algorithm (xgcd)
def iterative_egcd(a, b):
    x,y, u,v = 0,1, 1,0
    while a != 0:
        q,r = b//a,b%a; m,n = x-u*q,y-v*q # use x//y for floor "floor division"
        b,a, x,y, u,v = a,r, u,v, m,n
    return b, x, y

def modinv(a, m):
    g, x, y = iterative_egcd(a, m) 
    if g != 1:
        return None
    else:
        return x % m

if __name__ == '__main__':
	main()
