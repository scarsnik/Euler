# Smallest prime factor
# Problem 521

# Let smpf(n) be the smallest prime factor of n.
# smpf(91)=7 because 91=7×13 and smpf(45)=3 because 45=3×3×5.
# Let S(n) be the sum of smpf(i) for 2 ≤ i ≤ n.
# E.g. S(100)=1257.

# Find S(10^12) mod 10^9.


###############################################
#
#   Initially using the direct approach 
#   This is obviously quite slow of very
#   large numbers.
#
###############################################

function smpf(n)
    return minimum(keys(factor(n)))
end

function S(n)
    result = 0
    for i = 2:n
        result += smpf(i)
    end
    return result
end

println(S(100)) #1257
# julia> @time S(10^7)
# elapsed time: 19.419984337 seconds
# 3203714961609

###############################################
#
#   Lets try a better approach
#
###############################################

limit = 100
numflags = {i=>false for i in 2:limit}
primelist = primes(limit)
result = 0
for p in primelist
    result += p * ifloor(limit/p)
end