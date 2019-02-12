"use strict";
var tools = require("./util/tools"),
    sieveEratosthenes = tools.sieveEratosthenes,
    isPandigital = tools.isPandigital;

/*
 * Pandigital prime
 * Problem 41
 * We shall say that an n-digit number is pandigital if it makes use of all 
 * the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital 
 * and is also prime.
 * 
 * What is the largest n-digit pandigital prime that exists?
 * 
 * Answer: 7652413
 */

function init() {
    
    var p = sieveEratosthenes(10000000);
    var o = 0;
    for (var i=0; i<p.length; i++) {
        var d = digits(p[i].toString().length);
        if (isPandigital(p[i], d)) {
            o = p[i];
        }
    }
    return o;
}

function digits(n) {
    var o = "";
    for (var i=1; i<=n; i++) {
        o += i;
    }
    return o;
}

module.exports.init = init;
