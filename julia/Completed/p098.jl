# Anagramic squares
# Problem 98

# By replacing each of the letters in the word CARE with 1, 2, 9, and 6 
# respectively, we form a square number: 1296 = 36^2. What is remarkable is 
# that, by using the same digital substitutions, the anagram, RACE, also 
# forms a square number: 9216 = 96^2. We shall call CARE (and RACE) a square 
# anagram word pair and specify further that leading zeroes are not permitted, 
# neither may a different letter have the same digital value as another letter.

# Using words.txt (right click and 'Save Link/Target As...'), a 16K text file 
# containing nearly two-thousand common English words, find all the square 
# anagram word pairs (a palindromic word is NOT considered to be an anagram 
# of itself).

# What is the largest square number formed by any member of such a pair?
# NOTE: All anagrams formed must be contained in the given text file.

function anagrams(data)
    output = Any[]
    visited = Any[]

    # Sort the individual digits/characters
    list = map(f->join(sort(split(string(f), ""))), data)

    for val in list
        if !(val in visited)
            found = find(f->f==val, list)
            if length(found) > 1
                for ids in found
                    push!(visited, list[ids])
                end
                for c in combinations(found, 2)
                    push!(output, data[c])
                end
            end
        end
    end

    return output
end


tic()

filename = homedir()*"\\OneDrive\\Euler\\data\\p098_words.txt"
data = readcsv(filename)
sq   = {d=>[iceil(sqrt(10^(d-1))):ifloor(sqrt((10^d)-1))].^2 
         for d=2:9}

answer = 0

# Get the anagrams of words and squares
words = anagrams(data)
nums  = {d=>anagrams(sq[d]) for d in [2:6]}

# Go through the list of words
for w in words
    d = length(w[1])

    if d <= 5
        w1 = split(w[1], "")
        w2 = split(w[2], "")

        for n in nums[d]
            # println("$w $n")
            d1 = reverse(digits(n[1]))
            d2 = reverse(digits(n[2]))

            if length(unique(w1)) == length(unique(d1)) == length(unique(zip(w1,w2)))

                x1 = sort(collect(zip(w1,d1)), by=f->f[1])
                x2 = sort(collect(zip(w2,d2)), by=f->f[1])

                if x1 == x2
                    # println(w)
                    # println(n)
                    if maximum(n) > answer
                        println(w)
                        println(n)
                        answer = maximum(n)
                    end
                end
            end
        end
    end
end

toc()
