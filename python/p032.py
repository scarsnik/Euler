"""
	
Project Euler - Problem 32 - Pandigital products
https://projecteuler.net/problem=32

"""
import timing

def main():
	
	pass

if __name__ == '__main__':
	main()

ran = xrange(0,10)
possa = [10*a + b for a in ran for b in ran if a <> b]
possb = []
for a in xrange(100,9999):
    x = str(a)
    y = set(x)
    if len(x) == len(y): possb.append(a)
sol = []
for a in possa:
    for b in possb:
        if b < max(a,1000.0 / a): continue
        if b > 9999.0 / a: break
        c = a*b
        if "".join(sorted(str(a)+str(b)+str(c))) == "123456789":
            sol.append(c)
sol = set(sol)
print sum(sol)

# def is_pandigital(num_list,digits):
# 	s = sorted(''.join([str(x) for x in num_list]))
# 	return ''.join(s) == digits

# def join(list):
# 	return int(''.join(list))

# digits = "123456789"
# size = len(digits)
# identity = []
# for p in [''.join(x) for x in list(itertools.permutations(digits,size))]:
# 	for i in range(1,size-1):
# 		for j in range(i+1,size):
# 			m1, m2, n = int(p[:i]), int(p[i:j]), int(p[j:])
# 			if m1*m2==n: identity.append([m1,m2,n])

# print(sum(set([i[2] for i in identity])))