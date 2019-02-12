"use strict";
const bigInt = require('big-integer');
/*
 * Factorial digit sum
 * Problem 20
 * n! means n × (n − 1) × ... × 3 × 2 × 1
 * 
 * For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
 * and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
 * 
 * Find the sum of the digits in the number 100!
 * 
 * Answer: 648
 */

function init() {
    var n = bigInt(100),
        f = bigInt(1),
        s = 0,
        r = 0;
    
    while(n > 0) {
        f = f.multiply(n);
        n = n.minus(1);
    }

    while(f > 0) {
        r = f.mod(10);
        f = f.minus(r).divide(10);
        s += r;
    }
    return s;
}

module.exports.init = init;