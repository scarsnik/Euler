# Under The Rainbow
# Problem 493
# 
# 70 colored balls are placed in an urn, 10 for each of the seven rainbow colors.
# 
# What is the expected number of distinct colors in 20 randomly picked balls?
# 
# Give your answer with nine digits after the decimal point (a.bcdefghij).

# red
# orange
# yellow
# green
# blue
# indigo
# violet

tic()

# colors = ""
# for c in "roygbiv"
#   colors *= string(c)^10
# end
# colorsArray = split(colors, "")

nums = reduce(vcat, [repmat([x], 10) for x=1:7])
sum = BigFloat(0)
max = 100
for i=1:max
  sum += length(unique(shuffle(nums)[1:20]))
end
println(sum/max)

toc()

# 7(1 - (60 choose 20)/(70 choose 20))

# To get this write X, the count of colors present, as a sum X0+X1+X2+...+X6, where Xi is 1 if the ith color is present, and 0 if it is not present.

# E(X) 
# = E(X0+X1+...+X6) 
# = E(X0) + E(X1) + ... + E(X6)        by linearity of expectation
# = 7E(X0)                             by symmetry
# = 7 * probability that a particular color is present
# = 7 * (1- probability that a particular color is absent)
# = 7 * (1 - (# ways to pick 20 avoiding a color)/(# ways to pick 20))
# = 7 * (1 - (60 choose 20)/(70 choose 20))

a = binomial(BigInt(60), BigInt(20))
b = binomial(BigInt(70), BigInt(20))
7*(1-(a/b))