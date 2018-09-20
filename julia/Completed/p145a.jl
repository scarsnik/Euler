# How many reversible numbers are there below one-billion?
# Problem 145

# Some positive integers n have the property that the sum [ n + reverse(n) ] 
# consists entirely of odd (decimal) digits. For instance, 36 + 63 = 99 and 
# 409 + 904 = 1313. We will call such numbers reversible; so 36, 63, 409, and 
# 904 are reversible. Leading zeroes are not allowed in either n or reverse(n).

# There are 120 reversible numbers below one-thousand.

# How many reversible numbers are there below one-billion (109)?

function reverse(n)
  d, r = Int[], 0
  while n > 0
    r = 10r + n % 10
    push!(d, n % 10)
    n = ifloor(n/10)
  end
  return r, d
end

function isodd(n)
  rev = reverse(n)
  len = length(rev)
  for i=1:ifloor(len/2)
    if rev[i]
  end
end



# function digits(n)
#   while n > 0
#     d = n/10
#     k = n - 10d
#     n = d
#     println(k)
#   end
# end

# function printDigits(n, collect=Int[])
#   if n / 10 > 0
#     printDigits(ifloor(n / 10), collect)
#   end
#   # println("$(n % 10)")
#   push!(collect, n%10)
# end