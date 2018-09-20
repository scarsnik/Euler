# Convergents of e
# Problem 65
# The square root of 2 can be written as an infinite continued fraction.

# The infinite continued fraction can be written, √2 = [1;(2)], (2) indicates 
# that 2 repeats ad infinitum. In a similar way, √23 = [4;(1,3,1,8)].

# It turns out that the sequence of partial values of continued fractions for 
# square roots provide the best rational approximations. Let us consider the
# convergents for √2.

# Hence the sequence of the first ten convergents for √2 are:

# 1, 3/2, 7/5, 17/12, 41/29, 99/70, 239/169, 577/408, 1393/985, 3363/2378, ...
# What is most surprising is that the important mathematical constant,
# e = [2; 1,2,1, 1,4,1, 1,6,1 , ... , 1,2k,1, ...].

# The first ten terms in the sequence of convergents for e are:

# 2, 3, 8/3, 11/4, 19/7, 87/32, 106/39, 193/71, 1264/465, 1457/536, ...
# The sum of digits in the numerator of the 10th convergent is 1+4+5+7=17.

# Find the sum of digits in the numerator of the 100th convergent of the 
# continued fraction for e.

function cf(a0::Int, a1::Array, iters::Int)
    h2, h1 = BigInt(0), BigInt(1)
    k2, k1 = BigInt(1), BigInt(0)
    h = BigInt((a0*h1)+h2)
    k = BigInt((a0*k1)+k2)
    size = length(a1)
    for i in 1:(iters-1)
        h2, h1 = h1, h
        k2, k1 = k1, k
        n = i % size == 0 ? size : i % size
        h = (a1[n]*h1)+h2
        k = (a1[n]*k1)+k2
        # println("$h/$k")
        if h < 0
            println("$i - $h1/$k1")
            break
        end
    end
    return h, k
end

values = Int[]
j, k = 0, 2
for i in 1:100
    if i == 1
        push!(values, 1)
    elseif i == 2
        push!(values, 2)
    else
        j+=1
        if j%3==0
            val = 2*k
            k+=1
        else
            val = 1
        end
        push!(values, val)
    end
end

n, d = cf(2, values, 100)
sum = 0
for y in split(string(n),"")
    sum += int(y)
end
println(sum)

