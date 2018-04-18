import timing

'''
Pandigital multiples

Problem 38

Take the number 192 and multiply it by each of 1, 2, and 3:

192 × 1 = 192
 192 × 2 = 384
 192 × 3 = 576

By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?

'''

def concat_prod(x,n):
	prods = [str(x*i) for i in range(1,n+1)]
	return ''.join(prods)

def is_pandigital(n,digits):
	return ''.join(sorted(n)) == digits

nums = []
for i in range(1,99999):
	for n in range(2,10):
		concat = concat_prod(i,n)
		if is_pandigital(concat,'123456789'):
			nums += [(i,n,concat)]

print(nums)
print(max(nums, key=lambda x: x[2]))
			

