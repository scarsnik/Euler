# Harshad Numbers
# Problem 387

# A Harshad or Niven number is a number that is divisible by the sum of its digits. 
# 201 is a Harshad number because it is divisible by 3 (the sum of its digits.) 
# When we truncate the last digit from 201, we get 20, which is a Harshad number. 
# When we truncate the last digit from 20, we get 2, which is also a Harshad number. 
# Let's call a Harshad number that, while recursively truncating the last digit, 
# always results in a Harshad number a right truncatable Harshad number.

# Also: 
# 201/3=67 which is prime. 
# Let's call a Harshad number that, when divided by the sum of its digits, 
# results in a prime a strong Harshad number.

# Now take the number 2011 which is prime. 
# When we truncate the last digit from it we get 201, a strong Harshad number 
# that is also right truncatable. 
# Let's call such primes strong, right truncatable Harshad primes.

# You are given that the sum of the strong, right truncatable Harshad primes 
# less than 10000 is 90619.

# Find the sum of the strong, right truncatable Harshad primes less than 10^14.

function ish(n::Int)
    # is Harshad number
    return n % sum(digits(n)) == 0
end

function isrth(n::Int)
    # is right truncatable Harshad number
    while n > 0
        ish(n) || break
        n = ifloor(n/10)
    end
    return n == 0
end

function issh(n::Int)
    # is strong Harshad number
    s = sum(digits(n))
    return isprime(int(n/s))
end

function generateRTH(size=1)
    return reduce(vcat, [recurseRTH(i, size) for i=1:9])
end

function recurseRTH(n, size=1, list=Int[])
    # Generate right truncatable harshad that start with the digit n
    length(digits(n)) > size && return 
    !ish(n) && return 

    for i=0:9
        if recurseRTH(10n+i, size, list) != nothing
            push!(list, 10n+i)
        end
    end
    return list
end

tic()

h1 = generateRTH(14)
h2 = filter(issh, h1)
h3 = Int[]
for h in h2, i=0:9
    if isprime(10h+i)
        push!(h3, 10h+i)
    end
end
s = sum(filter(x -> length(digits(x)) <= 14, h3))

println("="^40)
println("strong right truncatable Harshad primes")
println("answer: ", s)
println("It took $(toq()) seconds to complete")
println("="^40)
