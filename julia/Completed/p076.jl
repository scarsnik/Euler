# Counting summations
# Problem 76
# It is possible to write five as a sum in exactly six different ways:

# 4 + 1
# 3 + 2
# 3 + 1 + 1
# 2 + 2 + 1
# 2 + 1 + 1 + 1
# 1 + 1 + 1 + 1 + 1

# How many different ways can one hundred be written as a sum of at least 
# two positive integers?

n = 100
table = [BigInt(0) for x in 1:n, y in 1:n]
table[1,:] = [BigInt(x) for x in ones(n)]
table[:,1] = [BigInt(x) for x in ones(n)]

for i in 1:n
    for j in 2:n
        if i-j < 0
            table[i, j] = BigFloat(table[i, j-1])
        elseif i-j == 0
            table[i, j] = BigFloat(table[i, j-1]) + 1
        else
            table[i, j] = BigFloat(table[i, j-1]) + BigFloat(table[i-j, j])
        end
    end
end

# 190569292-1