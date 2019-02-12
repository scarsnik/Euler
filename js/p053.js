"use strict";
/*
 * Combinatoric selections
 * Problem 53
 * There are exactly ten ways of selecting three from five, 12345: 
 * 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
 * 
 * In combinatorics, we use the notation, 5C3 = 10.
 * 
 * In general, nCr = n! / r!(n−r)! 
 * Where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.
 *
 * It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.
 * 
 * How many, not necessarily distinct, values of  nCr, for 1 ≤ n ≤ 100, are 
 * greater than one-million?
 * 
 * Answer: 4075
 */

function init() {
	var output = ">>>>> NOT COMPLETED <<<<<";
	var count = 0;
	var bc = binomialCoefficients();
	for (var i=1; i<=100; i++) {
		for (var j=1; j<=i; j++) {
			if (bc[i][j] > 1000000) {
				count += 1;
			}
		}
	}
	output = count;
    return output;
}

function binomialCoefficients() {
	const MAX = 100;
	var n = MAX, m = MAX;
	var bc = new Array(MAX);

	for (var i=0; i<=n; i++) {
		bc[i] = new Array(MAX);
		bc[i][0] = 1;
	}
	for (var j=0; j<=n; j++) {
		bc[j][j] = 1;
	}
	for (var i=1; i<=n; i++) {
		for (var j=1; j<i; j++) {
			bc[i][j] = bc[i-1][j-1] + bc[i-1][j];
		}
	}

	return bc;
}

module.exports.init = init;
