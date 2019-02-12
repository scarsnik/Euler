"""
	
Project Euler - Problem 37 - Truncatable primes
https://projecteuler.net/problem=37

"""
import timing
from eulerutil import sieve_primeness, primes

def main():
    limit = 1000000

    answer_cnt = 0
    answer_sum = 0
    answer_list = []

    is_prime = sieve_primeness(limit)
    for p in primes(is_prime):
        if p < 10: continue

        left_trunc = False
        for t in truncate(str(p), direction='L'):
            if not is_prime[int(t)]:
                break
        else:
            left_trunc = True
        
        right_trunc = False
        for t in truncate(str(p), direction='R'):
            if not is_prime[int(t)]:
                break
        else:
            right_trunc = True

        if left_trunc and right_trunc:
            answer_list.append(p)
            answer_cnt += 1
            answer_sum += p

    print(answer_sum)
    print(answer_list)


def truncate(string, direction):
    'Truncate a string one character at a time'
    'direction: L = from the left, R = from the right'
    s = list(string)
    l = len(s)
    for i in range(l-1):
        if direction == 'L':
            s.pop(0)
        if direction == 'R':
            s.pop()
        yield ''.join(s)
    

if __name__ == '__main__':
	main()
