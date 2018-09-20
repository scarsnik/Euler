# Matrix Sum
# Problem 345

# We define the Matrix Sum of a matrix as the maximum sum of matrix elements 
# with each element being the only one in his row and column. For example, the 
# Matrix Sum of the matrix below equals 3315 ( = 863 + 383 + 343 + 959 + 767):

#   7  53 183 439 863
# 497 383 563  79 973
# 287  63 343 169 583
# 627 343 773 959 943
# 767 473 103 699 303

# Find the Matrix Sum of:
#   7  53 183 439 863 497 383 563  79 973 287  63 343 169 583
# 627 343 773 959 943 767 473 103 699 303 957 703 583 639 913
# 447 283 463  29  23 487 463 993 119 883 327 493 423 159 743
# 217 623   3 399 853 407 103 983  89 463 290 516 212 462 350
# 960 376 682 962 300 780 486 502 912 800 250 346 172 812 350
# 870 456 192 162 593 473 915  45 989 873 823 965 425 329 803
# 973 965 905 919 133 673 665 235 509 613 673 815 165 992 326
# 322 148 972 962 286 255 941 541 265 323 925 281 601  95 973
# 445 721  11 525 473  65 511 164 138 672  18 428 154 448 848
# 414 456 310 312 798 104 566 520 302 248 694 976 430 392 198
# 184 829 373 181 631 101 969 613 840 740 778 458 284 760 390
# 821 461 843 513  17 901 711 993 293 157 274  94 192 156 574
#  34 124   4 878 450 476 712 914 838 669 875 299 823 329 699
# 815 559 813 459 522 788 168 586 966 232 308 833 251 631 107
# 813 883 451 509 615  77 281 613 459 205 380 274 302  35 805

function hungarian(A, min=true)
    # Given a square matrix, finds the unique assignment of cells where
    # the sum is a minimum (maximum). The cells must sit in their own 
    # row and column.
    m, n = size(A)
    m == n || error("Hungarian algorithm requires a square matrix.")

    # Step 0:
    # If trying to find a maximum assignment
    # The costs are subtracted from the max cost
    B = !min ? maximum(A) - A : A

    # Step 1: Subtract the min from each row
    B .-= minimum(B, 2) 

    # Step 2: Subtract the min from each col
    B .-= minimum(B, 1)

    lines = 0
    rows = 0
    cols = 0
    choices = 0
    while true
        # Step 3: Cover all zeros with the minimum number of lines
        choices, lines, rows, cols = minLines(B)
        lines == m && break

        # Step 4: Create additional zeros
        createZeros!(B, rows, cols)
    end

    out = zeros(Int, m, n)
    col = findNext(B)
    for i=1:m
        out[i, col[i]] = A[i, col[i]]
    end

    return out
end

function findNext(A, row=1, path=Any[])
    m = size(A, 2)
    row > m && return path

    for c in findin(A[row, :], 0)
        if !(c in path)
            path = findNext(A, row+1, push!(path, c))
            if length(path) < m 
                pop!(path)
            end
        end
    end
    return path
end

function independentZeros(A)
    # Selects an independent matrix (boolean) of zeros
    m = size(A, 1)
    B = falses(m, m)
    usedCols = Int[]
    for i=1:m
        j = 1
        while true
            j = findnext(A[i, :], 0, j)
            j == 0 && break
            if !(j in usedCols)
                B[i, j] = true
                push!(usedCols, j)
                break
            end
            j += 1
        end
    end
    return B
end

function minLines(A)
    
    # Matrix that contains our choices
    B = independentZeros(A)

    # Mark all rows that do not have a choice
    rowMarks = Int[]
    colMarks = Int[]
    newRowMarks = find(!any(B, 2))
    reduce(push!, rowMarks, newRowMarks)
    
    # If all rows have a choice then finish 
    if length(rowMarks) > 0
        while true
            # find all the columns which are not already marked
            # which have ZEROS in marked rows
            newColMarks = Int[]
            for i in newRowMarks
                newColMarks = vcat(newColMarks, findin(A[i, :], 0))
            end
            newColMarks = setdiff(newColMarks, colMarks)

            # If there are no new column marks then finish
            length(newColMarks) == 0 && break

            # Add new marks to the column marks
            reduce(push!, colMarks, newColMarks)

            # find all the rows which are not already marked
            # which have CHOICES in new marked columns
            newRowMarks = Int[]
            for i in newColMarks
                newRowMarks = vcat(newRowMarks, findin(B[:, i], true))
            end
            newRowMarks = setdiff(newRowMarks, rowMarks)

            # If there are no new row marks then finish
            length(newRowMarks) == 0 && break
            
            # Add new marks to the row marks
            reduce(push!, rowMarks, newRowMarks)
        end
    end

    rows  = setdiff(1:size(A,1), rowMarks)
    cols  = colMarks
    lines = length(rows) + length(cols)

    return B, lines, rows, cols
end

function createZeros!(A, rows, cols)
    # Find the smallest element that is not covered by a line. 
    # Subtract k from all uncovered elements, and add k to all 
    # elements that are covered twice.
    m = size(A, 1)
    otherRows = setdiff(1:m, rows)
    otherCols = setdiff(1:m, cols)

    min = minimum(A[otherRows, otherCols])
    A[rows, cols] += min
    A[otherRows, otherCols] -= min
    return A
end

data1 = [ 7  53 183 439 863 497 383 563  79 973 287  63 343 169 583;
        627 343 773 959 943 767 473 103 699 303 957 703 583 639 913;
        447 283 463  29  23 487 463 993 119 883 327 493 423 159 743;
        217 623   3 399 853 407 103 983  89 463 290 516 212 462 350;
        960 376 682 962 300 780 486 502 912 800 250 346 172 812 350;
        870 456 192 162 593 473 915  45 989 873 823 965 425 329 803;
        973 965 905 919 133 673 665 235 509 613 673 815 165 992 326;
        322 148 972 962 286 255 941 541 265 323 925 281 601  95 973;
        445 721  11 525 473  65 511 164 138 672  18 428 154 448 848;
        414 456 310 312 798 104 566 520 302 248 694 976 430 392 198;
        184 829 373 181 631 101 969 613 840 740 778 458 284 760 390;
        821 461 843 513  17 901 711 993 293 157 274  94 192 156 574;
         34 124   4 878 450 476 712 914 838 669 875 299 823 329 699;
        815 559 813 459 522 788 168 586 966 232 308 833 251 631 107;
        813 883 451 509 615  77 281 613 459 205 380 274 302  35 805]


data2 = [  7  53 183 439 863;
        497 383 563  79 973;
        287  63 343 169 583;
        627 343 773 959 943;
        767 473 103 699 303]

data3 = [2 9 2 7 1;
        6 8 7 6 1;
        4 6 5 3 1;
        4 2 7 3 1;
        5 3 9 5 1]


data4 = [0 6 4 3;
         3 2 1 2; 
         0 7 6 4;
         3 8 5 3]


answer = hungarian(data1, false)
sum(answer)