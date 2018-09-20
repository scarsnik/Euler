function nextPalindrome(n::Int)
    # returns the next palindromic number that is greater than n
    num = string(n)
    len = length(num)
    odd = len % 2 != 0
    lef = num[1:len/2]
    mid = string(num[iceil(len/2)])

    if odd
        inc = 10^ifloor(len/2)
        nex = int(lef*mid*reverse(lef))
    else
        inc = int(1.1*10^ifloor(len/2))
        nex = int(lef*reverse(lef))
    end

    nex > n    && return nex
    mid != "9" && return nex + inc

    inc = 10^(ifloor(len/2)+1)
    roundup = (ifloor(n/inc)+1)*inc
    mid == "9" && return nextPalindrome(roundup)
end

function nextHigher(n::Int)
    # returns the next higher number using the same digits
    num = string(n)
    len = length(num)
    for i in len-1:-1:1
        current = num[i]
        right = num[i+1]
        if current < right
            temp = sort(collect(num[i+1:end]))
            return int(num[1:i-1]*string(temp[1])*num[i:i]*join(temp[2:end]))
        end
    end
    return n
end

