# P60 Prime pair sets
# 
# The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes 
# and concatenating them in any order the result will always be prime. 
# 
# For example, taking 7 and 109, both 7109 and 1097 are prime. The sum of
# these four primes, 792, represents the lowest sum for a set of four primes 
# with this property.
# 
# Find the lowest sum for a set of five primes for which any two primes 
# concatenate to produce another prime.

function makepairs(a, ps)
  pairs = Int[]
  for b = a+1:length(ps)
    p1 = string(ps[a])
    p2 = string(ps[b])
    ip1 = int(p1*p2)
    ip2 = int(p2*p1)
    if isprime(ip1) && isprime(ip2)
      push!(pairs, ps[b])
    end
  end
  return pairs
end

tic()

result = 10^8
primelimit = 9000
ps = primes(primelimit)
pairs = Dict()
for a in 1:length(ps)
  if !haskey(pairs, a) pairs[a] = makepairs(a, ps) end
  for b = a+1:length(ps)
    if !(ps[b] in pairs[a]) continue end
    if !haskey(pairs, b) pairs[b] = makepairs(b, ps) end
    for c = b+1:length(ps)
      if !(ps[c] in pairs[a]) ||
         !(ps[c] in pairs[b]) continue end
      if !haskey(pairs, c) pairs[c] = makepairs(c, ps) end
      for d = c+1:length(ps)
        if !(ps[d] in pairs[a]) ||
           !(ps[d] in pairs[b]) ||
           !(ps[d] in pairs[c]) continue end
        if !haskey(pairs, d) pairs[d] = makepairs(d, ps) end
        for e = d+1:length(ps)
          if !(ps[e] in pairs[a]) ||
             !(ps[e] in pairs[b]) ||
             !(ps[e] in pairs[c]) || 
             !(ps[e] in pairs[d]) continue end
      
          if result > ps[a] + ps[b] + ps[c] + ps[d] + ps[e]
            result = ps[a] + ps[b] + ps[c] + ps[d] + ps[e]
            println(ps[a], "+", ps[b], "+", ps[c], "+", ps[d], "+", ps[e], "=", result)
          end
        end
      end
    end
  end
end
