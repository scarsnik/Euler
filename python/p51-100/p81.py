import timing

'''
Path sum: two ways
Problem 81
In the 5 by 5 matrix below, the minimal path sum from the top left to the 
bottom right, by only moving to the right and down, is indicated in bold 
red and is equal to 2427.


131	673	234	103	18
201	96	342	965	150
630	803	746	422	111
537	699	497	121	956
805	732	524	37	331

Find the minimal path sum, in matrix.txt (right click and 'Save Link/Target As...'), 
a 31K text file containing a 80 by 80 matrix, from the top left to the bottom 
right by only moving right and down.
'''

raw_data = list(open("matrix.txt"))
data = [[int(x) for x in y] for y in [row.strip().split(",") for row in raw_data]]
print(data)

# data = [[131,673,234,103,18 ],
# 		[201,96 ,342,965,150],
# 		[630,803,746,422,111],
# 		[537,699,497,121,956],
# 		[805,732,524,37 ,331]]

rows = len(data)
cols = len(data[0])
mat = dict()
# mat = {(r,c):0 for r in range(-1,rows) for c in range(-1,cols)}

for r in range(rows):
	for c in range(cols):
		val = data[r][c]
		if r==0 and c==0:
			top, left = 0, 0
			mat[r,c] = data[0][0]
		elif r==0:
			left = mat[r,c-1]
			mat[r,c] = left+val
		elif c==0:
			top = mat[r-1,c]
			mat[r,c] = top+val
		else:
			top = mat[r-1,c]
			left = mat[r,c-1]
			mat[r,c] = min(top+val, left+val)

for r in range(rows):
	row = []
	for c in range(cols):
		row.append(mat[r,c])
	print(row)




