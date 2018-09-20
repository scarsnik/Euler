# Semiprimes
# Problem 187
# A composite is a number containing at least two prime factors. 
# For example, 15 = 3 × 5; 9 = 3 × 3; 12 = 2 × 2 × 3.

# There are ten composites below thirty containing precisely two, 
# not necessarily distinct, prime factors: 4, 6, 9, 10, 14, 15, 21, 22, 25, 26.

# How many composite integers, n < 10^8, have precisely two, not 
# necessarily distinct, prime factors?

tic()

answer = 0
limit = 10^8
p = primes(int(limit/2))
l = length(p)
for i=1:l
	for j=i:l
		p[i]*p[j] >= limit && break
		answer += 1
	end
end

# P187 = 17427258
# elapsed time: 7.524438252 seconds
# 7.524438252

# SLOW VERSION
# for i=1:limit
# 	if sum(values(factor(i))) == 2
# 		# println(i)
# 		answer += 1
# 	end
# end
# 
# P187 = 17,427,258
# elapsed time: 324.415262503 seconds
# 324.415262503

println("P187 = $answer")

toc()

