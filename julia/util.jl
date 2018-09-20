
# TESTING


function printArray(p, n)
    for i = 1:n
        print("$(p[i]) ")
    end
    println()
end

function intpart(n)
    p = zeros(Int, n)
    k = 1
    p[k] = n

    allparts = Any[]

    while true
        push!(allparts, p[1:k])
        # printArray(p, k)

        rem_val = 0
        while k >= 1 && p[k] == 1
            rem_val += p[k]
            k -= 1
        end

        k < 1 && break

        p[k] -= 1
        rem_val += 1

        while rem_val > p[k]
            p[k+1] = p[k]
            rem_val -= p[k]
            k += 1
        end

        p[k+1] = rem_val
        k += 1
    end
    return allparts
end






# filename = homedir()*"\\OneDrive\\Euler\\data\\p089_roman.txt"
# data = readcsv(filename)

function fib(n)
    # Return the nth fibonacci number 
    phi = (1+sqrt(5))/2
    nphi = (1-sqrt(5))/2
    return (phi^n-nphi^n)/sqrt(5)
end

function isPalindrome(n::Int)
    # check if n is palindromic i.e. same digits back to front
    d = digits(n)
    return d == reverse(d)
end

function nextPalindrome(n::Int)
    # returns the next palindromic number that is greater than n
    num = string(n)
    len = length(num)
    odd = len % 2 != 0
    lef = num[1:len/2]
    mid = string(num[iceil(len/2)])

    if odd
        inc = 10^ifloor(len/2)
        nex = int(lef*mid*reverse(lef))
    else
        inc = int(1.1*10^ifloor(len/2))
        nex = int(lef*reverse(lef))
    end

    nex > n    && return nex
    mid != "9" && return nex + inc

    inc = 10^(ifloor(len/2)+1)
    roundup = (ifloor(n/inc)+1)*inc
    mid == "9" && return nextPalindrome(roundup)
end

function ispandigital(n::Int, digits)
    # Given a 9 digit integer determine if it is pandigital (1-9)
    # i.e. this number has to use all the digits from 1-9 in any order

    ref = falses(9)
    while n > 0
        r = n % 10
        if r != 0 ref[r] = true end
        n = ifloor(n/10)
    end
    return all(ref)
end

function modpow(b, e, m)
    # b^e (mod m)
    c = 1
    for i = 1:e
        c = c*b % m
    end
    return c
end

function matmodpow(A::Array, b::Int, c::Int)
    # Given a matrix A return A^b (mod c)
    b == 0 && return int(eye(size(A, 1)))
    if b % 2 == 1
        return (A * matmodpow(A, b-1, c)) % c
    end
    D = matmodpow(A, int(b/2), c)
    return (D*D) % c
end

function divisors{T<:Integer}(n::T)
    f = factor(n)
    divs = T[one(T)]
    for (p, r) in f
        tmp = T[]
        for d in divs, e in 0:r
            push!(tmp, d*p^e)
        end
        divs = copy(tmp)
    end
    return sort!(divs)
end

function sumdiv(n::Int)
    # Sum of the divisors (including the number itself)
    # return prod([div(k^(v+1)-1, k-1) for (k,v) in factor(n)])
    prod :: Int = 1
    for (k,v) in factor(n)
        prod *= div(k^(v+1)-1, k-1)
    end
    return prod
end

function bouncy(x::Int)
    # We shall call a positive integer that is neither increasing nor decreasing 
    # a "bouncy" number; for example, 155349.

    w = Int[]
    while x > 0
        y = x % 10
        x = ifloor(x/10)
        
        z = x % 10
        if z > y push!(w, -1) end
        if z < y push!(w, +1) end
    end
    Set(w[1:end-1]) == Set(1,-1)
end




function sqrpcf(n::Int)
    # Square root - Periodic continued fraction
    sqrt(n) == ifloor(sqrt(n)) ? 
        error("$n is a perfect square.") : 
    begin
        m, d, a = 0, 1, ifloor(sqrt(n))
        seq = [a]
        while true
            m = d * a - m
            d = int((n - m^2) / d)
            a = ifloor((seq[1] + m) / d)
            push!(seq, a)
            a != 2*seq[1] || break
        end
        return seq
    end
end

function cf(a::Array, D::Int)
    h2, h1 = BigInt(0), BigInt(1)
    k2, k1 = BigInt(1), BigInt(0)
    h = BigInt(a[1])*h1+h2
    k = BigInt(a[1])*k1+k2
    i, size = 1, length(a[2:end])
    while true
        h2, h1 = h1, h
        k2, k1 = k1, k
        n = i % size == 0 ? size : i % size
        h = (a[2:end][n]*h1)+h2
        k = (a[2:end][n]*k1)+k2
        # println("$h/$k = ", qd(h, D, k), " ", a[2:end][n])
        if qd(h, D, k) == 1 break end
        i += 1
    end
    # println(h," ",k)
    return h
end

