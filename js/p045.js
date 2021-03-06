"use strict";
var tools = require("./util/tools"),
    triNum = tools.triNum,
    isPentNum = tools.isPentNum,
    isHexNum = tools.isHexNum;
/*
 * Triangular, pentagonal, and hexagonal
 * Problem 45
 * Triangle, pentagonal, and hexagonal numbers are generated by the 
 * following formulae:
 * 
 * Triangle	  T_n=n(n+1)/2	 	1, 3, 6, 10, 15, ...
 * Pentagonal P_n=n(3n−1)/2	 	1, 5, 12, 22, 35, ...
 * Hexagonal  H_n=n(2n−1)	 	1, 6, 15, 28, 45, ...
 * It can be verified that T_285 = P_165 = H_143 = 40755.
 * 
 * Find the next triangle number that is also pentagonal and hexagonal.
 * 
 * Answer: 1533776805
 */

function init() {
    
	var output = '>>>>> NOT COMPLETED <<<<<';

    var tn = 285,
        t = 0;
		
    while (true) {
    	tn += 1;
    	t = triNum(tn);
    	
    	if (isPentNum(t) && isHexNum(t)) {
    		output = t;
    		break;
    	}
    }

    return output;
}

module.exports.init = init;
