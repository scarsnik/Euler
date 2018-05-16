"""
    
Project Euler - Problem 2 - Even Fibonacci numbers
https://projecteuler.net/problem=2

"""
import timing

def main():
    limit = 4000000
    sum_even_fib = sum([x for x in fib(limit) if x % 2 == 0])
    print(sum_even_fib)


def fib(limit):
	a, b = 0, 1
	while a < limit:
		yield a
		a, b = b, a + b


if __name__ == '__main__':
    main()