"use strict";
const bigInt = require('big-integer');
/*
 * Self powers
 * Problem 48
 * The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
 * 
 * Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
 * 
 * Answer: 9110846700
 */

function init() {
	var output = '>>>>> NOT COMPLETED <<<<<';

	var sum = bigInt(0, 10);
	for (var i=1; i<=1000; i++) {
		sum = sum.plus(bigInt(i).pow(i));
	}
	output = sum.toString().substr(-10);
    return output;
}

module.exports.init = init;
