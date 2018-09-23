"""
	
Project Euler - Problem 31 - Coin sums
https://projecteuler.net/problem=31

"""
import timing

def main():
	target = 200
	coins = [1, 2, 5, 10, 20, 50, 100, 200]

	def ways(target, avc):
		# avc = available coin
		if avc < 1:
			return 1
		res = 0
		while target >= 0:
			res = res + ways(target, avc-1)
			target = target - coins[avc]
		return res

	answer = ways(target, 7)
	print(answer)


if __name__ == '__main__':
	main()

