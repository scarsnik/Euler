"""
	
Project Euler - Problem 28 - Number spiral diagonals
https://projecteuler.net/problem=28

"""
import timing

def main():
	limit = 1001

	ne, se, sw, nw = [1], [3], [5], [7]
	for i in  range(1, (limit-1)//2):
		ne += [ne[i-1] + (i*8) + 0]
		se += [se[i-1] + (i*8) + 2]
		sw += [sw[i-1] + (i*8) + 4]
		nw += [nw[i-1] + (i*8) + 6]

	print(sum(ne + se + sw + nw) + limit**2)

if __name__ == '__main__':
	main()
