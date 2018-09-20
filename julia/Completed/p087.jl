# Prime power triples
# Problem 87

# The smallest number expressible as the sum of a prime square, prime cube, 
# and prime fourth power is 28. In fact, there are exactly four numbers below 
# fifty that can be expressed in such a way:

# 28 = 2^2 + 2^3 + 2^4
# 33 = 3^2 + 2^3 + 2^4
# 49 = 5^2 + 2^3 + 2^4
# 47 = 2^2 + 3^3 + 2^4

# How many numbers below fifty million can be expressed as the sum of a prime 
# square, prime cube, and prime fourth power?

tic()

limit = 50*10^6
primes2 = primes(ifloor(limit^(1/2)))
primes3 = primes(ifloor(limit^(1/3)))
primes4 = primes(ifloor(limit^(1/4)))

n = Any[]
for a in primes2, b in primes3, c in primes4
    s = a^2+b^3+c^4
    if s < limit push!(n, s) end
end

nset = Set(n)
println(length(nset))
toc()