# Concealed Square
# Problem 206
# 
# Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
# where each “_” is a single digit.


# THIS IS TOO SLOW!!!
tic()

a, b = BigInt(10)^9+30, BigInt(10)^9+70
for i=1:1000000000
  a += 100
  b += 100
  sa = string(a^2)[[1,3,5,7,9,11,13,15,17,19]]
  sb = string(b^2)[[1,3,5,7,9,11,13,15,17,19]]
  if sa == "1234567890"
    println("$a = $(a^2) = $sa")
  end

  if sb == "1234567890"
    println("$b = $(b^2) = $sb")
  end
end

toc()

