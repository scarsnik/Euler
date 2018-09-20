# Dice Game
# Problem 205
# Peter has nine four-sided (pyramidal) dice, each with faces numbered 1, 2, 3, 4.
# Colin has six six-sided (cubic) dice, each with faces numbered 1, 2, 3, 4, 5, 6.

# Peter and Colin roll their dice and compare totals: the highest total wins. 
# The result is a draw if the totals are equal.

# What is the probability that Pyramidal Pete beats Cubic Colin? Give your 
# answer rounded to seven decimal places in the form 0.abcdefg

tic()

d4 = [sum([a,b,c,d,e,f,g,h,i]) for a=1:4, b=1:4, c=1:4, d=1:4, e=1:4, f=1:4, g=1:4, h=1:4, i=1:4][:]
d6 = [sum([a,b,c,d,e,f]) for a=1:6, b=1:6, c=1:6, d=1:6, e=1:6, f=1:6][:]
peter = {p=>length(filter(x->x==p, d4)) for p in Set(d4)}
colin = {c=>length(filter(x->x==c, d6)) for c in Set(d6)}
total = length(d4) * length(d6)
peterWins = sum([c[1] < p[1] ? c[2]*p[2] : 0 for c in colin, p in peter][:])
println("Answer: ", peterWins / total)
println("Answer (Rounded): ", round(peterWins / total,7))

toc()

# 0.3560898 533785659
