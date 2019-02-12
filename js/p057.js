"use strict";
var bigInt = require("big-integer");
/*
 * Square root convergents
 * Problem 57
 * It is possible to show that the square root of two can be expressed as an 
 * infinite continued fraction.
 * 
 * √ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...
 * 
 * By expanding this for the first four iterations, we get:
 * 
 * 1 + 1/2 = 3/2 = 1.5
 * 1 + 1/(2 + 1/2) = 7/5 = 1.4
 * 1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
 * 1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...
 * 
 * The next three expansions are 99/70, 239/169, and 577/408, but the eighth 
 * expansion, 1393/985, is the first example where the number of digits in the 
 * numerator exceeds the number of digits in the denominator.
 * 
 * In the first one-thousand expansions, how many fractions contain a numerator 
 * with more digits than denominator?
 * 
 * Answer: 153
 */

function init() 
{
	var n = bigInt(1),			// numerator
		d = bigInt(2),			// denominator
		s = 0,
		t = bigInt(0);

	for (var i=0; i < 1000; i++)
	{
		t = d;
		d = d.times(2).plus(n);
		n = t;
		if (n.plus(d).toString().length > bigInt(d).toString().length)
		{
			s++;
		}
	}

    return s;
}

module.exports.init = init;
