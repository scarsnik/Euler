"use strict";
/*
 * Double-base palindromes
 * Problem 36
 * The decimal number, 585 = 1001001001 (base 2) (binary), is palindromic in 
 * both bases.
 * 
 * Find the sum of all numbers, less than one million, which are palindromic in 
 * base 10 and base 2.
 * 
 * (Please note that the palindromic number, in either base, may not include 
 * leading zeros.)
 * 
 * Answer: 872187
 */

function init() {
    var limit = 1000000;

    var sum = 0;
    for (var i=1; i<limit; i++) {
        if (isPalindromic(i) && isPalindromic(i.toString(2))) {
            sum += i;
        }
    }

    return sum;
}

function isPalindromic(n) {
    var s = n.toString();
    return s.split('').reverse().join('') == s;
}

module.exports.init = init;
