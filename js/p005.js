"use strict";
const lcm = require('./util/tools.js').lcm;

/*
 * Smallest multiple
 * Problem 5
 *
 * 2520 is the smallest number that can be divided by each of the numbers 
 * from 1 to 10 without any remainder.
 * 
 * What is the smallest positive number that is evenly divisible by all of 
 * the numbers from 1 to 20?
 * 
 * Answer: 232792560
 */

function init() {
    var n = 1;

    for (var i=2; i<=20; i++) {
        n = lcm(n, i);
    }
    
    return n;
}

module.exports.init = init;
