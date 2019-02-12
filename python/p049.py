"""
	
Project Euler - Problem 49 - Prime permutations
https://projecteuler.net/problem=49

"""
import timing
from eulerutil import sieve_primeness, primes

def main():
    answer = 0
    limit = 10000

    perm_groups = []
    visited = set()
    prime_list = list(filter(lambda x: x > 1000, primes(limit)))

    for p in prime_list:
        group = [p]
        visited |= {p}
        a = ''.join(sorted(str(p)))
        for q in prime_list:
            if q not in visited:
                b = ''.join(sorted(str(q)))
                if a == b:
                    group.append(q)
        if len(group) > 2 and evenly_spaced(group):
            perm_groups.append(group)

    print(''.join(map(lambda x: str(x), perm_groups[0])))


def evenly_spaced(list):
    diff = []
    for i in range(1, len(list)):
        diff.append(list[i]-list[i-1])
    return not any(map(lambda x: x-diff[0], diff))

    
if __name__ == '__main__':
	main()
