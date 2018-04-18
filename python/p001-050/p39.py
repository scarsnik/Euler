import timing

# THIS IS QUITE SLOW (4 MINUTES) - NEED TO REVISE

'''
Integer right triangles

Problem 39

If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p ≤ 1000, is the number of solutions maximised?
'''

def is_right_triangle(a,b,c):
	return a**2+b**2==c**2

max = [0,0]
for i in range(12,13):
	p = [i,0]
	for a in range(1,int(i/2)+1):
		for b in range(2,int((i-a)/2)+1):
			c = i-a-b
			print(a,b,c)
			if is_right_triangle(a,b,c):
				p[1] += 1
				if p[1] > max[1]:
					max = [i,p[1]]

print(max)