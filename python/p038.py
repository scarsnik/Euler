"""
	
Project Euler - Problem 38 - Pandigital multiples
https://projecteuler.net/problem=38

"""
import timing
from eulerutil import is_pandigital

def main():
    limit = 99999

    answer = 0
    for n in range(1, limit):
        for p in range(2, 10):
            concat = concat_prod(n, p)
            if is_pandigital(concat, '123456789') and int(concat) > answer:
                answer = int(concat)
    print(answer)

def concat_prod(x, p):
    return ''.join(str(x*i) for i in range(1, p+1))

if __name__ == '__main__':
	main()
