include("../util.jl")

# Amicable chains
# Problem 95
# The proper divisors of a number are all the divisors excluding the number 
# itself. For example, the proper divisors of 28 are 1, 2, 4, 7, and 14. As 
# the sum of these divisors is equal to 28, we call it a perfect number.

# Interestingly the sum of the proper divisors of 220 is 284 and the sum of 
# the proper divisors of 284 is 220, forming a chain of two numbers. For this 
# reason, 220 and 284 are called an amicable pair.

# Perhaps less well known are longer chains. For example, starting with 12496, 
# we form a chain of five numbers:

# 12496 → 14288 → 15472 → 14536 → 14264 (→ 12496 → ...)

# Since this chain returns to its starting point, it is called an amicable 
# chain.

# Find the smallest member of the longest amicable chain with no element 
# exceeding one million.

tic()

limit = 10^6
sums = [sumdiv(i)-i for i=1:limit]
seen = falses(limit)
chain = Dict()

toc()

tic()

i = 2
while true
    if !seen[i]
        next = i
        chain[i] = [i]
        seen[i] = true
        while true
            next = sums[next]
            if next > limit || next == 1
                delete!(chain, i)
                break
            elseif seen[next] && !(next in chain[i])
                delete!(chain, i)
                break
            elseif seen[next] && next in chain[i]
                break
            end
            push!(chain[i], next)
            seen[next] = true
        end
    end
    if i == 2 println(2) end
    if i % 10^5 == 0
        println(i)
    end
    i += 1
    i > limit && break
end
println(chain)

toc()


