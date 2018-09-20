# https://projecteuler.net/problem=78

tic()

p = {big(0) => big(1)}

function part(n)
    n < 0 && return 0
    s = sum([haskey(p, k) ? i*p[k] : i*part(k) for (i,k) in pk(n)])
    p[n] = s
    return s
end

function pk(n)
    A = Any[]
    i = 1
    while true
        j = n - int((3i^2-i)/2)
        j < 0 && break
        push!(A, (isodd(i) ? 1 : -1, j))
        i = i > 0 ? -i : abs(i)+1 # Next n
    end
    return reverse(A)
end

for i=1:100000
    x = part(i)
    if x % 1000000 == 0
        println(i)
    end
end

toc()