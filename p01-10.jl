
# P1
# sum = 0
# for i in 1:999
# 	if (i%3==0 || i%5==0) sum += i end
# end
# println("P1=",sum)

# # P2 - Even Fibonacci numbers
# fib1 = 1
# fib2 = 1
# fibn = fib1 + fib2 
# sum = fibn
# while fibn < 4000000
# 	fib1 = fib2
# 	fib2 = fibn
# 	fibn = fib1 + fib2
# 	if fibn%2==0 sum += fibn end
# end

# println("P2=",sum)


# P3 - Largest prime factor
# What is the largest prime factor of the number 600851475143?

n = 600851475143
p_list = reverse(primes(ifloor(sqrt(n))))
for p in p_list
	if n%p==0 
		println("P3=",p)
		break 
	end
end



# P4 - Largest palindrome product
# A palindromic number reads the same both ways. The largest palindrome made 
# from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

result = 0
found = false
for a in 9:-1:1
	for b in 9:-1:0
		for c in 9:-1:0
			n = int(string(a,b,c,c,b,a))
			for d in 100:999
				if n%d==0 && divrem(n,d) <= (999,999)
					println("P4=",n)
					found = true
					break
				end
			end
			if found break end
		end
		if found break end
	end
	if found break end
end


# P5 - Smallest multiple
# 2520 is the smallest number that can be divided by each of the numbers from 
# 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the 
# numbers from 1 to 20?

println("P5=",1*2*3*2*5*1*7*2*3*1*11*1*13*1*1*2*17*1*19*1)

# P6 - Sum square difference
# Find the difference between the sum of the squares of the first one hundred 
# natural numbers and the square of the sum.

sum_of_squares = sum([x^2 for x in 1:100])
square_of_sum = sum([x for x in 1:100])^2
println("P6=",square_of_sum-sum_of_squares)


# P7 - 10,001st prime
# What is the 10,001st prime number?
println("P7=",primes(200000)[10001])


# P8 - Largest product in a series
# Find the greatest product of five consecutive digits in the 1000-digit number.

l = Array(String,20,1)
l[1] = "73167176531330624919225119674426574742355349194934"
l[2] = "96983520312774506326239578318016984801869478851843"
l[3] = "85861560789112949495459501737958331952853208805511"
l[4] = "12540698747158523863050715693290963295227443043557"
l[5] = "66896648950445244523161731856403098711121722383113"
l[6] = "62229893423380308135336276614282806444486645238749"
l[7] = "30358907296290491560440772390713810515859307960866"
l[8] = "70172427121883998797908792274921901699720888093776"
l[9] = "65727333001053367881220235421809751254540594752243"
l[10] = "52584907711670556013604839586446706324415722155397"
l[11] = "53697817977846174064955149290862569321978468622482"
l[12] = "83972241375657056057490261407972968652414535100474"
l[13] = "82166370484403199890008895243450658541227588666881"
l[14] = "16427171479924442928230863465674813919123162824586"
l[15] = "17866458359124566529476545682848912883142607690042"
l[16] = "24219022671055626321111109370544217506941658960408"
l[17] = "07198403850962455444362981230987879927244284909188"
l[18] = "84580156166097919133875499200524063689912560717606"
l[19] = "05886116467109405077541002256983155200055935729725"
l[20] = "71636269561882670428252483600823257530420752963450"

num = join(l, "")
max = 0
for i in 1:length(num)-4
	prod5 = prod(int(split(num[i:i+4],"")))
	max = prod5 > max ? prod5 : max
end
println("P8=",max)


# P9 - Special Pythagorean triplet
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

# Answer: 31,875,000

max = 1000
for a in 1:ifloor(max/3)
	for b in a+1:ifloor(2max/3)
		c = max-a-b
		if c <= b break end
		if a^2+b^2==c^2
			println(a,"-",b,"-",c)
			println("P9=",prod([a,b,c]))
		end
	end
end




