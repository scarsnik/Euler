# Prime generating integers
# Problem 357

# Consider the divisors of 30: 1,2,3,5,6,10,15,30.
# It can be seen that for every divisor d of 30, d+30/d is prime.

# Find the sum of all positive integers n not exceeding 100,000,000
# such that for every divisor d of n, d+n/d is prime.

function divisors{T<:Integer}(n::T)
	f = factor(n)
	divs = T[one(T)]
	for (p, r) in f
		tmp = T[]
		for d in divs, e in 0:r
			push!(tmp, d*p^e)
		end
		divs = copy(tmp)
	end
	return sort!(divs)
end

function f(n)
	d = divisors(n)
	return n./d+d
end

tic()

lo, hi = 4, 10^8
primeList = Set(primes(hi))

count = 3   # 1 and 2 are true
numbers = filter(n->!(n in primeList) && n%4!=0 && sqrt(n)%1 !=0, [lo:2:hi])

for n in numbers
	divs = divisors(n)
	allPrime = true
	for d in int(n./divs+divs)
		if !isprime(d)
			allPrime = false
			break
		end
	end
	if allPrime count += n end
end

println("Running divisors for $lo to $hi: $(toq()) seconds \n$count")

# 10^6 = 524402305
# 10^7 = 27814470277
# 10^8 = 1739023853137 = 213 seconds - NEED TO IMPROVE