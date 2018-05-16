"""

Project Euler - Problem 4 - Largest palindrome product
https://projecteuler.net/problem=4

"""
import timing
import eulerutil

def main():
	ans = max(i * j
		for i in range(100, 1000)
		for j in range(100, 1000)
		if str(i * j) == str(i * j)[ : : -1])
	print(str(ans))

if __name__ == '__main__':
	main()