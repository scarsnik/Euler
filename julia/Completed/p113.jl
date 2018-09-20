include("util.jl")

# Non-bouncy numbers
# Problem 113
# Working from left-to-right if no digit is exceeded by the digit to its left 
# it is called an increasing number; for example, 134468.

# Similarly if no digit is exceeded by the digit to its right it is called a 
# decreasing number; for example, 66420.

# We shall call a positive integer that is neither increasing nor decreasing 
# a "bouncy" number; for example, 155349.

# As n increases, the proportion of bouncy numbers below n increases such that 
# there are only 12951 numbers below one-million that are not bouncy and only 
# 277032 non-bouncy numbers below 10^10.

# How many numbers below a googol (10^100) are not bouncy?
tic()

function notbouncy(lo, hi)
    return sum([!bouncy(i) for i=lo:hi])
end

function notbouncygrid(start, gap)
    # start = 10^4
    # gap = 10^3
    A = Int[]
    for i=1:9
        for j=start*i:gap:start*i+9*gap
            push!(A, notbouncy(j,j+gap-1))
            # [notbouncy(j, j+9) for i=1:9, j=100*i:10:100*i+90]        
        end
    end
    B = reshape(A, 10, 9)
    # display(B)
    return B
end

function nextGrid(A)
    B  = cumsum(A, 1)
    Bu = triu(B[2:10, :])
    Bu[diagind(Bu, 0)] = 0
    Bd = eye(Int, 9) .* B[10, :]
    Bl = tril(rot180(B)[2:10, :]) .* ((eye(Int, 9) .+ 1) % 2)
    return vcat(ones(Int, 9)', Bu + Bd + Bl)
end

A = ones(Int, 10,9)
answer = 99
for i=3:100
    A = nextGrid(A)
    answer += sum(A)
end
println(answer)

toc()


# As n increases, the proportion of bouncy numbers below n increases such that 
# there are only 12951 numbers below one-million that are not bouncy and only 
# 277032 non-bouncy numbers below 10^10.

# How many numbers below a googol (10^100) are not bouncy?
