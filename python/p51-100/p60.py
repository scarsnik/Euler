import timing
from eulerutil import *
from itertools import *
'''
Prime pair sets
Problem 60

The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes and concatenating them in any order the result will always be prime. For example, taking 7 and 109, both 7109 and 1097 are prime. The sum of these four primes, 792, represents the lowest sum for a set of four primes with this property.

Find the lowest sum for a set of five primes for which any two primes concatenate to produce another prime.
'''

primes = [p for p in range(100000) if is_prime(p)]
print("primes =",len(primes))

ma, mb, mc, md = 3,2,1,0
breakb, breakc, breakd, breake = False, False, False, False
found = False
size = len(primes)
for a in range(size-ma):
	pa = primes[a]
	if found: break
	
	for b in range(a+1,size-mb):
		pb, breakb = primes[b], False
		if found: break
		p = list(permutations([pa,pb],2))
		if not all([is_prime(int(str(i[0])+str(i[1]))) for i in p]): breakb = True

		for c in range(b+1,size-mc):
			pc, breakc = primes[c], False
			if found or breakb: break
			p = list(permutations([pa,pb,pc],2))
			if not all([is_prime(int(str(i[0])+str(i[1]))) for i in p]): breakc = True
						
			for d in range(c+1,size-md):
				pd, breakd = primes[d], False
				if found or breakc: break
				p = list(permutations([pa,pb,pc,pd],2))
				if not all([is_prime(int(str(i[0])+str(i[1]))) for i in p]): breakd = True

				# p = list(permutations([pa,pb,pc,pd],2))
				# if all([is_prime(int(str(i[0])+str(i[1]))) for i in p]):
				# 	print([pa,pb,pc,pd])
				# 	print(sum([pa,pb,pc,pd]))
				# 	found = True
				# 	break

				for e in range(d+1,size):
					pe = primes[e]
					if found or breakd: break
					# print([pa,pb,pc,pd,pe])

					p = list(permutations([pa,pb,pc,pd,pe],2))
					if all([is_prime(int(str(i[0])+str(i[1]))) for i in p]):
						print([pa,pb,pc,pd,pe])
						print(sum([pa,pb,pc,pd,pe]))
						found = True
						break
				

