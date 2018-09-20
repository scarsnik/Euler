include("util.jl")

# Diophantine equation
# Problem 66
# Consider quadratic Diophantine equations of the form:

# x^2 – Dy^2 = 1

# For example, when D=13, the minimal solution in x is 6492 – 13×1802 = 1.

# It can be assumed that there are no solutions in positive integers when D 
# is square.

# By finding minimal solutions in x for D = {2, 3, 5, 6, 7}, we obtain the 
# following:

# 3^2 – 2×2^2 = 1
# 2^2 – 3×1^2 = 1
# 9^2 – 5×4^2 = 1
# 5^2 – 6×2^2 = 1
# 8^2 – 7×3^2 = 1

# Hence, by considering minimal solutions in x for D ≤ 7, the largest x is
# obtained when D=5.

# Find the value of D ≤ 1000 in minimal solutions of x for which the 
# largest value of x is obtained.

qd(x, D, y) = x^2 - D*y^2

function cf(a::Array, D::Int)
    h2, h1 = BigInt(0), BigInt(1)
    k2, k1 = BigInt(1), BigInt(0)
    h = BigInt(a[1])*h1+h2
    k = BigInt(a[1])*k1+k2
    i, size = 1, length(a[2:end])
    while true
        h2, h1 = h1, h
        k2, k1 = k1, k
        n = i % size == 0 ? size : i % size
        h = (a[2:end][n]*h1)+h2
        k = (a[2:end][n]*k1)+k2
        # println("$h/$k = ", qd(h, D, k), " ", a[2:end][n])
        if qd(h, D, k) == 1 break end
        i += 1
    end
    # println(h," ",k)
    return h
end

max = (0,0)
Ds = zeros(1000)
for D in 1:1000
    if sqrt(D) % ifloor(sqrt(D)) > 0
        a = sqrpcf(D)
        x = cf(a, D) 
        if x > max[1] 
            max = (x,D)
        end
    end
end
println(max)


