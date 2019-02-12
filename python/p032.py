"""
	
Project Euler - Problem 32 - Pandigital products
https://projecteuler.net/problem=32

"""
import timing

def main():
    ran = range(0,10)

    # 1/2 digit numbers that only contain unique digits
    possa = [10*a + b for a in ran for b in ran if a != b]

    # 3/4 digit numbers that only contain unique digits
    possb = []
    for a in range(100, 9999):
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
    print(sum(sol))

if __name__ == '__main__':
	main()
