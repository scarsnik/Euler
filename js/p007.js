"use strict";
const primes = require('./util/tools.js').sieveEratosthenes;
/*
 * 10001st prime
 * Problem 7
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see 
 * that the 6th prime is 13.
 * 
 * What is the 10,001st prime number?
 * 
 * Answer: 104743
 */

function init() {
    return primes(200000)[10000];
}

module.exports.init = init;