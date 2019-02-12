"""
	
Project Euler - Problem 47 - Distinct primes factors
https://projecteuler.net/problem=47

"""
import timing
from eulerutil import sieve_omega

def main():
    answer = 0
    target = 4

    limit = 1_000_000
    omega = sieve_omega(limit)

    count = 0
    for i, j in enumerate(omega):
        if j == target:
            for k in range(i+1, i+target):
                if omega[k] != target:
                    break
            else:
                answer = i
                break

    print(answer)


if __name__ == '__main__':
	main()
