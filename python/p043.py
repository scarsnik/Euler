"""
	
Project Euler - Problem 43 - Sub-string divisibility
https://projecteuler.net/problem=43

"""
import timing

def main():
    answer = []
    i = 1
    while i*17 < 1000:
        n = num(i*17)
        if not repeat(n):
            answer.append(n)
        i += 1

    for d in [13, 11, 7, 5, 3, 2]:
        tmp = []
        i = 1

        while i*d < 1000:
            n = num(i*d)
            for a in answer:
                if not repeat(n[0]+a) and n[-2:] == a[:2]:
                    tmp.append(n[0]+a)
            i += 1
        answer = tmp

    answer = map(prepend, answer)
    print(sum(answer))


def prepend(n):
    digits = '0123456789'
    for d in digits:
        if n.count(d) == 0:
            return int(d + n) 
    return None

def repeat(n):
    digits = '0123456789'
    for d in digits:
        if n.count(d) > 1:
            return True
    return False

def num(n):
    if n < 100:
        return '0'+str(n)
    return str(n)

    
if __name__ == '__main__':
	main()
