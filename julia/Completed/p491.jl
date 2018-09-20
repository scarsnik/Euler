# Double pandigital number divisible by 11
# Problem 491

# We call a positive integer double pandigital if it uses all the digits 0 to 9 
# exactly twice (with no leading zero). For example, 40561817703823564929 is one 
# such number.

# How many double pandigital numbers are divisible by 11?


# Divisibility by 11
# a is divisible by 11 if and only if the alternating sum of the digits 
# a_n(-1)^n + a_(n-1)(-1)^(n-1) + ... -a1 + a0 is divisible by 11.

function isdblpandigital(n, d)
    # check if n is double pandigital for digits 0 to d
    dcount = {i=>0 for i in 0:d}
    while n > 0
        r = n % 10
        !haskey(dcount, r) && return false
        dcount[r] += 1
        dcount[r] > 2 && return false
        n = ifloor(n/10)
    end
    return all(collect(values(dcount)) .== 2)
end

function alt(A)
    d = size(A,1)
    B = [0:d-1,0:d-1]
    for i in A
        splice!(B, findfirst(B, i))
    end
    return B
end

function digitperms(A)
    m = size(A, 1)
    dbls1 = [length(find(f->f==i, A)) for i in unique(A)]
    zeros = length(find(f->f==0, A))
    p1 = (zeros > 0 ? (m-zeros)*factorial(m-1) : factorial(m)) / prod(dbls1)
    
    B = alt(A)
    dbls2 = [length(find(f->f==i, B)) for i in unique(B)]
    p2 = factorial(m) / prod(dbls2)
    
    return p1*p2
end

tic()
maxd = 9
arrd = repmat(0:maxd, 2)
c1 = combinations(arrd, maxd+1)
c2 = filter(f->(sum(f)-(sum(arrd)-sum(f))) % 11 == 0, c1)
c3 = unique(map(sort, c2))
println(int(sum(map(digitperms, c3))))

toc()



# tic()
# x = filter(f->f%11==0 && isdblpandigital(f, maxd), 10^(2maxd+1):10^(2maxd+2)-1)
# toc()