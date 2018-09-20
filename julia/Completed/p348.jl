# Sum of a square and a cube
# Problem 348
# Many numbers can be expressed as the sum of a square and a cube. Some of them
# in more than one way.

# Consider the palindromic numbers that can be expressed as the sum of a square
# and a cube, both greater than 1, in exactly 4 different ways.
# For example, 5229225 is a palindromic number and it can be expressed in 
# exactly 4 different ways:

# 2285^2 + 20^3
# 2223^2 + 66^3
# 1810^2 + 125^3
# 1197^2 + 156^3

# Find the sum of the five smallest such palindromic numbers.
include("util.jl")

tic()

answer = 0
counter = 0
target = 5
n = 1
while true
	A = n - [i^3 for i = 1:ifloor(cbrt(n))]
	if sum(A .^ (1/2) % 1 .== 0) == 4
		answer += n
		counter += 1
		println(n)
		counter == target && break
	end
	n = nextPalindrome(n)
end

println("answer = $answer")

toc()


# WORKING

# answer = 0
# counter = 0
# target = 4
# n = 1
# while true
# 	A = n - [i^3 for i = 1:ifloor(cbrt(n))]
# 	if sum(A .^ (1/2) % 1 .== 0) == 4
# 		answer += n
# 		counter += 1
# 		println(n)
# 		counter == target && break
# 	end
# 	n = nextPalindrome(n)
# end

# println(answer)
