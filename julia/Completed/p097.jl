# Large non-Mersenne prime
# Problem 97

# The first known prime found to exceed one million digits was discovered in
# 1999, and is a Mersenne prime of the form (2^6972593)−1; it contains exactly 
# 2,098,960 digits. Subsequently other Mersenne primes, of the form (2^p)−1, 
# have been found which contain more digits.

# However, in 2004 there was found a massive non-Mersenne prime which contains 
# 2,357,207 digits: 28433×(2^7830457)+1.
	
# Find the last ten digits of this prime number.
# http://www.exploringbinary.com/how-to-find-the-last-digits-of-a-positive-power-of-two/

n, m = 7830457, 10
# n, m = 2009, 2
a = [2^x for x=find(x->x==1, digits(n, 2))-1]

powers = {BigInt(1)=>2}
for i = 1:25
	powers[BigInt(2^i)] = BigInt(powers[2^(i-1)]^2 % 10^m)
end

# [powers[i] for i in a]
last10 = prod([powers[i] for i in a]) % 10^m

28433*last10+1

8739992577