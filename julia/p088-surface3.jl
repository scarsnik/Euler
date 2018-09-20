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

function mps1(limit)
    function minprodsum(k)
        n = k+1
        while true
            for p in partitions(n, k)
                if sum(p) == prod(p)
                    return sum(p), p
                end
            end
            n += 1
        end
    end

    output = Any[]
    for k = 2:limit
        push!(output, minprodsum(k))
    end
    return output
end

function factors(n :: Int)
    output = Int[]
    for (k, v) in factor(n), i = 1:v
        push!(output, k)
    end
    return output
end

function findfactors(n :: Int)
    function find(p, k, currentd, currentr)
        if curentd == length(p)
            println(currentr)
            return
        end

        for i = 1:k[currentd]
            find(p, k, currentd+1, currentr)
            currentr *= p[currentd]
        end
    end

    f = factor(n)
    p = keys(f)
    k = values(f)
    find(p, k, 1, 1)
end

findfactors(10)


function mps(limit)
#   minimum product sum set up to the size of limit
    output = [2i for i=1:limit+1]
    output[1] = 0

    for n = 2:2limit
        f = factors(n)
        k = length(f)+n-sum(f)
        if k <= limit && n < output[k]
            output[k] = n
        end
    end
    return output
end


y = mps(12)
mps1(12)


# Hence for 2≤k≤6, the sum of all the minimal product-sum numbers is
# 4+6+8+12 = 30; note that 8 is only counted once in the sum.

# In fact, as the complete set of minimal product-sum numbers for 2≤k≤12 is
# {4, 6, 8, 12, 15, 16}, the sum is 61.
