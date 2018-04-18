import timing
'''
Double-base palindromes
Problem 36
The decimal number, 585 = 1001001001(base2) (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)
'''

def is_palindrome(n):
	return True if str(n)==str(n)[-1::-1] else False


max = 1000000
sum = 0
for i in range(max):
	if is_palindrome(i) and is_palindrome(bin(i)[2:]):
		# print(i,bin(i))
		sum += i

print(sum)
