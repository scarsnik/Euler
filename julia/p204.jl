# Generalised Hamming Numbers
# Problem 204
# A Hamming number is a positive number which has no prime factor larger than 5.
# So the first few Hamming numbers are 1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15.
# There are 1105 Hamming numbers not exceeding 10^8.

# We will call a positive number a generalised Hamming number of type n, if it
# has no prime factor larger than n.
# Hence the Hamming numbers are the generalised Hamming numbers of type 5.

# How many generalised Hamming numbers of type 100 are there which don't 
# exceed 10^9?
# require("Iterators")
tic()


limit = 10^8
prime = primes(100)
d = {b=>b.^[1:ifloor(log(b, limit))] for b in prime}

combs = sum([binomial(25, i) for i=1:25])

underlimit(x) = x <= limit    

A = filter(underlimit, (d[2]*d[3]')[:])
B = filter(underlimit, (d[2]*d[5]')[:])
C = filter(underlimit, (d[3]*d[5]')[:])
D = filter(underlimit, (A*d[5]')[:])

# Z = vcat(d[2], d[3], d[5], A, B, C, D)

toc()