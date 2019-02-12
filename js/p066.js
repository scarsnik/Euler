"use strict";
var tools = require("./util/tools.js"),
	sqrtPcf = tools.sqrtPcf,
	bigInt = require("big-integer");
/*
 * Diophantine equation
 * Problem 66 
 * Consider quadratic Diophantine equations of the form:
 * 
 * x^2 – Dy^2 = 1
 * 
 * For example, when D=13, the minimal solution in x is 649^2 – 13×180^2 = 1.
 * 
 * It can be assumed that there are no solutions in positive integers when D is 
 * square.
 * 
 * By finding minimal solutions in x for D = {2, 3, 5, 6, 7}, we obtain the 
 * following:
 * 
 * 3^2 – 2×2^2 = 1
 * 2^2 – 3×1^2 = 1
 * 9^2 – 5×4^2 = 1
 * 5^2 – 6×2^2 = 1
 * 8^2 – 7×3^2 = 1
 * 
 * Hence, by considering minimal solutions in x for D ≤ 7, the largest x is 
 * obtained when D=5.
 * 
 * Find the value of D ≤ 1000 in minimal solutions of x for which the largest 
 * value of x is obtained.
 *
 * Answer: 661
 */
module.exports.init = init;

function init() 
{
	var max = [0, 0];

	for (var d=1; d<=1000; d++)
	{
		if (!Number.isInteger(Math.sqrt(d)))
		{
			var a = sqrtPcf(d);
			var b = cf(a, d);
			if (b[0] > max[0])
			{
				max = [b[0], d];
			}
		}
	}

	return max;
}

function isQuadraticDiophantine(x, y, d)
{
	var a = bigInt(x).times(x);
	var b = bigInt(d).times(y).times(y);
	return  a.minus(b).equals(1);
}


function cf(seq, d)
{
    // seq = generator that produces convergent integers
    // maximum iterations.
    var h0 = 0, h1 = 1,
        k0 = 1, k1 = 0,
        th = 0,
        tk = 0,
        a = 0,
        i = 0,
        seq0 = seq[0],
        seq = seq.slice(1),
        l = seq.length;

    while (true)
    {
    	if (i == 0)
    	{
    		a = seq0;
    	}
    	else
    	{
        	a = seq[(i-1) % l];
    	}
        
        // Store h1/k1 in temp vars
        th = bigInt(h1);
        tk = bigInt(k1);

        // Calculate new h1/k1 values
        h1 = bigInt(a).times(h1).plus(h0);
        k1 = bigInt(a).times(k1).plus(k0);

        // Assign h0/k0 to the previous h1/k1 values
        h0 = bigInt(th);
        k0 = bigInt(tk);

        if (isQuadraticDiophantine(h1, k1, d))
        {
        	break;
        }

        i++;
    }
    
    return [h1, k1];
}

