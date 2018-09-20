# Product-sum numbers
# Problem 88
# A natural number, N, that can be written as the sum and product of a given
# set of at least two natural numbers, {a1, a2, ... , ak} is called a
# product-sum number: N = a1 + a2 + ... + ak = a1 × a2 × ... × ak.

# For example, 6 = 1 + 2 + 3 = 1 × 2 × 3.

# For a given set of size, k, we shall call the smallest N with this property
# a minimal product-sum number. The minimal product-sum numbers for sets of
# size, k = 2, 3, 4, 5, and 6 are as follows.

# k=2: 4 = 2 × 2 = 2 + 2
# k=3: 6 = 1 × 2 × 3 = 1 + 2 + 3
# k=4: 8 = 1 × 1 × 2 × 4 = 1 + 1 + 2 + 4
# k=5: 8 = 1 × 1 × 2 × 2 × 2 = 1 + 1 + 2 + 2 + 2
# k=6: 12 = 1 × 1 × 1 × 1 × 2 × 6 = 1 + 1 + 1 + 1 + 2 + 6

# Hence for 2≤k≤6, the sum of all the minimal product-sum numbers is
# 4+6+8+12 = 30; note that 8 is only counted once in the sum.

# In fact, as the complete set of minimal product-sum numbers for 2≤k≤12 is
# {4, 6, 8, 12, 15, 16}, the sum is 61.

# What is the sum of all the minimal product-sum numbers for 2≤k≤12000?

function mps_digits(n)
    # Factorize n
    f = factor(n)

    # Sum the factorization
    v = values(f)
    s = sum(collect(keys(f)) .* collect(v))

    # Number of ones to pad out the sum
    o = n - s
    k = sum(v) + o

    d = ones(Int64, o)
    for (a, b) in f
        d = vcat(d, fill(a, b))
    end

    return k, d
end

function mps(limit, show=false)
    k = Dict([k=>typemax(Int) for k=2:limit])

    if show 
        println(" K  | N  | Digits")
        println("----|----|-------")
    end

    for i = 4:2*limit
        m = mps_digits(i)
        if 2 <= m[1] <= limit && i < k[m[1]]
            k[m[1]] = i
            if show
                print(" ",rpad(m[1], 3, " "),"|")
                print(" ",rpad(i, 3, " "),"|")
                print(m[2])
                println()
            end
        end
    end

    for (a,b) in k
        if b == typemax(Int)
            k[a] = 2*a
        end
    end

    return k
end

