include("util.jl")

# Palindromic sums
# Problem 125
# The palindromic number 595 is interesting because it can be written as the 
# sum of consecutive squares: 6^2 + 7^2 + 8^2 + 9^2 + 10^2 + 11^2 + 12^2.

# There are exactly eleven palindromes below one-thousand that can be written 
# as consecutive square sums, and the sum of these palindromes is 4164. Note 
# that 1 = 0^2 + 1^2 has not been included as this problem is concerned with the 
# squares of positive integers.

# Find the sum of all the numbers less than 10^8 that are both palindromic and 
# can be written as the sum of consecutive squares.

tic()

limit = 10^8
hi = ifloor(sqrt(limit))

p = Any[]
result = 0
for i=1:hi-1
    for j=i+1:hi
        n = sum([i:j].^2)
        n >= limit && break
        if ispalindromic(n)
            # result += n
            # println("$n, $(i:j)")
            push!(p, n)
        end
    end
end

result = sum(unique(p))
println("P125: $result")

toc()