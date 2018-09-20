# Largest integer divisible by two primes
# Problem 347
# The largest integer ≤ 100 that is only divisible by both the primes 2 and 3 
# is 96, as 96=32*3=2^5*3. For two distinct primes p and q let M(p,q,N) be the 
# largest positive integer ≤N only divisible by both p and q and M(p,q,N)=0 
# if such a positive integer does not exist.

# E.g. M(2,3,100)=96.
# M(3,5,100)=75 and not 90 because 90 is divisible by 2 ,3 and 5.
# Also M(2,73,100)=0 because there does not exist a positive integer ≤ 100 that 
# is divisible by both 2 and 73.

# Let S(N) be the sum of all distinct M(p,q,N). S(100)=2262.

# Find S(10 000 000).

limit = 2_000_000

tic()

# used = Dict()
# result = 0
# for n = limit:-1:1
#     f = factor(n)
#     if length(f) > 1
#         k = collect(keys(f))
#         k1, k2 = k[1], k[2]
#         if length(f) == 2 && !haskey(used, (k1,k2))
#             used[(k1,k2)] = true
#             result += n
#         end
#     end
# end

# println(result)

toc()


function sieveEratosthenes(n :: Int)

    A = trues(n)
    A[1] = false

    for i in 2:isqrt(n)
        if A[i]
            for j in i^2:i:n
                A[j] = false
            end
        end
    end

    return find(A)

end

display(sieveEratosthenes(1000))