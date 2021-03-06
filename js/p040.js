"use strict";
/*
 * Champernowne's constant
 * Problem 40
 * An irrational decimal fraction is created by concatenating the positive 
 * integers: 0.12345678910(1)112131415161718192021...
 * 
 * It can be seen that the 12th digit of the fractional part is 1.
 * 
 * If d_n represents the nth digit of the fractional part, find the value 
 * of the following expression.
 * 
 * d_1 × d_10 × d_100 × d_1000 × d_10000 × d_100000 × d_1000000
 * 
 * Answer: 210
 */

function init() {
    var limit = 1000000;
    var s = "";
    for (var i=0; i<limit/10; i++) {
        s += i;
    }

    var o = 1;
    var p = 1;
    while (p < limit) {
        o *= s[p];
        p *= 10;
    }

    return o;
}

module.exports.init = init;
