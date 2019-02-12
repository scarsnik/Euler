"use strict";
var bigInt = require("big-integer");

/*
 * Powerful digit sum
 * Problem 56
 * A googol (10^100) is a massive number: one followed by one-hundred zeros; 
 * 100^100 is almost unimaginably large: one followed by two-hundred zeros. 
 * Despite their size, the sum of the digits in each number is only 1.
 * 
 * Considering natural numbers of the form, a^b, where a, b < 100, what is the 
 * maximum digital sum?
 * 
 * Answer: 972
 */

function init() 
{
	var i = 0,
		j = 0,
		b = 10,
		max = 0;

	for (i=0; i<100; i++)
	{
		for (j=0; j<100; j++)
		{
			var n = bigInt(i).pow(j);
			var d = n.toString().split("");
			var sum = 0;
			for (var k=0, l=d.length; k<l; k++)
			{
				sum += parseInt(d[k], 10);
			}

			if (sum > max)
			{
				max = sum;
			}
		}
	}

	return max
}


module.exports.init = init;
