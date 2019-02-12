"use strict";
const bigInt = require('big-integer');
/*
 * Power digit sum
 * Problem 16
 * 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
 * 
 * What is the sum of the digits of the number 2^1000?
 * 
 * Answer: 1366
 * 
 */

function init() {
    var n = bigInt(2).pow(1000),
        s = 0;
    while( n.gt(0) ) {
        var d = n.mod(10);
        n = n.minus(d).divide(10);
        s += d;
    }
    return s;
}

module.exports.init = init;