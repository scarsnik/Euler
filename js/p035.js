"use strict";
var tools = require("./util/tools"),
    sievePrimeness = tools.sievePrimeness,
    integerDigits = tools.integerDigits,
    joinInt = tools.joinInt,
    rotations = tools.rotations;
/*
 * Circular primes
 * Problem 35
 * The number, 197, is called a circular prime because all rotations of the 
 * digits: 197, 971, and 719, are themselves prime.
 * 
 * There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 
 * 73, 79, and 97.
 * 
 * How many circular primes are there below one million?
 * 
 * Answer: 55
 */

function init() {
    var limit = 1000000;
    var isPrime = sievePrimeness(limit);
    
    var primes = [];
    for (var i=0; i<isPrime.length; i++) {
        if (isPrime[i]) {
            primes.push(i);
        }
    }
    
    var count = 0;
    for (var i=0; i<primes.length; i++) {
        var d = integerDigits(primes[i]);
        var r = rotations(d);
        var isCircular = true;

        for (var j=0; j<r.length; j++) {
            var n = joinInt(r[j]);
            if (!isPrime[n]) {
                isCircular = false;
                break;
            }
        }

        if (isCircular) {
            count += 1;
        }
    }

    return count;
}


module.exports.init = init;
