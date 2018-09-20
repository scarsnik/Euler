# Square digit chains
# Problem 92
# A number chain is created by continuously adding the square of the digits in 
# a number to form a new number until it has been seen before.

# For example,
# 44 → 32 → 13 → 10 → 1 → 1
# 85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89

# Therefore any chain that arrives at 1 or 89 will become stuck in an endless 
# loop. What is most amazing is that EVERY starting number will eventually 
# arrive at 1 or 89.

# How many starting numbers below ten million will arrive at 89?
# 8581146

function sqDigits(x)
    # digits = split(string(x),"")
    return sum([x^2 for x in map(int, split(string(x),""))])
end

function sqDigitChain(x, sqMap, target)
    chain = Int[]
    a = x
    while true
        if haskey(target,a)
            a = target[a]
            break
        end

        push!(chain, a)
        a = sqDigits(a)

        if a==1 || a==89
            break
        end
    end
    
    for i in chain
        if !haskey(target,i)
            target[i] = a
        end
    end
    return a
end

target = Dict()
tic()

count = 0
for n in [1:int(1e7)]
    if sqDigitChain(n, sqMap, target) == 89
        count += 1
    end
end
println(count)
toc()