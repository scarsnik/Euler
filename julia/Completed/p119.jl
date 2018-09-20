# Digit power sum
# Problem 119
# The number 512 is interesting because it is equal to the sum of its digits 
# raised to some power: 5 + 1 + 2 = 8, and 8^3 = 512. Another example of a 
# number with this property is 614656 = 28^4.

# We shall define an to be the nth term of this sequence and insist that a 
# number must contain at least two digits to have a sum.

# You are given that a_2 = 512 and a_10 = 614656.

# Find a_30.

tic()

numbers = Any[]
blimit = 100
elimit = 8
for b=2:blimit, e=2:elimit
	n = b^e
	if sum(digits(n)) == b
		push!(numbers, (n, b, e))
	end
end

toc()


