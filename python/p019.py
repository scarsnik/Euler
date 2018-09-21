"""
	
Project Euler - Problem 19 - Counting Sundays
https://projecteuler.net/problem=19

"""
import timing

def main():
	n_sundays = 0

	day_in_year = 1
	for year in range(1900, 2001):
		for month in range(1, 13):
			if day_in_year % 7 == 0 and year > 1900:
				n_sundays += 1
			day_in_year += days(month, year)

	print(n_sundays)


def days(month, year):
	d = {1:31, 2:28, 3:31, 4:30, 5:31, 6:30, 7:31, 8:31, 9:30, 10:31, 11:30, 12:31}
	if (year % 4 == 0 and year % 100 != 0) or year % 400 == 0:
		d[2] = 29
	return d[month]		

		
if __name__ == '__main__':
	main()
