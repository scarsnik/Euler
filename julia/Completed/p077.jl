# Prime summations
# Problem 77
# It is possible to write ten as the sum of primes in exactly five different 
# ways:

# 7 + 3
# 5 + 5
# 5 + 3 + 2
# 3 + 3 + 2 + 2
# 2 + 2 + 2 + 2 + 2

# What is the first value which can be written as the sum of primes in over
# five thousand different ways?

function f(i::Int, j::Int, ftable::Dict, c::Array)
    i == j == 0 && return 1
    i <= 0 && return 0
    j <= 0 && return 0
    i-c[j] < 0 && return 0

    return sum([ftable[i-c[j], k] for k=0:j])
end

function parts(n::Int, c::Array)
    ftable = Dict()
    for i=0:n
        for j=0:length(c)
            ftable[i, j] = f(i, j, ftable, c)
        end
    end

    targetrow = filter((k,v)->k[1]==n, ftable)
    return sum(values(targetrow))
end

target = 5000
for n = 10:100
    costs = primes(n)
    p = parts(n, costs)
    println(n, "-", p)
    if p > target
        println(n)
        break
    end
end

# More generally, given any set C of distinct integers (such as {2,3}
# or the set of primes, or the set of squares, etc.) there are fairly
# efficient algorithms for computing the number of ways in which n
# can be expressed as a sum of elements of C, allowing multiplicities
# but without regard to order.  Let c_1,c_2,c_3,... denote the elements
# of C in increasing order and set c_0 = 0 to represent the null element.
# Then for every pair of integers i,j we define the function f(i,j)
# with the assignments

#        f(0,0) = 1
#        f(i,j) = 0   if either i or j is less than or equal to zero
#                     (but not both zero)

# and the recursive relation

#                         j
#              f(i,j) = SUM  f(i - c_j, k)
#                        k=0

# for all i,j > 0.  Then the number of ways in which an integer n
# can be expressed as the sum of elements of C is given by

#                           n
#                v(n)  =  SUM  f(n,k)
#                          k=1

# These coefficients can be determined using the f array for sums of the set 
# {1,2,5,10,20} as described previously. This gives the easily-tabulated array
# shown below:

#               0  1  2  3  4  5       sum
#          0    1  0  0  0  0  0        1
#          1    0  1  0  0  0  0        1
#          2    0  1  1  0  0  0        2
#          3    0  1  1  0  0  0        2
#          4    0  1  2  0  0  0        3
#          5    0  1  2  1  0  0        4
#          6    0  1  3  1  0  0        5
#          7    0  1  3  2  0  0        6
#          8    0  1  4  2  0  0        7
#          9    0  1  4  3  0  0        8
#         10    0  1  5  4  1  0       11
#         11    0  1  5  5  1  0       12
#         12    0  1  6  6  2  0       15
#         13    0  1  6  7  2  0       16
#         14    0  1  7  8  3  0       19
#         15    0  1  7 10  4  0       22
#         16    0  1  8 11  5  0       25
#         17    0  1  8 13  6  0       28
#         18    0  1  9 14  7  0       31
#         19    0  1  9 16  8  0       34
#         20    0  1 10 18 11  1       41
#                                     ---
#                          Total  =   293
