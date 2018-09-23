"""
	
Project Euler - Problem 22 - Names scores
https://projecteuler.net/problem=22

"""
import timing


def main():
	filename = './data/p022_names.txt'
	lines = open(filename, 'r').read()
	names = sorted(lines.replace('\"','').split(','))

	answer = 0
	for pos, name in enumerate(names, 1):
		answer += pos * alpha_value(name)
	print(answer)


def alpha_value(name):
	# ord('A') is 65
	upper = name.upper()
	return sum([ord(x)-64 for x in upper])

if __name__ == '__main__':
	main()
