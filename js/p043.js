"use strict";
var tools = require("./util/tools"),
    nextPermutation = tools.nextPermutation;
/*
 * Sub-string divisibility
 * Problem 43
 * The number, 1406357289, is a 0 to 9 pandigital number because it is made up 
 * of each of the digits 0 to 9 in some order, but it also has a rather 
 * interesting sub-string divisibility property.
 * 
 * Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, 
 * we note the following:
 * 
 * d_2 d_3 d_4=406 is divisible by 2
 * d_3 d_4 d_5=063 is divisible by 3
 * d_4 d_5 d_6=635 is divisible by 5
 * d_5 d_6 d_7=357 is divisible by 7
 * d_6 d_7 d_8=572 is divisible by 11
 * d_7 d_8 d_9=728 is divisible by 13
 * d_8 d_9 d_10=289 is divisible by 17
 * Find the sum of all 0 to 9 pandigital numbers with this property.
 *
 * Answer: 16695334890
 */

function init() {
	var s = 0;
    var p = [0,1,2,3,4,5,6,7,8,9];
    while (nextPermutation(p)) {
    	if (substrDiv(p)) {
    		s += parseInt(p.join(''));
    	}
    }
    return s;
}

function substrDiv(arr) {

	var d = [2,3,5,7,11,13,17]
	for (var i=1; i<8; i++) {
		if (parseInt(arr.slice(i, i+3).join(''), 10) % d[i-1] == 0) continue;
		return false;
	}
	return true;
}

module.exports.init = init;
