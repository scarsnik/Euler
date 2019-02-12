"use strict";
var factorial = require("./util/tools").factorial,
    integerDigits = require("./util/tools").integerDigits;

/*
 * Digit factorials
 * Problem 34
 * 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
 * 
 * Find the sum of all numbers which are equal to the sum of the factorial of 
 * their digits.
 * 
 * Note: as 1! = 1 and 2! = 2 are not sums they are not included.
 * 
 * Answer: 40730
 */

function init() {
    var f = {};
    for (var i=0; i<=9; i++) 
    {
        f[i] = factorial(i);
    }

    var output = [];
    
    for (var i=3; i<100000; i++) {
        var s = 0;
        var d = integerDigits(i);
        for (var j=0; j<d.length; j++) {
            s += f[d[j]];
        }

        if (s == i) {
            output.push(i);
        }
    }
    return output.reduce((a,b) => a+b);
}

module.exports.init = init;