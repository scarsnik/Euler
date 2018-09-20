# Square root digital expansion
# Problem 80
# It is well known that if the square root of a natural number is not an 
# integer, then it is irrational. The decimal expansion of such square 
# roots is infinite without any repeating pattern at all.

# The square root of two is 1.41421356237309504880..., and the digital 
# sum of the first one hundred decimal digits is 475.

# For the first one hundred natural numbers, find the total of the digital 
# sums of the first one hundred decimal digits for all the irrational 
# square roots.
tic()
set_bigfloat_precision(512)
totalSum = 0
for i = 1:100
    if length(string(sqrt(i))) > 7
        n = string(sqrt(BigFloat(i)))[1:101]
        n = replace(n, ".", "")
        totalSum += sum(map(int, split(n, "")))
    end
end
println(totalSum)
toc()

# function createPairs(n)
#     s = split(string(n), ".")
#     l = isodd(length(s[1])) ? "0"*s[1] : s[1]
#     r = length(s) == 2 ? begin
#         isodd(length(s[2])) ? s[2]*"0" : s[2]
#     end : ""
#     s = l*r
#     return [s[2(x-1)+1:2x] for x in 1:length(s)/2]
# end

# function sqrtDigits(n, digits=5)
#     s = createPairs(n)
#     c, p, x, y, r = 0, 0, 0, 0, 0
#     i, ans = 1, BigFloat(0)
#     while true
#         c = i <= length(s) ? 100*r+int(s[i]) : 100*r
#         p = ans
#         for j in 1:10
#             if j*(20*p+j) <= c
#                 x = j
#             end
#         end
#         y = x*(20*p+x)
#         ans = ans*10+x
#         r = c - y
#         if (r == 0 && i==length(s)) || i == digits
#             break
#         end
#         # println("$i: c=$c, p=$p, x=$x, y=$y, r=$r")
#         i += 1
#     end
#     return ans
# end

# n = 152.2756
# # s = createPairs(n)
# sqrtDigits(2.32, 10)

