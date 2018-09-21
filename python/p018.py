"""
	
Project Euler - Problem 18 - Maximum path sum I
https://projecteuler.net/problem=18

"""
import timing


def main():
	filename = './data/p018.txt'
	lines = open(filename, 'r').readlines()
	triangle = list(map(lambda x: format_lines(x), lines))

	answer = bottom_up(triangle)
	print(answer)

def format_lines(line):
	return list(map(lambda x: int(x), line.replace('\n', '').split(' ')))


def bottom_up(triangle):
	rows = len(triangle)
	tri = triangle.copy()
	
	for i in range(rows-2, -1, -1):
		cols = len(tri[i])
		for j in range(cols):
			tri[i][j] = max(tri[i][j]+tri[i+1][j+1], tri[i][j]+tri[i+1][j])

	return tri[0][0]

if __name__ == '__main__':
	main()

