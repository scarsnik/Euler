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

function collatz(n)
	terms = 1
	while n != 1
		n = n%2==0 ? n/2 : 3n+1
		terms += 1
	end
	return terms
end

longest_chain = 0
max_terms = 0
for i = 1:999999
	terms = collatz(i)
	if terms > max_terms
		max_terms = terms
		longest_chain = i
	end
end
println("P14=",longest_chain)

