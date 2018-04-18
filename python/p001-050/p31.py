from math import *
import timing
'''
Coin sums
Problem 31
In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
It is possible to make £2 in the following way:

1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
How many different ways can £2 be made using any number of coins?
'''

# p1 = [1 for i in range(200)]
# p2 = [2 for i in range(100)]
# p5 = [5 for i in range(40)]
# p10 = [10 for i in range(20)]
# p20 = [20 for i in range(10)]
# p50 = [50,50,50,50]
# p100 = [100, 100]
# p200 = [200]

n1 = range(201)
n2 = range(101)
n5 = range(41)
n10 = range(21)
n20 = range(11)
n50 = range(5)
n100 = range(3)
n200 = range(2)

count = 0
for i1 in n1:
	for i2 in n2:
		if i1*1+i2*2 <= 200:
			for i5 in n5:
				if i1*1+i2*2+i5*5 <= 200:
					for i10 in n10:
						if i1*1+i2*2+i5*5+i10*10 <= 200:
							for i20 in n20:
								if i1*1+i2*2+i5*5+i10*10+i20*20 <= 200:
									for i50 in n50:
										if i1*1+i2*2+i5*5+i10*10+i20*20+i50*50 <= 200:
											for i100 in n100:
												if i1*1+i2*2+i5*5+i10*10+i20*20+i50*50+i100*100 <=200:
													for i200 in n200:
														if i1*1+i2*2+i5*5+i10*10+i20*20+i50*50+i100*100+i200*200==200:
															count+=1
															if count%1000==0: print(count)

print(count)


