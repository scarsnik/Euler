# Almost equilateral triangles
# Problem 94

# It is easily proved that no equilateral triangle exists with integral length
# sides and integral area. However, the almost equilateral triangle 5-5-6 has
# an area of 12 square units.

# We shall define an almost equilateral triangle to be a triangle for which two
# sides are equal and the third differs by no more than one unit.

# Find the sum of the perimeters of all almost equilateral triangles with
# integral side lengths and area and whose perimeters do not exceed one
# billion (1,000,000,000).

p = 13 # Padding length

sum = 0
x, y = 2, 1 # Pell Equation Fundamental Solution to ((3x+-1)/2) ^ 2 - 3h^2 = 1
for i in 1:14
    x, y = 2x + 3y, 2y + x

    a1, a2 = (2x+1)/3, (2x-1)/3
    b1, b2 = a1+1, a2-1
    a = a1 % 1 == 0 ? a1 : a2
    b = a1 % 1 == 0 ? b1 : b2
    s1 = lpad(x, p, " ")
    s2 = lpad(y, p, " ")
    s3 = lpad(a, p, " ")
    s4 = lpad(b, p, " ")

    println(s1, " ", s2, " ", s3, " ", s4)
    perim = a + a + b
    println(perim)
    sum += perim
end

println(sum)
