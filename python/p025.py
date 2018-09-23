"""
	
Project Euler - Problem 25 - 1000-digit Fibonacci number
https://projecteuler.net/problem=25

"""
import timing

def main():
	limit = 1000
	f = {1:1, 2:1}
	i = 2
	answer = 0

	while len(str(f[i])) < limit:
		i += 1
		f[i] = f[i-1] + f[i-2]

	answer = i
	print(answer)

if __name__ == '__main__':
	main()

