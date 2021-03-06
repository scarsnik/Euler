include("util.jl")

# Prime square remainders
# Problem 123
# Let p(n) be the nth prime: 2, 3, 5, 7, 11, ..., and let r be the remainder 
# when (p(n)−1)^n + (p(n)+1)^n is divided by p(n)^2.

# For example, when n = 3, p(3) = 5, and 4^3 + 6^3 = 280 ≡ 5 mod 25.

# The least value of n for which the remainder first exceeds 10^9 is 7037.

# Find the least value of n for which the remainder first exceeds 10^10.

function f(p, n)
    x = modpow(p-1, n, p^2)
    y = modpow(p+1, n, p^2)
    return (x+y) % p^2
end

tic()

p = primes(3*10^5)

for n in 1:length(p)
    r = f(p[n], n)
    if r > 10^10
        println("$n = $r")
        break
    end
end

toc()