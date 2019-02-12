"use strict";
/*
 * Permuted multiples
 * Problem 52
 * It can be seen that the number, 125874, and its double, 251748, contain 
 * exactly the same digits, but in a different order.
 * 
 * Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, 
 * contain the same digits.
 * 
 * Answer: 142857
 */

function init() {
	var output = ">>>>> NOT COMPLETED <<<<<";

    var x = 1;
    while (true) {
        var x1 = sssj(1*x);
        var x2 = sssj(2*x);
        var x3 = sssj(3*x);
        var x4 = sssj(4*x);
        var x5 = sssj(5*x);
        var x6 = sssj(6*x);
        if (x1 == x2 && x1 == x3 && x1 == x4 && x1 == x5 && x1 == x6) {
            output = x;
            break;
        }
        x += 1;
    }

    return output;
}

function sssj(x) {
    // string split sort join
    return x.toString().split("").sort().join("");
}

module.exports.init = init;
