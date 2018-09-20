# Passcode derivation
# Problem 79
# A common security method used for online banking is to ask the user for 
# three random characters from a passcode. For example, if the passcode 
# was 531278, they may ask for the 2nd, 3rd, and 5th characters; the 
# expected reply would be: 317.

# The text file, keylog.txt, contains fifty successful login attempts.

# Given that the three characters are always asked for in order, analyse 
# the file so as to determine the shortest possible secret passcode of 
# unknown length.


file = "p079_keylog.txt"
filename = homedir()*"\\OneDrive\\Euler\\data\\"*file
data = readcsv(filename, Int)

digits = Set()
for i in data
    union!(digits, split(string(i),""))
end
println(digits)


319
680
319680
180
690
316980
129
3126980
620
3162980
762
31762980
689
31762890
318
368
710
37162890
720
710
629
168
160
689
716
731
73162890
736
729
316
729
729
710
769
290
719
680
318
389
162
289
162
718
729
319
790
680
890
362
319
760
316
729
380
319
728
716
