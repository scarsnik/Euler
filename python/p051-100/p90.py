import timing
from itertools import combinations

'''
Cube digit pairs
Problem 90
Each of the six faces on a cube has a different digit (0 to 9) written on it; the same is done to a second cube. By placing the two cubes side-by-side in different positions we can form a variety of 2-digit numbers.

For example, the square number 64 could be formed:

In fact, by carefully choosing the digits on both cubes it is possible to display all of the square numbers below one-hundred: 01, 04, 09, 16, 25, 36, 49, 64, and 81.

For example, one way this can be achieved is by placing {0, 5, 6, 7, 8, 9} on one cube and {1, 2, 3, 4, 8, 9} on the other cube.

However, for this problem we shall allow the 6 or 9 to be turned upside-down so that an arrangement like {0, 5, 6, 7, 8, 9} and {1, 2, 3, 4, 6, 7} allows for all nine square numbers to be displayed; otherwise it would be impossible to obtain 09.

In determining a distinct arrangement we are interested in the digits on each cube, not the order.

{1, 2, 3, 4, 5, 6} is equivalent to {3, 6, 4, 1, 2, 5}
{1, 2, 3, 4, 5, 6} is distinct from {1, 2, 3, 4, 5, 9}

But because we are allowing 6 and 9 to be reversed, the two distinct sets in the last example both represent the extended set {1, 2, 3, 4, 5, 6, 9} for the purpose of forming 2-digit numbers.

How many distinct arrangements of the two cubes allow for all of the square numbers to be displayed?
'''

squares = {i**2 for i in range(1,10)}
print(squares)
digits = [0,1,2,3,4,5,6,7,8,9]
dice = list(combinations(digits,6))
size = len(dice)
count = 0

# dice = [[1,2,3,4,5,6],[1,2,3,4,5,9]]
# size = 2
for i in range(size-1):
	for j in range(i+1,size):
		d1 = set(dice[i])|{6,9} if 6 in dice[i] or 9 in dice[i] else set(dice[i])
		d2 = set(dice[j])|{6,9} if 6 in dice[j] or 9 in dice[j] else set(dice[j])
		if d1 != d2:
			pairs1 = {a*10+b for a in d1 for b in d2}
			pairs2 = {b*10+a for a in d1 for b in d2}
			pairs = pairs1 | pairs2
			# if i%10==0: print(pairs)
			if len(pairs&squares)==9: count+=1

print(count)
