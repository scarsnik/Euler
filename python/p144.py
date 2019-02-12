"""
    
Project Euler - Problem 144 - Investigating multiple reflections of a laser beam
https://projecteuler.net/problem=144

NOTES:
# http://stackoverflow.com/questions/17395860/how-to-reflect-a-line-over-another-line

"""
import timing
import numpy as np
from math import sin, cos, atan, sqrt, pow


def main():
    tail = np.array([0.0, 10.1])
    head = np.array([1.4, -9.6])
    
    answer = 0
    while True:
        print(f'head = {head}')
        tail, head = head, nexthead(tail, head)
        answer += 1

        if -0.01 <= head[0] <= 0.01 and head[1] > 9.99:
            break

    print(answer)


def slope(p1, p2):
    # Find the slope of the line (p1, p2)
    # p1, p2 are np.arrays of size 2
    d = p1 - p2
    return d[1] / d[0]


def tangent(p):
    # Find the tangent line at point p
    # p is a np.array of size 2
    return -4 * (p[0] / p[1])


def rotate(point, angle):
    # rotates a point [x, y] {np.array} around the origin [0, 0]
    # counter clockwise by the angle in radians
    r = np.array([[cos(angle), -sin(angle)], [sin(angle), cos(angle)]])
    return r.dot(point)


def reflect(tail, head, tangent):
    # Reflect the line (tail, head) off the tangent
    # tail, head are np.arrays of size 2
    # tangent is a scalar float
    mov = tail - head
    rot = rotate(mov, -atan(tangent))
    ref = np.array([-1, 1]) * rot
    rot = rotate(ref, atan(tangent))
    mov = rot + head
    return mov


def getb(p, m):
    # Get the y-intercept from y = m*x + (y1 - m*x1)
    # point is a np.array of size 2
    # slope (m) is a scalar float
    return p[1] - (m * p[0])


def getxy(m, b):
    # find the x values for the intersection of a line and the ellipse
    # the line is of the form y = mx + b
    # solved using simultaneous equations and then quadratic equation
    i = -2*m*b
    j = sqrt( (2*m*b)**2 - (4*(4 + m**2)*(b**2 - 100)) )
    k = 2*(4 + m**2)

    x = np.array([(i + j) / k, (i - j) / k])
    y = (m * x) + b

    head1 = np.array([x[0], y[0]])
    head2 = np.array([x[1], y[1]])
    return [head1, head2]


def nexthead(tail, head):
    t = tangent(head)
    r = reflect(tail, head, t)
    m = slope(r, head)
    b = getb(head, m)
    new_head = getxy(m, b)
    
    error = 0.001
    if np.all(np.logical_and(new_head[0] - error < head,  head < new_head[0] + error)):
        return new_head[1]
    else:
        return new_head[0]


if __name__ == '__main__':
    main()
