"""
	
Project Euler - Problem 17 - Number letter counts
https://projecteuler.net/problem=17

"""
import timing


def main():
	len99 = 0
	len999 = 0

	for n in range(1, 100):
		if n < 20:
			len99 += num_len(n)
		else:
			r = n % 10
			d = n - r
			len99 += num_len(d) + num_len(r)
	
	for n in range(1, 10):
		len999 += (num_len(n) + num_len(100) + 3) * 100 - 3   # 10^2 digit len + 'hundred'(7) + 'and' (3) TIMES 100 -3
		len999 += len99

	print(len99 + len999 + num_len(1) + num_len(1000))

def num_len(n):
	nums = {
		0:'',
		1:'one',
		2:'two',
		3:'three',
		4:'four',
		5:'five',
		6:'six',
		7:'seven',
		8:'eight',
		9:'nine',
		10:'ten',
		11:'eleven',
		12:'twelve',
		13:'thirteen',
		14:'fourteen',
		15:'fifteen',
		16:'sixteen',
		17:'seventeen',
		18:'eighteen',
		19:'nineteen',
		20:'twenty',
		30:'thirty',
		40:'forty',
		50:'fifty',
		60:'sixty',
		70:'seventy',
		80:'eighty',
		90:'ninety',
		100:'hundred',
		1000:'thousand'
	}
	return len(nums[n])

if __name__ == '__main__':
	main()

