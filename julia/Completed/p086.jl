# Cuboid route
# Problem 86
# https://projecteuler.net/problem=86

tic()

count = 0
target = 1_000_000

a, b, c = 1, 1, 1
while true
    for b in 1:a, c in b:a
        d1 = a^2 + (b+c)^2
        # d2 = b^2 + (a+c)^2
        # d3 = c^2 + (a+b)^2
        # if sqrt(min(d1, d2, d3)) % 1 == 0
        if sqrt(d1) % 1 == 0
            count += 1
            # println("$(a+b+c) $a $b $c $d1 $d2 $d3")
            # println("$(a+b+c) $a $b $c $d1")
        else
            # println("$(a+b+c) $a $b $c $d1")
        end
    end
    count > target && break
    a += 1
end

toc()

println("=== Problem 86 ===")
println("For maximum size $a, there are $count solutions.")
