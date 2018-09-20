# Roman numerals
# Problem 89
# For a number written in Roman numerals to be considered valid there are basic 
# rules which must be followed. Even though the rules allow some numbers to be 
# expressed in more than one way there is always a "best" way of writing 
# a particular number.

# For example, it would appear that there are at least six ways of writing 
# the number sixteen:

# IIIIIIIIIIIIIIII
# VIIIIIIIIIII
# VVIIIIII
# XIIIIII
# VVVI
# XVI

# However, according to the rules only XIIIIII and XVI are valid, and the last
# example is considered to be the most efficient, as it uses the least number 
# of numerals.

# The 11K text file, roman.txt (right click and 'Save Link/Target As...'), 
# contains one thousand numbers written in valid, but not necessarily 
# minimal, Roman numerals; see About... Roman Numerals for the definitive 
# rules for this problem.

# Find the number of characters saved by writing each of these in their 
# minimal form.

# Note: You can assume that all the Roman numerals in the file contain no
# more than four consecutive identical units.

function intToRoman(x)
    function roman(r, n, d)
        n2r = {4=>"IV", 9=>"IX", 40=>"XL", 90=>"XC", 400=>"CD", 900=>"CM",
            1=>"I", 5=>"V", 10=>"X", 50=>"L", 100=>"C", 500=>"D", 1000=>"M"}
        
        m = ifloor(n/d)
        if d == 1000
            r = m != 0 ? "M"^m : ""
        else        
            if m >= 9
                r *= n2r[9*d]
            elseif m >= 5
                r *= n2r[5*d] * n2r[d]^(m-5)
            elseif m >= 4
                r *= n2r[4*d]
            else
                r *= n2r[d]^m
            end
        end
        n -= m*d
        return r, n
    end
    
    r, n = "", x
    for i = 10.^(3:-1:0)
        r, n = roman(r, n, i)
    end
    return r
end

function romanToInt(x)
    s2n = {"IV"=>4, "IX"=>9, "XL"=>40, "XC"=>90, "CD"=>400, "CM"=>900}
    r2n = {"I"=>1, "V"=>5, "X"=>10, "L"=>50, "C"=>100, "D"=>500, "M"=>1000}
    
    n, i = 0, 1
    size = length(x)
    if size > 1
        while true
            if haskey(s2n, x[i:i+1])
                n += s2n[x[i:i+1]]
                i += 1
            else
                n += r2n[string(x[i])]
            end

            if i == size-1
                n += r2n[string(x[i+1])]
            end
            
            i+=1
            if i >= size
                break
            end
        end
    else
        n = r2n[x]
    end
    return n
end

filename = homedir()*"\\OneDrive\\Euler\\data\\p089_roman.txt"
data = readcsv(filename)

sum = 0
for i = 1:1000
    n = romanToInt(data[i])
    r = intToRoman(n)
    sum += length(data[i])-length(r)
end

println(sum)



