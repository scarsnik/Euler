"use strict";
const primeFactors = require('./util/tools.js').primeFactorization;

/*
 * Largest prime factor
 * Problem 3
 * The prime factors of 13195 are 5, 7, 13 and 29.
 * 
 * What is the largest prime factor of the number 600851475143 ?
 * 
 * Answer: 6857
 */

function init() {
	var input = 600851475143;
	var factors = primeFactors(input);

    return Object.keys(factors).sort(function(a,b) { return b-a;})[0];
}

module.exports.init = init;