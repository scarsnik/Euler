# Investigating multiple reflections of a laser beam
# Problem 144
# In laser physics, a "white cell" is a mirror system that acts as a delay line 
# for the laser beam. The beam enters the cell, bounces around on the mirrors, 
# and eventually works its way back out.

# The specific white cell we will be considering is an ellipse with the 
# equation 4x^2 + y^2 = 100

# The section corresponding to −0.01 ≤ x ≤ +0.01 at the top is missing, allowing 
# the light to enter and exit through the hole.

# The light beam in this problem starts at the point (0.0,10.1) just outside the
# white cell, and the beam first impacts the mirror at (1.4,-9.6).

# Each time the laser beam hits the surface of the ellipse, it follows the usual 
# law of reflection "angle of incidence equals angle of reflection." That is, 
# both the incident and reflected beams make the same angle with the normal line 
# at the point of incidence.

# In the figure on the left, the red line shows the first two points of contact 
# between the laser beam and the wall of the white cell; the blue line shows the 
# line tangent to the ellipse at the point of incidence of the first bounce.

# The slope m of the tangent line at any point (x,y) of the given ellipse is: 
# m = −4x/y

# The normal line is perpendicular to this tangent line at the point of incidence.

# The animation on the right shows the first 10 reflections of the beam.

# How many times does the beam hit the internal surface of the white cell before exiting?
# http://stackoverflow.com/questions/17395860/how-to-reflect-a-line-over-another-line

function slope(p1, p2)
    # Find the slope of the line (p1, p2)
    d = p1 - p2
    return d[2] / d[1]
end

function tangent(p)
    # Find the tangent line at point p
    return -4 * p[1] / p[2]
end

function rotate(point, angle)
    # rotates a point [x, y] around the origin [0, 0]
    # counter clockwise by the angle in radians
    r = [cos(angle) -sin(angle); sin(angle) cos(angle)]
    return r * point
end

function reflect(tail, head, tangent)
    # Reflect the line (tail, head) off the tangent
    mov = tail - head
    rot = rotate(mov, -atan(tangent))
    ref = [-1, 1] .* rot
    rot = rotate(ref, atan(tangent))
    mov = rot + head
    return mov
end

function getb(p, m)
    # Get the y-intercept from y = m*x + (y1 - m*x1)
    return p[2] - m*p[1]
end

function newPoint(tail, head)

end

function getxy(m, b)
    # find the x values for the intersection of a line and the ellipse
    # the line is of the form y = mx + b
    i = -2*m*b
    j = sqrt( (2*m*b)^2 - (4*(4 + m^2)*(b^2 - 100)) )
    k = 8 + 2m^2

    x = [(i + j) / k, (i - j) / k]
    y = m.*x.+b
    return [x[1],y[1]], [x[2],y[2]]
end

function nexthead(tail, head)
    t = tangent(head)
    r = reflect(tail, head, t)
    m = slope(r, head)
    b = getb(head, m)
    newHead = getxy(m, b)

    error = 0.0001
    if all(newHead[1] .- [error, error] .< head .< newHead[1] .+ [error, error])
        return newHead[2]
    else
        return newHead[1]    
    end

end

tail = [0, 10.1]
head = [1.4, -9.6]
println(head)
ans = 0
while true
    tail, head = head, nexthead(tail, head)
    ans += 1
    println("$ans = $head")
    if -0.01 <= head[1] <= 0.01 && head[2] > 9.99997999999998
        break
    end
    ans > 10^7 && break
    if ans % 10000 == 0
        println(ans)
    end
end

println(ans)