# P14 - Longest Collatz sequence
# The following iterative sequence is defined for the set of positive integers:
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains
# 10 terms. Although it has not been proved yet (Collatz Problem), it is thought
# that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.

# Answer: 837799

function collatz(n, terms)
	count, key = 1, n
	while n != 1
		n = n%2==0 ? int(n/2) : int(3n+1)
		if n in keys(terms)
			count += terms[n]
			break
		end
		count += 1
	end
	terms[key] = count
	return count, terms
end

terms = Dict{Int,Int}()
longest = 0
max = 0
for i = 1:999999
	n, terms = collatz(i, terms)
	if n > max
		max = n
		longest = i
	end
end
println("P14=",longest)

