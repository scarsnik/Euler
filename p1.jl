
# P1
sum = 0

for i in 1:999
	if i%3==0 || i%5==0
		sum += i
	end
end

println("P1=",sum)



# P2 - Even Fibonacci numbers
fib1 = 1
fib2 = 1
fibn = fib1 + fib2 
sum = fibn
while fibn < 4000000
	fib1 = fib2
	fib2 = fibn
	fibn = fib1 + fib2
	if fibn%2==0
		sum += fibn
	end
end

println("P2=",sum)


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





