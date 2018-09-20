"""
Problem 148
Exploring Pascal's triangle
"""
import timing

def main():
	max_row = 400
	divisor = 7

	print_pascal_triangle(max_row, divisor)

	# i = 0
	# while i*divisor < max_row:
	# 	pass



def print_pascal_triangle(number_of_rows=100, divisor=7):
	for i in range(number_of_rows):
		row_nums = pascal(i)
		row_symbols = [('*' if x % divisor == 0 else '-') for x in row_nums]
		print(str(i).zfill(3) + ''.join(row_symbols))


def pascal(n):
	line = [1]
	for k in range(n):
		line.append(line[k] * (n-k) // (k+1))
	return line


if __name__ == '__main__':
	main()