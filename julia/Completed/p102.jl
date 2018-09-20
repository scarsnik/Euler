# Triangle containment
# Problem 102
# Three distinct points are plotted at random on a Cartesian plane, for which 
# -1000 ≤ x, y ≤ 1000, such that a triangle is formed.

# Consider the following two triangles:
# A(-340,495), B(-153,-910), C(835,-947)
# X(-175,41), Y(-421,-714), Z(574,-645)

# It can be verified that triangle ABC contains the origin, whereas triangle 
# XYZ does not.

# Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text 
# file containing the co-ordinates of one thousand "random" triangles, find 
# the number of triangles for which the interior contains the origin.

# NOTE: The first two examples in the file represent the triangles in the 
# example given above.

function intercepts(x1, y1, x2, y2)
    d = x1 < x2 ? (x1, x2) : (x2, x1)
    r = y1 < y2 ? (y1, y2) : (y2, y1)

    m = (y1-y2)/(x1-x2)
    y0 = y1 - m*x1
    x0 = -y0 / m

    y0 = r[1] <= y0 <= r[2] ? y0 : nothing
    x0 = d[1] <= x0 <= d[2] ? x0 : nothing
    return x0, y0
end

data = readcsv("../data/p102_triangles.txt")
count = 0

for i=1:1000
    p = data[i, :]
    x1, y1 = intercepts(p[1], p[2], p[3], p[4])
    x2, y2 = intercepts(p[3], p[4], p[5], p[6])
    x3, y3 = intercepts(p[5], p[6], p[1], p[2])
    x = Set(sign(filter(x->x!=nothing, [x1,x2,x3])))
    y = Set(sign(filter(x->x!=nothing, [y1,y2,y3])))
    if x == Set(-1,1) && y == Set(-1,1) 
        count += 1
    end
end

println(count)
