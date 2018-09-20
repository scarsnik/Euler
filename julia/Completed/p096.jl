# Su Doku
# Problem 96

# By solving all fifty puzzles find the sum of the 3-digit numbers found in 
# the top left corner of each solution grid; for example, 483 is the 3-digit 
# number found in the top left corner of the solution grid above.

## Solve Every Sudoku Puzzle
## See http://norvig.com/sudoku.html
## Throughout this program we have:
##   r is a row,    e.g. 'A'
##   c is a column, e.g. '3'
##   s is a square, e.g. 'A3'
##   d is a digit,  e.g. '9'
##   u is a unit,   e.g. ['A1','B1','C1','D1','E1','F1','G1','H1','I1']
##   grid is a grid,e.g. 81 non-blank chars, e.g. starting with '.18...7...
##   values is a dict of possible values, e.g. {'A1':'12349', 'A2':'8', ...}

function x(A, B)
    "Cross product of elements in A and elements in B."

    m = [string(a)*string(b) for a in A, b in B]
    return reduce(hcat, [m[i,:] for i=1:size(m, 1)])[:]
end

digits   = "123456789"
rows     = "ABCDEFGHI"
cols     = digits
squares  = x(rows, cols)
unitlist = vcat([x(rows, c) for c in cols], 
                [x(r, cols) for r in rows], 
                [x(rs, cs) for rs in ["ABC","DEF","GHI"], cs in ["123","456","789"]][:])

units = {s=>[u for u in filter(x->s in x, unitlist)] 
        for s in squares}
peers = {s=>setdiff(Set([x for x in reduce(union, units[s])]), Set([s])) 
        for s in squares}


################ Parse a Grid ################

function parseGrid(grid)
    # Convert grid to a dict of possible values, {square: digits}, or
    # return False if a contradiction is detected.

    ## To start, every square can be any digit; then assign values from the grid.
    values = {s=>digits for s in squares}
    for sd in gridValues(grid)
        s, d = sd[1], sd[2]
        if contains(digits, d) && assign(values, s, d) == false
            return false
        end
    end
    return values
end

function gridValues(grid)
    # Convert grid into a dict of {square: char} with '0' or '.' for empties.
    chars = [string(c) for c in filter(x->x in digits || x in ".0", grid)]
    @assert(length(chars) == 81)
    return Dict(squares, chars)
end


################ Constraint Propagation ################


function assign(values, s, d)
    # Eliminate all the other values (except d) from values[s] and propagate.
    # Return values, except return False if a contradiction is detected.

    otherValues = replace(values[s], d, "")
    if all([eliminate(values, s, string(d2)) for d2 in otherValues] .!= false)
        return values
    else
        return false
    end
end

function eliminate(values, s, d)
    # Eliminate d from values[s]; propagate when values or places <= 2.
    # Return values, except return False if a contradiction is detected.

    if !contains(values[s], d)
        return values # Already eliminated
    end

    values[s] = replace(values[s], d, "")
    ## (1) If a square s is reduced to one value d2, then eliminate d2 from the peers.
    if length(values[s]) == 0
        return false ## Contradiction: removed last value
    elseif length(values[s]) == 1
        d2 = values[s]
        if any([eliminate(values, s2, string(d2)) for s2 in peers[s]] .== false)
            return false
        end
    end

    ## (2) If a unit u is reduced to only one place for a value d, then put it there.
    for u in units[s]
        dplaces = filter(x->x!="", [contains(values[s], d) ? s : "" for s in u])
        if length(dplaces) == 0
            return false ## Contradiction: no place for this value
        elseif length(dplaces) == 1
            if assign(values, dplaces[1], d) == false
                return false
            end
        end
    end
    return values
end

################ Display as 2-D grid ################

function center(str, width, fillchar=" ")
    n = width - length(str)
    n < 0 ? error("width can't be less than string length") : 
        fillchar^iceil(n/2) * str * fillchar^ifloor(n/2)
end

function display(values)
    # Display these values as a 2-D grid.
    width = 1+maximum([length(values[s]) for s in squares])
    line = join(repmat(["-"^(width*3)], 3), "+")
    for r in rows
        for c in cols
            print(center(values[string(r)*string(c)], width))
            print(c in "36" ? "|" : "")
        end
        println()
        print(r in "CF" ? line*"\n" : "")
    end
    println()
end


################ Search ################

function solve(grid)
    return search(parseGrid(grid))
end

function search(values)
    # Using depth-first search and propagation, try all possible values.
    if values == false
        return false # Failed earlier
    end

    if all([length(values[s]) == 1 for s in squares])
        return values # Solved
    end

    n, s = minimum([(length(values[s]), s) for s in filter(x->length(values[x]) > 1, squares)])
    # display(values)
    # return n, s
    return some([search(assign(copy(values), s, d)) for d in values[s]])
end

function some(seq)
    for e in seq
        if e != false
            return e
        end
    end
    return false
end


################ Read in sudoku puzzles ################

function grid(i)
    file = homedir()*"\\OneDrive\\Euler\\data\\p096_sudoku.txt"
    data = readcsv(file, String)
    return join(data[i*10-8:i*10])
end

tic()
    sum = 0
    for i=1:50
        # display(gridValues(grid(i)))
        g = solve(grid(i))
        # display(g)
        sum += int(g["A1"]*g["A2"]*g["A3"])
    end
    println(sum)
toc()

