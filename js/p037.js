"use strict";
var tools = require("./util/tools"),
    sievePrimeness = tools.sievePrimeness,
    sieveEratosthenes = tools.sieveEratosthenes;

/*
 * Truncatable primes
 * Problem 37
 * The number 3797 has an interesting property. Being prime itself, it is 
 * possible to continuously remove digits from left to right, and remain 
 * prime at each stage: 3797, 797, 97, and 7. Similarly we can work from 
 * right to left: 3797, 379, 37, and 3.
 * 
 * Find the sum of the only eleven primes that are both truncatable from 
 * left to right and right to left.
 * 
 * NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
 * 
 * Answer: 748317
 */

function init() {
    var limit = 1000000,
        isPrime = sievePrimeness(limit),
        primes = sieveEratosthenes(limit);

    var sum = 0;
    for (var i=4; i<primes.length; i++) 
    {
        var p = primes[i];
        var tl = truncLeft(p);
        var tr = truncRight(p);    
        
        var isTrunc = true;
        while (true) {
            if (!isPrime[tl] || !isPrime[tr]) {
                isTrunc = false;
                break;
            }
            tl = truncLeft(tl);
            tr = truncRight(tr);    
            if (tr <= 0) break;
        }

        if (isTrunc) sum += p;
    }

    return sum;
}

function truncLeft(n) {
    var l = n.toString().length;
    var m = Math.pow(10, l-1);
    return n % m;
}

function truncRight(n) {
    return Math.floor(n / 10);
}

module.exports.init = init;
