"use strict";
var properDivisors = require("./util/tools").properDivisors;
/*
 * Non-abundant sums
 * Problem 23
 * A perfect number is a number for which the sum of its proper divisors is 
 * exactly equal to the number. For example, the sum of the proper divisors 
 * of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect 
 * number.
 * 
 * A number n is called deficient if the sum of its proper divisors is less 
 * than n and it is called abundant if this sum exceeds n.
 * 
 * As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest 
 * number that can be written as the sum of two abundant numbers is 24. By 
 * mathematical analysis, it can be shown that all integers greater than 28123 
 * can be written as the sum of two abundant numbers. However, this upper limit 
 * cannot be reduced any further by analysis even though it is known that the 
 * greatest number that cannot be expressed as the sum of two abundant numbers 
 * is less than this limit.
 * 
 * Find the sum of all the positive integers which cannot be written as the 
 * sum of two abundant numbers.
 * 
 * Answer: 4179871
 */

function init() {
	const LIMIT = 28123;
    var a = abundant(LIMIT);
    var c = Array(28123).fill(true);
    var s = 0;
    
    for (var i=0; i<a.length; i++) {
    	for (var j=i; j<a.length; j++) {
    		var k = a[i] + a[j];
    		if (k <= LIMIT) 
    			c[k] = false;
    	}
    }

    for (let i=0; i<c.length; i++) {
    	if (c[i]) {
    		s += i;
    	}
    }
    return s;
}

function abundant(MAX) {
	var n = [];
	for (var i=1; i<=MAX; i++) {
		var d = properDivisors(i).reduce((a, b) => {return a + b}, 0);
		if (d > i) {
			n.push(i);
		}
	}
	return n;
}


module.exports.init = init;