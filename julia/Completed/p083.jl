# Path sum: four ways
# Problem 83
# NOTE: This problem is a significantly more challenging version of Problem 81.

# In the 5 by 5 matrix below, the minimal path sum from the top left to the 
# bottom right, by moving left, right, up, and down, is indicated in bold 
# red and is equal to 2297.

# 131 673  234  103 18
# 201 96   342  965 150
# 630 803  746  422 111
# 537 699  497  121 956
# 805 732  524  37  331

# Find the minimal path sum, in matrix.txt (right click and "Save Link/Target 
# As..."), a 31K text file containing a 80 by 80 matrix, from the top left to 
# the bottom right by moving left, right, up, and down.


# data = [131 673 234 103 18;
#         201 96  342 965 150;
#         630 803 746 422 111;
#         537 699 497 121 956;
#         805 732 524 37  331]

tic()

filename = homedir()*"\\OneDrive\\Euler\\data\\p082-matrix.txt"
data = readcsv(filename)

m, n = size(data)
A = copy(data)

for s=1:m*n
    B = copy(A)
    for i=1:m, j=1:n
        v = data[i,j]
        if i==1 && j==1
            A[i,j] = data[1,1]
        else
            t = i != 1 ? A[i-1,j] : Inf
            b = i != m ? A[i+1,j] : Inf
            l = j != 1 ? A[i,j-1] : Inf
            r = j != n ? A[i,j+1] : Inf
            A[i,j] = minimum([t, b, l, r]+v)
        end
    end
    # println(s)
    A == B && break
end

println(A[m,n])

toc()