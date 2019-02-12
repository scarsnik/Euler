"""
	
Project Euler - Problem 35 - Circular primes
https://projecteuler.net/problem=35

"""
import timing
from eulerutil import sieve_primeness, rotate

def main():
    limit = 1000000
    is_prime = sieve_primeness(limit*10)
    
    answer_count = 0
    answer_list = []
    
    for p in next_prime(is_prime):
        if p > limit: break

        digits = str(p)
        for rot in rotate(digits):
            if not is_prime[int(rot)]:
                break
        else:
            answer_list.append(p)
            answer_count += 1

    print(answer_count)
    print(answer_list)
    

def next_prime(prime_list):
    enum = enumerate(prime_list)
    for i, p in filter(lambda x: x[1], enum):
        yield i


if __name__ == '__main__':
	main()
