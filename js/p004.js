"use strict";
/*
 * Largest palindrome product
 * Problem 4
 * A palindromic number reads the same both ways. The largest palindrome made 
 * from the product of two 2-digit numbers is 9009 = 91 × 99.
 * 
 * Find the largest palindrome made from the product of two 3-digit numbers.
 *
 * Answer: 906609
 */

function init() {

    var answer = 0;
    var n, a, b, found;
    found = false;
    for (var i=9; i>7; i--) {
    	for (var j=9; j>=0; j--) {
    		for (var k=9; k>=0; k--) {
    			n = i*100000 + j*10000 + k*1000 + k*100 + j*10 + i*1;
                for (var x=999; x>100; x--) {
                    a = n / x;
                    b = n / a;
                    if ( a === parseInt(a, 10) ) {
                        if (b >= 100 && b <= 999 && a >= 100 && a <= 999) {
                            answer = n;
                            found = true;
                            break;
                        }
                    }
                }
                if (found) break;
    		}
            if (found) break;
    	}
        if (found) break;
    }

    return answer;
}

module.exports.init = init;