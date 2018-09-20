# Digital root clocks
# Problem 315
# 
# https://projecteuler.net/problem=315
# The two clocks are fed all the prime numbers between A = 10^7 and B = 2×10^7. 
# Find the difference between the total number of transitions needed by Sam's 
# clock and that needed by Max's one.

################################
#
#     COSTS FOR DIGITS
#
################################
DIGITS = {0=>[1,1,1,0,1,1,1],
          1=>[0,0,1,0,0,0,1],
          2=>[0,1,1,1,1,1,0],
          3=>[0,1,1,1,0,1,1],
          4=>[1,0,1,1,0,0,1],
          5=>[1,1,0,1,0,1,1],
          6=>[1,1,0,1,1,1,1],
          7=>[1,1,1,0,0,0,1],
          8=>[1,1,1,1,1,1,1],
          9=>[1,1,1,1,0,1,1]}

DIGIT_COSTS = {x=>sum(DIGITS[x]) for x=0:9}
DIGIT_CHANGE = {(x,y)=>sum(abs(DIGITS[x]-DIGITS[y])) for x=0:9, y=0:9}

################################
#
#     SAM'S CLOCK
#
################################

function samNext(x::Int)
    # Returns: the next digital root (i.e. the sum of the digits of x)
    #          the cost of the transition
    y, c = 0, 0
    while x > 0
        y += x % 10
        c += 2DIGIT_COSTS[x % 10]
        x = ifloor(x/10)
    end
    return y, c
end

function samCost(x::Int)
    cost = 0
    while x > 9
        x, c = samNext(x)
        cost += c
    end
    return cost + 2DIGIT_COSTS[x]
end

################################
#
#     MAX'S CLOCK
#
################################

function nextNum(x::Int)
    # Returns the next digital root (i.e. the sum of the digits of x)
    y = 0
    while x > 0
        y += x % 10
        x = ifloor(x/10)
    end
    return y
end

function costNum(x::Int)
    c = 0
    while x > 0
        c += DIGIT_COSTS[x % 10]
        x = ifloor(x/10)
    end
    return c 
end

function maxNext(x::Int)
    next = nextNum(x) 
    y, c = next, 0
    while x > 0 || y > 0
        a = x % 10
        b = y % 10
        c += y > 0 ? DIGIT_CHANGE[a,b] : DIGIT_COSTS[a]
        x = ifloor(x/10)
        y = ifloor(y/10)
    end

    # cost += 2DIGIT_COSTS[n % 10]
    return next, c
end

function maxCost(x::Int)
    sumCost = costNum(x)
    while x > 9
        x, cost = maxNext(x)
        sumCost += cost
    end
    return sumCost + costNum(x)
end



################################
#
#     RUN IT
#
################################


tic()

primeNums = filter(x -> x >= 10^7, primes(2*10^7))
sumSamCost = 0
sumMaxCost = 0
for p in primeNums
    sumSamCost += samCost(p)
    sumMaxCost += maxCost(p)
end
println(sumSamCost-sumMaxCost)

toc()




