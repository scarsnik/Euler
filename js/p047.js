"use strict";
var tools = require("./util/tools"),
    sieveEratosthenes = tools.sieveEratosthenes,
    primeFactorization = tools.primeFactorization;
/*
 * Distinct primes factors
 * Problem 47
 * The first two consecutive numbers to have two distinct prime factors are:
 * 14 = 2 × 7
 * 15 = 3 × 5
 * 
 * The first three consecutive numbers to have three distinct prime factors are:
 * 644 = 2² × 7 × 23
 * 645 = 3 × 5 × 43
 * 646 = 2 × 17 × 19
 * 
 * Find the first four consecutive integers to have four distinct prime factors 
 * each. What is the first of these numbers?
 * 
 * Answer: 134043
 */

function init() {
	var output = '>>>>> NOT COMPLETED <<<<<';

    var primes = sieveEratosthenes(200000);

    var limit = 4;
    var i = 0;
    while (true) {
        i += 1

        var isValid = true;
        for (var j=i; j<i+limit; j++) {
            var factors = primeFactorization(j);
            if (Object.keys(factors).length != limit) {
                isValid = false;
                break;
            }
        }
        if (isValid) return i;
    }

    return output;
}

module.exports.init = init;
