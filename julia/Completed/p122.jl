# Efficient exponentiation
# Problem 122
# The most naive way of computing n^15 requires fourteen multiplications:
# But using a "binary" method you can compute it in six multiplications:
# However it is yet possible to compute it in only five multiplications:

# n × n = n^2
# n^2 × n = n^3
# n^3 × n^3 = n^6
# n^6 × n^6 = n^12
# n^12 × n^3 = n^15

# We shall define m(k) to be the minimum number of multiplications to 
# compute n^k; for example m(15) = 5.

# For 1 ≤ k ≤ 200, find ∑ m(k).
tic()

limit = 10
cost = {typemax(Int) for i=1:limit}
path = Dict()
function backtrack(power :: Int, depth :: Int)
    println("$power $depth")
    power > limit       && return
    depth > cost[power] && return

    cost[power] = depth
    path[depth] = power

    for i=depth:-1:0
        backtrack(power + path[i], depth + 1)
    end
end

backtrack(1, 0)

println(sum(cost))

toc()

# 1+1 = 2

# 1+1 = 2
# 1+2 = 3

# 1+1 = 2
# 2+2 = 4

# 1+1 = 2
# 1+2 = 3
# 2+3 = 5

# 1+1 = 2
# 1+2 = 3
# 3+3 = 6

# 1+1 = 2
# 1+2 = 3
# 2+2 = 4
# 3+4 = 7

# 1+1 = 2
# 2+2 = 4
# 4+4 = 8

# 1+1 = 2
# 1+2 = 3
# 3+3 = 6
# 3+6 = 9

# 1+1 = 2
# 2+2 = 4
# 4+4 = 8
# 1+8 = 9

# 1+1 = 2
# 2+2 = 4
# 4+4 = 8
# 8+2 = 10

# 1+1 = 2
# 1+2 = 3
# 3+3 = 6
# 2+3 = 5
# 5+6 = 11

# 1+1 = 2
# 1+2 = 3
# 3+3 = 6
# 6+6 = 12

# 1+1 = 2
# 1+2 = 3
# 3+3 = 6
# 6+6 = 12
# 12+1 = 13

# 1+1 = 2
# 1+2 = 3
# 2+2 = 4
# 3+4 = 7
# 7+7 = 14

# 1+1 = 2
# 1+2 = 3
# 3+3 = 6
# 6+6 = 12
# 12+3 = 15

# 1+1 = 2
# 2+2 = 4
# 4+4 = 8
# 8+8 = 16
