"use strict";
const pythagoreanTriple = require("./util/tools.js").pythagoreanTriple;

/*
 * Special Pythagorean triplet
 * Problem 9
 * A Pythagorean triplet is a set of three natural numbers, a < b < c, 
 * for which, a^2 + b^2 = c^2
 * For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
 * 
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 * 
 * Answer: 31875000
 */

function init() {
    var answer = 0;

    var m = 2, 
        n = 1, 
        t = 0, 
        s = 0, 
        found = false;

    while (!found) 
    {
        for (n=1; n<m ; n++) 
        {
            t = pythagoreanTriple(m, n);
            s = t[0] + t[1] + t[2];

            if (s == 1000) 
            {
                answer = t[0] * t[1] * t[2];
                found = true;
                break;
            }
        }

        m++;
    }

    return answer;
}

module.exports.init = init;