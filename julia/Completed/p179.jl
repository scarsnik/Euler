include("util.jl")

# Consecutive positive divisors
# Problem 179
# Find the number of integers 1 < n < 10^7, for which n and n + 1 have the same 
# number of positive divisors. For example, 14 has the positive divisors 1, 2, 
# 7, 14 while 15 has 1, 3, 5, 15.

tic()

limit = 10^7
# d = [length(divisors(n)) for n=1:limit]
d = [prod(collect(values(factor(n)))+1) for n=1:limit]

toc()

tic()

d1 = d[1:limit-1]
d2 = d[2:limit]

println(sum(d1.==d2))

toc()

# 986262
# elapsed time: 47.251128897 seconds
