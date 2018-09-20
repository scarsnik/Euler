"""
    
Project Euler - Problem 11 - Largest product in a grid
https://projecteuler.net/problem=11

"""
import timing

def main():
	length = 4

	filename = './data/p011.txt'
	lines = open(filename, 'r').readlines()
	matrix = list(map(lambda x: format_lines(x), lines))

	answer = 0
	for row in range(len(matrix)):
		for col in range(len(matrix[row])):
			ne = north_east(matrix, length, row, col)
			e = east(matrix, length, row, col)
			se = south_east(matrix, length, row, col)
			s = south(matrix, length, row, col)
			answer = ne if ne > answer else answer
			answer = e if e > answer else answer
			answer = se if se > answer else answer
			answer = s if s > answer else answer

	print(answer)


def format_lines(line):
	return list(map(lambda x: int(x), line.replace('\n', '').split(' ')))


def north_east(M, length, row, col):
	if col+length > len(M[row]):
		return 0

	if row-length+1 < 0:
		return 0
	
	total = 1
	for i in range(length):
		total *= M[row-i][col+i]
	return total


def east(M, length, row, col):
	if col+length > len(M[row]):
		return 0
	
	total = 1
	for i in range(length):
		total *= M[row][col+i]
	return total

def south_east(M, length, row, col):
	if col+length > len(M[row]):
		return 0

	if row+length > len(M):
		return 0
	
	total = 1
	for i in range(length):
		total *= M[row+i][col+i]
	return total

def south(M, length, row, col):
	if row+length > len(M):
		return 0
	
	total = 1
	for i in range(length):
		total *= M[row+i][col]
	return total



if __name__ == '__main__':
    main()
