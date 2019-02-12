"""
	
Project Euler - Problem 48 - Self powers
https://projecteuler.net/problem=48

"""
import timing

def main():
    answer = 0
    limit = 1000
    cut = 10

    answer = sum([n**n for n in range(limit+1)]) - 1
            
    print(answer % 10**cut)

if __name__ == '__main__':
	main()
