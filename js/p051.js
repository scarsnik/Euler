"use strict";
var tools = require("./util/tools"),
    sieveEratosthenes = tools.sieveEratosthenes,
    sievePrimeness = tools.sievePrimeness,
    subsets = tools.subsets,
    range = tools.range;

/*
 * Prime digit replacements
 * Problem 51
 * By replacing the 1st digit of the 2-digit number *3, it turns out that 
 * six of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
 * 
 * By replacing the 3rd and 4th digits of 56**3 with the same digit, this 
 * 5-digit number is the first example having seven primes among the ten 
 * generated numbers, yielding the family: 56003, 56113, 56333, 56443, 
 * 56663, 56773, and 56993. Consequently 56003, being the first member of 
 * this family, is the smallest prime with this property.
 * 
 * Find the smallest prime which, by replacing part of the number (not 
 * necessarily adjacent digits) with the same digit, is part of an eight 
 * prime value family.
 * 
 * Answer: 121313
 */

function init() {
	var output = ">>>>> NOT COMPLETED <<<<<";
    var limit = 1000000;
    var target = 8;

    var isPrime = sievePrimeness(limit);
    var primes = sieveEratosthenes(limit, isPrime);

    var found = false;
    for (var i=0, l=primes.length; i<l; i++) {
        var s = primes[i].toString();
        var mask = subsets(range(0, s.length-1))

        for (var j=0, m=mask.length; j<m; j++) {
            var count = 0;
            var p = [];
            for (var k=0; k<10; k++) {
                var q = applyMask(s, mask[j], k);
                if ( q >= primes[i] && isPrime[q] ) {
                    count ++;
                    p.push(q);
                }
            }

            if (count == target) {
                found = true;
                output = p[0];
                break;
            }
        }
        if (found) break;
    }

    return output;
}

function applyMask(p, m, a) {
    var q = p.toString().split("");
    for (var i=0, l=m.length; i<l; i++) {
        q[m[i]] = a;
    }
    return parseInt(q.join(""), 10);
}


module.exports.init = init;
