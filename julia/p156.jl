# Counting Digits
# Problem 156
# Starting from zero the natural numbers are written down in base 10 like this: 
# 0 1 2 3 4 5 6 7 8 9 10 11 12....

# Consider the digit d=1. After we write down each number n, we will update the 
# number of ones that have occurred and call this number f(n,1). The first 
# values for f(n,1), then, are as follows:

# Note that f(n,1) never equals 3. 
# So the first two solutions of the equation f(n,1)=n are n=0 and n=1. The 
# next solution is n=199981.

# In the same manner the function f(n,d) gives the total number of digits d 
# that have been written down after the number n has been written. 
# In fact, for every digit d ≠ 0, 0 is the first solution of the equation f(n,d)=n.

# Let s(d) be the sum of all the solutions for which f(n,d)=n. 
# You are given that s(1)=22,786,974,071.

# Find ∑ s(d) for 1 ≤ d ≤ 9.

# Note: if, for some n, f(n,d)=n for more than one value of d this value of n 
# is counted again for every value of d for which f(n,d)=n.

limit = 999_999
d = zeros(Int, 9)
f = zeros(Int, 9)
for i=0:limit 
    n = i
    while true
        r = n % 10
        if r > 0
            d[r] += 1
        end
        n = div(n, 10)

        if n < 10
            if n != 0
                d[n] += 1
            end
            break
        end
    end

    # print(lpad(i, 3, " "))
    # print(" ")
    # for j in d
    #     print(lpad(j, 6, " "))
    # end
    # println()

    matches = find(d .== i)
    if length(matches) > 0
        f[matches] += i
    end
end

println(d)
println(f)


#  1 digit = 1e0
#  2 digit = 2e1
#  3 digit = 3e2
#  4 digit = 4e3
#  5 digit = 5e4
#  6 digit = 6e5
#  7 digit = 7e6
#  8 digit = 8e7
#  9 digit = 9e8
# 10 digit = 10e9
# 11 digit = 11e10
# 12 digit = 12e11
# 13 digit = 13e12
# 14 digit = 14e13