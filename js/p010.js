"use strict";
const primes = require("./util/tools.js").sieveEratosthenes;
/*
 * Summation of primes
 * Problem 10
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 * 
 * Find the sum of all the primes below two million.
 * 
 * Answer: 142913828922
 */

function init() {
    var a = 0,
    	i = 0,
    	p = primes(2000000),
    	l = p.length;

    for (i=0; i<l; i++) 
    {
        a += p[i];
    }

    return a;
}

module.exports.init = init;
