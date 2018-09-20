# Counting block combinations I
# Problem 114

# A row measuring seven units in length has red blocks with a minimum length of 
# three units placed on it, such that any two red blocks (which are allowed to 
# be different lengths) are separated by at least one black square. There are 
# exactly seventeen ways of doing this.
 
# How many ways can a row measuring fifty units in length be filled?

# NOTE: Although the example above does not lend itself to the possibility, in 
# general it is permitted to mix block sizes. For example, on a row measuring 
# eight units in length you could use red (3), black (1), and red (4).

# 3 = 2  2  1 0 1
# 4 = 4  3  1 1 1
# 5 = 7  4  2 2 -2
# 6 = 11 6  4 0
# 7 = 17 10 4
# 8 = 27 14
# 9 = 41 

# Get the number of single blocks including empty block (minimum size 3)
function singles(n::Int, m::Int=3)
    a = n - m + 1
    return div(a * (a + 1), 2) - 1
end

# Number of AT LEAST double blocks including empty block (minimum size 3)
function doubles(n::Int, m::Int=3)
    s = singles(n)
    r = m + 1
    while m + r < n
        s += singles(n-r+1)
        r += 1
    end
    return s + 1
end

for i = 3:8
    println(doubles(i))
end

