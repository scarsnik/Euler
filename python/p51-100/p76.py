import timing

'''
Counting summations
Problem 76
It is possible to write five as a sum in exactly six different ways:

4 + 1
3 + 2
3 + 1 + 1
2 + 2 + 1
2 + 1 + 1 + 1
1 + 1 + 1 + 1 + 1

How many different ways can one hundred be written as a sum of at least two positive integers?
'''
paths = set()
def summation(n, path=[]):
	global paths
	if sum(path) > n: return
	if sum(path) == n:
		paths |= {tuple(sorted(path))}
		return
	if sum(path) < n:
		for i in range(1,max(path)+1):
			summation(n,path+[i])

def digit_sums(n):
	global paths
	for i in range(1,n):
		summation(n,[i])
	return paths

print(digit_sums(5))

# for i in range(2,19):
# 	paths = dict()
# 	d = len(digit_sums(i))
# 	print(i,d,d/i)