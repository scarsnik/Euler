# Arranged probability
# Problem 100
# If a box contains twenty-one coloured discs, composed of fifteen blue discs 
# and six red discs, and two discs were taken at random, it can be seen that 
# the probability of taking two blue discs, P(BB) = (15/21)×(14/20) = 1/2.

# The next such arrangement, for which there is exactly 50% chance of taking 
# two blue discs at random, is a box containing eighty-five blue discs and 
# thirty-five red discs.

# By finding the first arrangement to contain over 10^12 = 1,000,000,000,000 
# discs in total, determine the number of blue discs that the box would contain.

# http://www.alpertron.com.ar/METHODS.HTM#Hyperb

disc(b::BigFloat) = (1+sqrt(1+4(2b*b-2b)))/2
blue(n::BigFloat) = (1+sqrt(1+2n*(n-1)))/2
check(n::BigFloat, b::BigFloat) = b/n*(b-1)/(n-1) == 1/2

tic()

data = [
            1             1
            4             3
           21            15
          120            85
          697           493
         4060          2871
        23661         16731
       137904         97513
       803761        568345
      4684660       3312555
     27304197      19306983
    159140520     112529341
   5406093004    3822685023
 183648021600  129858761425
1070379110497  756872327473  <-- here


6238626641380 4411375203411]

d1 = data[:,1][1:end-1]
d2 = data[:,2][2:end]

# n, i = 27304197, 1
n, i = 21, 1
n, i = 183648021600, 1
while n < 10^13
    nextb = round(big(n*4.121320286401391))
    interval = 100000
    # interval = nextb*0.001
    for b=BigFloat(nextb)-interval:BigFloat(nextb)+interval
        n = disc(b)
        if n % 1 == 0
            n = round(n)
            println("$i = $n, $b, $(check(n, b)), $(int(nextb-b))")
            break
        end
    end
    i += 1
end


toc()

