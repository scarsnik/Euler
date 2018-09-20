# How many reversible numbers are there below one-billion?
# Problem 145

# Some positive integers n have the property that the sum [ n + reverse(n) ] 
# consists entirely of odd (decimal) digits. For instance, 36 + 63 = 99 and 
# 409 + 904 = 1313. We will call such numbers reversible; so 36, 63, 409, and 
# 904 are reversible. Leading zeroes are not allowed in either n or reverse(n).

# There are 120 reversible numbers below one-thousand.

# How many reversible numbers are there below one-billion (10^9)?

#  TOOOOOOOOOOOOOOOOOOOO SLOWWWWWWWWWWWWWWW

function reverse(n)
    r = 0
    while n > 0
        r = 10r + n % 10
        n = ifloor(n/10)
    end
    return r
end

function oddDigits(n)
    while n > 0
        if iseven(n % 10) return false end
        n = ifloor(n/10)
    end
    return true
end

tic()
count = 0
d = 1

numbers = filter(x->x%10!=0, [1:10^5])
i = 1
while i < length(numbers)
    n = numbers[i]
    r = reverse(n)
    if oddDigits(n+r)
        count += 2
    end
    filter!(x->x!=r, numbers)
    i += 1
end

# for n = 1:10^8
#     if n == 10^d
#         println("10^$d : $count")
#         d += 1
#     end 
#     if n%10 != 0
#         if oddDigits(n+reverse(n))
#             count += 1
#         end
#         # println("$n, $(n+reverse(n)), $(oddDigits(n+reverse(n)))")
#     end
# end

println(count)
toc()