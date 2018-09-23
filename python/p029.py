"""
	
Project Euler - Problem 29 - Distinct powers
https://projecteuler.net/problem=29

"""
import timing

def main():
	a = range(2,101)
	b = range(2,101)

	nums = set()
	for i in a:
		for j in b:
			nums |= {i**j}

	print(len(nums))

if __name__ == '__main__':
	main()
