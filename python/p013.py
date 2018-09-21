"""
    
Project Euler - Problem 13 - Large sum
https://projecteuler.net/problem=13

"""
import timing

def main():
	
	filename = './data/p013.txt'
	lines = open(filename, 'r').readlines()
	matrix = list(map(lambda x: format_lines(x), lines))
	print(str(sum(matrix))[:10])


def format_lines(line):
	return int(line.replace('\n', ''))


if __name__ == '__main__':
    main()
