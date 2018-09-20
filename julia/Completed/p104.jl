include("util.jl")

# Pandigital Fibonacci ends
# Problem 104
# The Fibonacci sequence is defined by the recurrence relation:

# F_n = F_n−1 + F_n−2, where F_1 = 1 and F_2 = 1.
# It turns out that F_541, which contains 113 digits, is the first Fibonacci 
# number for which the last nine digits are 1-9 pandigital (contain all the 
# digits 1 to 9, but not necessarily in order). And F_2749, which contains 575 
# digits, is the first Fibonacci number for which the first nine digits are 1-9 
# pandigital.

# Given that F_k is the first Fibonacci number for which the first nine digits 
# AND the last nine digits are 1-9 pandigital, find k.

# http://math.stackexchange.com/questions/89403/is-there-a-way-to-find-the-first-digits-of-a-number
# http://www.maths.surrey.ac.uk/hosted-sites/R.Knott/Fibonacci/fibFormula.html

tic()

phi = (1+sqrt(5))/2
nphi = (1-sqrt(5))/2
fib(n) = (phi^n - nphi^n)/sqrt(5)
fib2(n) = round(phi^n/sqrt(5))

lo = 1
hi = lo+10^6
for i=lo:hi
    f = i*log(10, phi) - log(10,sqrt(5))
    n1 = ifloor(10^(f%1)*10^8)
    n2 = matmodpow([1 1; 1 0], i, 10^9)[2]
    if ispandigital(n1) && ispandigital(n2) 
        println("$i : left=$n1, right=$n2")
        break
    end
end

toc()

