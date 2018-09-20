include("util.jl")
# Nim
# Problem 301
# Nim is a game played with heaps of stones, where two players take it in turn 
# to remove any number of stones from any heap until no stones remain.

# We'll consider the three-heap normal-play version of Nim, which works as follows:
# - At the start of the game there are three heaps of stones.
# - On his turn the player removes any positive number of stones from any single heap.
# - The first player unable to move (because no stones remain) loses.

# If (n_1,n_2,n_3) indicates a Nim position consisting of heaps of size n_1, n_2
# and n_3 then there is a simple function X(n_1,n_2,n_3) — that you may look up 
# or attempt to deduce for yourself — that returns:

# zero if, with perfect strategy, the player about to move will eventually lose; or
# non-zero if, with perfect strategy, the player about to move will eventually win.
# For example X(1,2,3) = 0 because, no matter what the current player does, his 
# opponent can respond with a move that leaves two heaps of equal size, at which 
# point every move by the current player can be mirrored by his opponent until 
# no stones remain; so the current player loses. To illustrate:
# - current player moves to (1,2,1)
# - opponent moves to (1,0,1)
# - current player moves to (0,0,1)
# - opponent moves to (0,0,0), and so wins.

# For how many positive integers n ≤ 2^30 does X(n,2n,3n) = 0 ?

function prn(n)
    a, b, c = 1n, 2n, 3n
    println("$a, $b, $c = $(nim(n))")
    println(bits(a))
    println(bits(b))
    println(bits(c))
end

function nim(n)
    # prnbits(n)
	return 1n $ 2n $ 3n
end

c = 0
e = 1
n = 0
while true
    n+=1
	c += nim(n) == 0 ? 1 : 0

    if n % 2^e == 0
        println("$c/$n ($e) = $(c/n)")
        e += 1
    end
    n==10^6 && break
end

# Noticed that the numbers were fibonacci
# so it is just
println(fib(32))





