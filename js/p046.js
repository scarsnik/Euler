"use strict";
var sievePrimeness = require("./util/tools").sievePrimeness;

/*
 * Goldbach's other conjecture
 * Problem 46
 * It was proposed by Christian Goldbach that every odd composite number can 
 * be written as the sum of a prime and twice a square.
 * 
 * 9 = 7 + 2 × 1^2
 * 15 = 7 + 2 × 2^2
 * 21 = 3 + 2 × 3^2
 * 25 = 7 + 2 × 3^2
 * 27 = 19 + 2 × 2^2
 * 33 = 31 + 2 × 1^2
 * 
 * It turns out that the conjecture was false.
 * 
 * What is the smallest odd composite that cannot be written as the sum of a
 * prime and twice a square?
 * 
 * Answer: 5777
 */

function init() {
	var output = '>>>>> NOT COMPLETED <<<<<';
	var isPrime = sievePrimeness(1000000);
	var primes = isPrime.map((e, i) => i*e).filter(e => e);

	var n = 1;
	while (true) {
		n += 2;
		if (!isPrime[n]) {
			if (!primePlusTwoTimesSquare(n, primes)) return n;
		}
	}

    return output;
}

function primePlusTwoTimesSquare(n, primes) {
	// p + 2 * sqr;
	var i = 0;
	while (primes[i] < n) {
	
		for (var j=1; j<Math.floor(n/2); j++) {
			if (primes[i] + 2 * j * j == n) {
				return true;
			}
		}

		i += 1;
	}
	return false;
}

module.exports.init = init;
