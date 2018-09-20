whos()
workspace()

# P61 Cyclical figurate numbers
# Triangle, square, pentagonal, hexagonal, heptagonal, and octagonal numbers are
# all figurate (polygonal) numbers and are generated by the following formulae:
# 
# Triangle        P3,n=n(n+1)/2       1, 3, 6, 10, 15, ...
# Square          P4,n=n^2            1, 4, 9, 16, 25, ...
# Pentagonal      P5,n=n(3n−1)/2      1, 5, 12, 22, 35, ...
# Hexagonal       P6,n=n(2n−1)        1, 6, 15, 28, 45, ...
# Heptagonal      P7,n=n(5n−3)/2      1, 7, 18, 34, 55, ...
# Octagonal       P8,n=n(3n−2)        1, 8, 21, 40, 65, ...
# The ordered set of three 4-digit numbers: 8128, 2882, 8281, has three 
# interesting properties.

# The set is cyclic, in that the last two digits of each number is the first 
# two digits of the next number (including the last number with the first).
# 
# Each polygonal type: triangle (P3,127=8128), square (P4,91=8281), and 
# pentagonal (P5,44=2882), is represented by a different number in the set.
# 
# This is the only set of 4-digit numbers with this property.
# Find the sum of the only ordered set of six cyclic 4-digit numbers for 
# which each polygonal type: triangle, square, pentagonal, hexagonal, 
# heptagonal, and octagonal, is represented by a different number in the set.

########## Helper functions ##########
function solvequad(a::Int, b::Int, c::Int)
  return (-b + sqrt((-b)^2 - 4a*c)) / 2a
end

function poly(s::Int, n::Int)
  # s = number of sides, n = number in the sequence
  return (n^2*(s-2)-n*(s-4))/2
end

function ispoly(n::Int, s::Int)
  # Check if n is a polygonal number of sides s
  s==3 ? solvequad(1, 1, -2n)  % 1 == 0 :
  s==4 ? sqrt(n)               % 1 == 0 :
  s==5 ? solvequad(3, -1, -2n) % 1 == 0 :
  s==6 ? solvequad(2, -1, -n)  % 1 == 0 :
  s==7 ? solvequad(5, -3, -2n) % 1 == 0 :
  s==8 ? solvequad(3, -2, -n)  % 1 == 0 : false
end

function iscycle(x::Array)
  x = [string(i) for i in x]
  p, s, e = Any[], 2:3, 4:5
  for i = 1:length(x)
    push!(p, x[i][1:1])
    j = i % length(x) + 1
    a, b = x[i][e], x[j][s]
    if a != b return false end
  end
  if unique(p) != p return false end
  return true
end

l(n) = ifloor(n/10^2) # Gets the left  2 digits
r(n) = n % 10^2       # Gets the right 2 digits

########## Set up variables ##########

# all figurate numbers that are 4 digits
# the numbers are prefixed with the type
# i.e. 1035 is triangular then n = (3, 1035)
nums = filter(x->ispoly(x[1], x[2]), [(n, s) for n=1000:9999, s=3:8])
nums = filter(x->r(x[1])>=10, nums)

vals = {s=>[n[1] for n in filter(x->x[2]==s, nums)] for s=3:8}

function findit(vals, seq, i, k, path=Any[])
    i > length(seq) && return path
    s = seq[i]
    if k in keys(vals[s])
        for v in vals[s][k]
            push!(path, (s, k, v))
            findit(vals, seq, i+1, v, path)
        end
    end
    return
end


# seq = [3,5,4]
# for k in keys(vals[seq[1]])
#     path = findit(vals, seq, 1, k)
#     println(path)
# end




