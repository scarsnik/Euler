# Arithmetic expressions
# Problem 93
# By using each of the digits from the set, {1, 2, 3, 4}, exactly once, and 
# making use of the four arithmetic operations (+, −, *, /) and brackets/
# parentheses, it is possible to form different positive integer targets.

# For example,
# 8 = (4 * (1 + 3)) / 2
# 14 = 4 * (3 + 1 / 2)
# 19 = 4 * (2 + 3) − 1
# 36 = 3 * 4 * (2 + 1)
# Note that concatenations of the digits, like 12 + 34, are not allowed.

# Using the set, {1, 2, 3, 4}, it is possible to obtain thirty-one different 
# target numbers of which 36 is the maximum, and each of the numbers 1 to 28 
# can be obtained before encountering the first non-expressible number.

# Find the set of four distinct digits, a < b < c < d, for which the longest 
# set of consecutive positive integers, 1 to n, can be obtained, giving your 
# answer as a string: abcd.

tic()
ops = ["+", "-", "*", "/"]
num = [1,2,3,4]
best = 0
bestn = 0

for num in combinations(digits(123456789), 4)
    mask = falses(4000)
    for op1 in ops, op2 in ops, op3 in ops
        for n in permutations(num)
            n1, n2, n3, n4 = n[1], n[2], n[3], n[4]
            trees = ["($n1 $op1 ($n2 $op2 ($n3 $op3 $n4)))",
                     "($n1 $op1 (($n2 $op2 $n3) $op3 $n4))",
                     "(($n1 $op1 $n2) $op2 ($n3 $op3 $n4))",
                     "(($n1 $op1 ($n2 $op2 $n3)) $op3 $n4)",
                     "((($n1 $op1 $n2) $op2 $n3) $op3 $n4)"]
            for t in trees
                exp = parse(t)
                res = eval(exp)
                if res > 0 && res % 1 == 0
                    mask[int(res)] = true
                end
            end
        end
    end

    result, i = 0, 1
    while mask[i]
        result, i = i, i+1
    end
    if result > best
        best = result
        bestn = num
    end
end

println(best)
println(bestn)
toc()

# 51
# [8,5,2,1]
# elapsed time: 210.169778205 seconds
# 210.169778205
