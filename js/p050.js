"use strict";
var tools = require("./util/tools"),
    sieveEratosthenes = tools.sieveEratosthenes,
    sievePrimeness = tools.sievePrimeness;
/*
 * Consecutive prime sum
 * Problem 50
 * The prime 41, can be written as the sum of six consecutive primes:
 * 
 * 41 = 2 + 3 + 5 + 7 + 11 + 13
 * This is the longest sum of consecutive primes that adds to a prime 
 * below one-hundred.
 * 
 * The longest sum of consecutive primes below one-thousand that adds 
 * to a prime, contains 21 terms, and is equal to 953.
 * 
 * Which prime, below one-million, can be written as the sum of the 
 * most consecutive primes?
 * 
 * Answer: 997651
 */

function init() {
	var output = '>>>>> NOT COMPLETED <<<<<';

	var limit = 1000000;
	var isPrime = sievePrimeness(limit);
	var primes = sieveEratosthenes(limit, isPrime);
	var hash = {}; // store key as "start:end" of the consecutive primes

	var max = 0;
	for (var i=0; i<primes.length; i++) {
		var k, s = 0, l = 0;

		for (var j=i; j<primes.length; j++) {
			s += primes[j];
			if (s > limit) break;

			l = 1+j-i;
			k = i+"-"+j;
			hash[k] = {'sum': s, 'length': l};
			if (isPrime[s] && l > max) {
				output = hash[k].sum;
				max = l;
			}
		}
	}
    return output;
}

module.exports.init = init;
