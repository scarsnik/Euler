# Counting rectangles
# Problem 85
# By counting carefully it can be seen that a rectangular grid measuring 3 by 2 
# contains eighteen rectangles:

# Although there exists no rectangular grid that contains exactly two million 
# rectangles, find the area of the grid with the nearest solution.

function rectangles(r::Int, c::Int)
    return int(r*(r+1)*c*(c+1)/4)
end


