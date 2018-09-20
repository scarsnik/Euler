# P82 Path sum: three ways
# The minimal path sum in the 5 by 5 matrix below, by starting in any cell in the 
# left column and finishing in any cell in the right column, and only moving up, 
# down, and right, is indicated in red and bold; the sum is equal to 994.

# 131 673  234  103 18
# 201 96   342  965 150
# 630 803  746  422 111
# 537 699  497  121 956
# 805 732  524  37  331

# Find the minimal path sum, in matrix.txt, a 31K text file containing a 
# 80 by 80 matrix, from the left column to the right column.

data = [131 673 234 103 18;
        201 96  342 965 150;
        630 803 746 422 111;
        537 699 497 121 956;
        805 732 524 37  331]

tic()

filename = homedir()*"\\OneDrive\\Euler\\data\\p082-matrix.txt"
data = readcsv(filename)

m, n = size(data)
A = copy(data)
for s=1:m*n
    B = copy(A)
    for i=1:m, j=1:n
        v = data[i,j]
        if j==1
            A[i,j] = data[i,1]
        else
            t = i != 1 ? A[i-1,j] : Inf
            b = i != m ? A[i+1,j] : Inf
            l = j != 1 ? A[i,j-1] : Inf
            A[i,j] = minimum([t, b, l]+v)
        end
    end
    # println(s)
    A == B && break
end

println(minimum(A[:,n]))

toc()