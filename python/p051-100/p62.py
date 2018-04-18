import timing
from itertools import *
'''
Cubic permutations
Problem 62

The cube, 41063625 (3453), can be permuted to produce two other cubes: 56623104 (3843) and 66430125 (4053). In fact, 41063625 is the smallest cube which has exactly three permutations of its digits which are also cube.

Find the smallest cube for which exactly five permutations of its digits are cube.
'''

n = 50000
cubes = {i**3 for i in range(4,n)}
cubes_dict = dict()
for c in cubes:
	s = ''.join(sorted(str(c)))
	if s in cubes_dict:
		cubes_dict[s] += [c]
	else:
		cubes_dict[s] = [c]

for i in cubes_dict:
	if len(cubes_dict[i])==5:
		print(i,cubes_dict[i])



