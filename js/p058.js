"use strict";
var tools = require("./util/tools.js"),
	isPrime = tools.isPrime;
/*
 * Spiral primes
 * Problem 58
 * Starting with 1 and spiralling anticlockwise in the following way, a square 
 * spiral with side length 7 is formed.
 * 
 * 37 36 35 34 33 32 31
 * 38 17 16 15 14 13 30
 * 39 18  5  4  3 12 29
 * 40 19  6  1  2 11 28
 * 41 20  7  8  9 10 27
 * 42 21 22 23 24 25 26
 * 43 44 45 46 47 48 49
 * 
 * It is interesting to note that the odd squares lie along the bottom right 
 * diagonal, but what is more interesting is that 8 out of the 13 numbers lying 
 * along both diagonals are prime; that is, a ratio of 8/13 ≈ 62%.
 * 
 * If one complete new layer is wrapped around the spiral above, a square spiral 
 * with side length 9 will be formed. If this process is continued, what is the 
 * side length of the square spiral for which the ratio of primes along both 
 * diagonals first falls below 10%?
 * 
 * Answer: 26241
 */

function init() 
{
	var s = 0,				 // count of primes found
        d = 0,               // count of diagonals
        i = 1,               // iterate layers
        j = 0,               // iterate corners
        c = 0;               // corner numbers

    while (true)
    {
        d = diagonals(i);
        c = corners(i);

        for (j=0; j<4; j++)
        {
            if (isPrime(c[j]))
            {
                s += 1;
            }
        }
        
        if (s/d < 0.1)
        {
            break;
        }

        i++
    }

    return 2 * i + 1;
}

function corners(layer)
{
	// returns the four corner values for a particular layer
	var d1 = (2 * layer + 1) * (2 * layer + 1);    // south east
    var d2 = d1 - (2 * layer);                     // south west
    var d3 = d2 - (2 * layer);                     // north west
    var d4 = d3 - (2 * layer);                     // north east
    return [d1, d2, d3, d4];
}

function diagonals(layer)
{
    return 4 * layer + 1;
}

module.exports.init = init;
