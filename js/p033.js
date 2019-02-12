"use strict";
var gcd = require("./util/tools").gcd;
/*
 * Digit cancelling fractions
 * Problem 33
 * The fraction 49/98 is a curious fraction, as an inexperienced mathematician 
 * in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which
 * is correct, is obtained by cancelling the 9s.
 *
 * We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
 * 
 * There are exactly four non-trivial examples of this type of fraction, less 
 * than one in value, and containing two digits in the numerator and denominator.
 * 
 * If the product of these four fractions is given in its lowest common terms, 
 * find the value of the denominator.
 *
 * Answer: 100
 */

function init() {
    
	var num = [];
	var dem = [];

	for (var a=1; a<10; a++) {
		for (var b=a+1; b<10; b++) {
			for (var x=1; x<10; x++) {
				if ( (a*10 + x) / (b*10 + x) == a/b ) {
					num.push(a*10+x); 
					dem.push(b*10+x);
				}
				if ( (a*10 + x) / (x*10 + b) == a/b ) { 
					num.push(a*10+x); 
					dem.push(x*10+b); 
				}
				if ( (x*10 + a) / (x*10 + b) == a/b ) { 
					num.push(x*10+a); 
					dem.push(x*10+b); 
				}
				if ( (x*10 + a) / (b*10 + x) == a/b ) { 
					num.push(x*10+a); 
					dem.push(b*10+x); 
				}
			}
		}
	}
	
	var n = 1, d = 1;
	for (var i=0; i<4; i++) {
		var cd = gcd(num[i], dem[i])
		n *= num[i]/cd;
		d *= dem[i]/cd;
	}
	
	return d / gcd(n, d);
    
}

module.exports.init = init;
