"""
	
Project Euler - Problem 50 - Consecutive prime sum
https://projecteuler.net/problem=50

"""
import timing
from eulerutil import primes

def main():
    answer = 0
    longest = 0
    limit = 1_000_000

    prime_list = list(primes(limit))
    prime_set = set(primes(limit))
    size = len(prime_set)

    count = 0
    for i in range(size):
        cumsum = 0
        for j in range(i, size):
            cumsum += prime_list[j]
            length = j-i+1
            if cumsum > limit: break
            if cumsum in prime_set and length > longest:
                answer = cumsum
                longest = length

    print(answer, "length:", longest)
    
if __name__ == '__main__':
	main()
