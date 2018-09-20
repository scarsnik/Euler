include("util.jl")
# Square remainders
# Problem 120
# Let r be the remainder when (a−1)^n + (a+1)^n is divided by a^2.

# For example, if a = 7 and n = 3, then r = 42: 63 + 83 = 728 ≡ 42 mod 49. 
# And as n varies, so too will r, but for a = 7 it turns out that r_max = 42.

# For 3 ≤ a ≤ 1000, find ∑ r_max.

f(a, n) = (modpow(a-1, n, a^2) + modpow(a+1, n, a^2)) % a^2

tic()

total = 0
for a=3:10^4
    println([f(a, n) for n=1:a])
end
println(total)

toc()