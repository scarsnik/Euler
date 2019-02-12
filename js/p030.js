"use strict";
/*
 * Digit fifth powers
 * Problem 30
 * Surprisingly there are only three numbers that can be written as the sum of 
 * fourth powers of their digits:
 * 
 * 1634 = 1^4 + 6^4 + 3^4 + 4^4
 * 8208 = 8^4 + 2^4 + 0^4 + 8^4
 * 9474 = 9^4 + 4^4 + 7^4 + 4^4
 * As 1 = 1^4 is not a sum it is not included.
 * 
 * The sum of these numbers is 1634 + 8208 + 9474 = 19316.
 * 
 * Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
 * 
 * Answer: 443839
 */

function init() {
    var pow = 5;
    var s = 0;
    for (var n=10; n<=200000; n++) {
    	var d = digitPowSum(n, pow);
    	if (d == n) {
    		s += d;
    	}
    }
    return s;
}

function digitPowSum(n, e) {
	var s = 0;
	while (n > 0) {
		s += Math.pow(n % 10, e);
		n = Math.floor(n / 10);
	}
	return s;
}

module.exports.init = init;
