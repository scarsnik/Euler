"use strict";
var properDivisors = require("./util/tools").properDivisors;
/*
 * Amicable numbers
 * Problem 21
 * Let d(n) be defined as the sum of proper divisors of n (numbers less than 
 * n which divide evenly into n).
 * If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair 
 * and each of a and b are called amicable numbers.
 * 
 * For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 
 * 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 
 * 2, 4, 71 and 142; so d(284) = 220.
 * 
 * Evaluate the sum of all the amicable numbers under 10000.
 * 
 * Answer: 31626
 */

function init() 
{
    var s = 0;
    for (var i=1; i<10000; i++) 
    {
    	var x = properDivisors(i).reduce(sum, 0);
    	var y = properDivisors(x).reduce(sum, 0);
    	
        if (y == i && x != y) 
        {
    		s += x + y;
    	}
    }

    return s / 2;
}

function sum(a, b) 
{
	return a + b;
}

module.exports.init = init;