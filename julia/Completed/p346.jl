# Strong Repunits
# Problem 346
# The number 7 is special, because 7 is 111 written in base 2, and 11 written 
# in base 6 (i.e. 7_10 = 11_6 = 111_2). In other words, 7 is a repunit in at 
# least two bases b > 1.

# We shall call a positive integer with this property a strong repunit. It can 
# be verified that there are 8 strong repunits below 50: {1,7,13,15,21,31,40,43}. 
# Furthermore, the sum of all strong repunits below 1000 equals 15,864.

# Find the sum of all strong repunits below 10^12.

tic()

limit = 10^12
vals = [1]
count = 0
for b=2:ifloor(sqrt(limit))
    x = 1+b
    for i=2:limit
        count+=1
        x += b^i
        x > limit && break
        push!(vals, x)
    end
end

println(count)

repunits = sort(unique(vals))
# println(repunits)
println(sum(repunits))
toc()