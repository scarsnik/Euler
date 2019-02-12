"use strict";
var tools = require("./util/tools.js"),
	nj = require("numjs"),
	matMul = tools.matMul,
	transpose = tools.transpose,
	eye = tools.eye,
	matPrint = tools.matPrint,
	permutations = tools.permutations;
/*
 * Magic 5-gon ring
 * Problem 68 
 * Consider the following "magic" 3-gon ring, filled with the numbers 1 to 6, 
 * and each line adding to nine.
 * 
 *    4
 *     3
 *    1 2 6   
 *   5
 *
 * Working clockwise, and starting from the group of three with the numerically 
 * lowest external node (4,3,2 in this example), each solution can be described
 * uniquely. For example, the above solution can be described by the set: 
 * 4,3,2; 6,2,1; 5,1,3.
 * 
 * It is possible to complete the ring with four different totals: 9, 10, 11, 
 * and 12. There are eight solutions in total.
 * 
 * Total	Solution Set
 * 9	4,2,3; 5,3,1; 6,1,2
 * 9	4,3,2; 6,2,1; 5,1,3
 * 10	2,3,5; 4,5,1; 6,1,3
 * 10	2,5,3; 6,3,1; 4,1,5
 * 11	1,4,6; 3,6,2; 5,2,4
 * 11	1,6,4; 5,4,2; 3,2,6
 * 12	1,5,6; 2,6,4; 3,4,5
 * 12	1,6,5; 3,5,4; 2,4,6
 * By concatenating each group it is possible to form 9-digit strings; the 
 * maximum string for a 3-gon ring is 432621513.
 * 
 * Using the numbers 1 to 10, and depending on arrangements, it is possible to 
 * form 16- and 17-digit strings. What is the maximum 16-digit string for a 
 * "magic" 5-gon ring?
 *   o
 *     x  o
 *   x   x
 * o  x x  o
 *     o
 * Answer: 6531031914842725
 */



module.exports.init = init;

function init() 
{

	var sets5 = [[1,0,0,0,0,1,1,0,0,0],
		         [0,1,0,0,0,0,1,1,0,0],
		         [0,0,1,0,0,0,0,1,1,0],
		         [0,0,0,1,0,0,0,0,1,1],
		         [0,0,0,0,1,1,0,0,0,1]],
    //           [ 4, 6, 5, 3, 2, 1 ]
		sets3 = [[1,0,0,1,1,0],
				 [0,1,0,0,1,1],
				 [0,0,1,1,0,1]],
		perms = permutations([1,2,3,4,5,6]),
		rings = [],
		max = 0,
		num = "";

	for (var i=0, l=perms.length; i<l; i++)
	{
		var sums = matMul(sets3, transpose([perms[i]]));
		if ( sums.every( function(x) { return x[0] == sums[0][0];}) )
		{
			num = ""
			sets3.forEach(function(e) {
				for (var j=0; j<e.length; j++)
				{
					if (e[j] == 1)
					{
						num += perms[i][j];
					}
				}
			})
			var nl = num.length;
			num = num.substr(0, nl-2) + num[nl-1] + num[nl-2];
			rings.push(perms[i], num);
		}
	}

	console.log(rings);
	console.log(magicNgonRing(3));
    return "nothing to see here =======================";
}

function magicNgonRing(n)
{
	// n has to be greater than 2
	return makeSets(n);
	
}

function makeSets(n)
{
	var sets = []
	for (var i=0; i<n; i++)
	{
		sets[i] = [];
		for (var j=0; j<2*n; j++)
		{
			if (j == i)
			{
				sets[i][j] = 1;
			}
			else if (j >= n)
			{
				if (j % n == i || j % n == i+1 || (i == n-1 && j % n == 0) )
				{
					sets[i][j] = 1;
				}
				else
				{
					sets[i][j] = 0;	
				}
			} 
			else
			{
				sets[i][j] = 0;	
			}
		}
	}
	return sets;
}