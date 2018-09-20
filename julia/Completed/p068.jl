# Magic 5-gon ring
# Problem 68

# Consider the following "magic" 3-gon ring, filled with the numbers 1 to 6, and 
# each line adding to nine.

# Working clockwise, and starting from the group of three with the numerically 
# lowest external node (4,3,2 in this example), each solution can be described 
# uniquely. For example, the above solution can be described by the set: 
# 4,3,2; 6,2,1; 5,1,3.

# It is possible to complete the ring with four different totals: 
# 9, 10, 11, and 12. There are eight solutions in total.

# Total   Solution Set
# 9   4,2,3; 5,3,1; 6,1,2
# 9   4,3,2; 6,2,1; 5,1,3
# 10  2,3,5; 4,5,1; 6,1,3
# 10  2,5,3; 6,3,1; 4,1,5
# 11  1,4,6; 3,6,2; 5,2,4
# 11  1,6,4; 5,4,2; 3,2,6
# 12  1,5,6; 2,6,4; 3,4,5
# 12  1,6,5; 3,5,4; 2,4,6

# By concatenating each group it is possible to form 9-digit strings; the 
# maximum string for a 3-gon ring is 432621513.

# Using the numbers 1 to 10, and depending on arrangements, it is possible to 
# form 16- and 17-digit strings. What is the maximum 16-digit string for 
# a "magic" 5-gon ring?

size = 5
sets = [1 0 0 0 0 1 1 0 0 0;
        0 1 0 0 0 0 1 1 0 0;
        0 0 1 0 0 0 0 1 1 0;
        0 0 0 1 0 0 0 0 1 1;
        0 0 0 0 1 1 0 0 0 1]

count = 0
rings = Any[]
total = Any[]
for perms in permutations(1:2*size)
    sums = sets * perms
    if all(sums .== sums[1])
    # if all(sums .== 9)
        count += 1
        push!(rings, perms)
        push!(total, sums[1])
        # println("$perms = $sums")
    end
end

println(count)

[6,7,8,9,10,3,5,2,4,1],14
[6,10,9,8,7,5,3,1,4,2],14
[2,4,6,8,10,5,9,3,7,1],16
[2,5,8,6,9,4,10,1,7,3],16
[2,9,6,8,5,10,4,3,7,1],16
[2,10,8,6,4,9,5,1,7,3],16
[1,3,5,7,9,6,10,4,8,2],17
[1,9,7,5,3,10,6,2,8,4],17
[2,5,3,6,9,7,8,4,10,1],17
[2,9,6,3,5,8,7,1,10,4],17
[1,2,3,4,5,8,10,7,9,6],19
[1,5,4,3,2,10,8,6,9,7],19

[6,7,8,9,10, 3,5,2,4,1],14

635 752 824 941 1013

[6,10,9,8,7, 5,3,1,4,2],14

--- 6531031914842725