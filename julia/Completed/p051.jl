
# P51 Prime digit replacements
# By replacing the 1st digit of the 2-digit number *3, it turns out that
# six of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
# 
# By replacing the 3rd and 4th digits of 56**3 with the same digit, this 
# 5-digit number is the first example having seven primes among the ten 
# generated numbers, yielding the family: 56003, 56113, 56333, 56443, 
# 56663, 56773, and 56993. Consequently 56003, being the first member 
# of this family, is the smallest prime with this property.
# 
# Find the smallest prime which, by replacing part of the number 
# (not necessarily adjacent digits) with the same digit, is part of 
# an eight prime value family.

function pattern(num, comb)
  pat = ""
  x = [parse(Int, num[c:c]) for c in comb]
  if all(x.==x[1])
    for i in 1:length(num)
      pat *= i in comb ? "*" : num[i:i]
    end
    return true, pat
  else
    return false, 0
  end
end

found = false
d = Dict()
for prime in primes(1000000)
  sprime = string(prime)
  for istar = 1:(length(sprime)-1)
    combs = combinations(collect(1:length(sprime)), istar)
    for c in combs
      valid, key = pattern(sprime, c)
      if valid
        haskey(d, key) ? push!(d[key], sprime) : d[key] = [sprime]
        if length(d[key]) == 8 found = true; break end
      end
    end
    if found break end
  end
  if found break end
end

tic()
min5 = 10^8
min6 = 10^8
min7 = 10^8
min8 = 10^8
key5 = 0
key6 = 0
key7 = 0
key8 = 0
for k in keys(d)
  if length(d[k]) == 5
    if parse(Int, d[k][1]) < min5 
      min5, key5 = parse(Int, d[k][1]), k 
    end
  end
  if length(d[k]) == 6
    if parse(Int, d[k][1]) < min6
      min6, key6 = parse(Int, d[k][1]), k 
    end
  end
  if length(d[k]) == 7 
    if parse(Int, d[k][1]) < min7 
      min7, key7 = parse(Int, d[k][1]), k 
    end
  end
  if length(d[k]) == 8 
    if parse(Int, d[k][1]) < min8 
      min8, key8 = parse(Int, d[k][1]), k 
    end
  end
end
toc()

println(key5, d[key5])
println(key6, d[key6])
println(key7, d[key7])
println(key8, d[key8])

# elapsed time: 1.093910593 seconds
# *1ASCIIString["11","31","41","61","71"]
# *3ASCIIString["13","23","43","53","73","83"]
# 56**3ASCIIString["56003","56113","56333","56443","56663","56773","56993"]
# *2*3*3ASCIIString["121313","222323","323333","424343","525353","626363","828383","929393"]
# [Finished in 33.8s]