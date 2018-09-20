# Right triangles with integer coordinates
# Problem 91
# https://projecteuler.net/problem=91

# There are exactly fourteen triangles containing a right angle that can be
# formed when each co-ordinate lies between 0 and 2 inclusive; that is,
# 0 ≤ x1, y1, x2, y2 ≤ 2.
#
# Given that 0 ≤ x1, y1, x2, y2 ≤ 50, how many right triangles can be formed?

hi = 50 # max sides

t = 3   # number of triangles
d = 11  # differences
p = 4   # periods

for i in 1:hi
    println("$i $t $d $p")
    t += d
    d += p
    p = p == 4 ? 8 : 4
end


 # 1  2   3   4   5   6    7
 # 3  14  29  52  79  114  153
 #  11  15  23  27  35   39
 #    4   8   4   8   4    8
