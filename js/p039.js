"use strict";
var tools = require("./util/tools"),
    pythagoreanTriple = tools.pythagoreanTriple,
    gcd = tools.gcd;
/*
 * Integer right triangles
 * Problem 39
 * If p is the perimeter of a right angle triangle with integral length 
 * sides, {a,b,c}, there are exactly three solutions for p = 120.
 * 
 * {20,48,52}, {24,45,51}, {30,40,50}
 * 
 * For which value of p ≤ 1000, is the number of solutions maximised?
 * 
 * Answer: 840
 */

function init() {
    var limit = 1000;
    var perimeters = [];
    for (var i=0; i<=limit; i++) {
        perimeters.push(0);
    }
    
    for (var m=2; m<1000; m++) {
        for (var n=1; n<m; n++) {
            if (gcd(m, n) == 1 && (isEven(m) || isEven(n)) ) {
                var t = pythagoreanTriple(m, n)
                var p = t.a + t.b + t.c;
                var k = 1;
                while (p*k <= limit) {
                    perimeters[p*k] += 1;
                    k += 1;
                }    
            }          
        }
    }

    var max = 0;
    var output = 0;
    for (var i=0; i<=limit; i++) {
        if (perimeters[i] > max) {
            max = perimeters[i];
            output = i;
        }
    }

    return output;
}

function isEven(n) {
    return n % 2 == 0;
}

module.exports.init = init;
