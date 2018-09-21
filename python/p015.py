"""
    
Project Euler - Problem 15 - Lattice paths
https://projecteuler.net/problem=15

"""
import timing

def main():
	m, n = 20, 20
	paths = {}
	count(m ,n, paths)
	print(paths)

def count(m ,n, paths={}):
	if n == 0 or m == 0:
		return 1

	key = str(m) + "-" + str(n)
	if key in paths:
		return paths[key]

	paths[key] = count(m, n-1, paths) + count(m-1, n, paths)
	return paths[key]

if __name__ == '__main__':
    main()

