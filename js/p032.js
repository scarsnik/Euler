"use strict";
var nextPermutation = require("./util/tools").nextPermutation;
/*
 * Pandigital products
 * Problem 32
 * We shall say that an n-digit number is pandigital if it makes use of all the 
 * digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 
 * through 5 pandigital.
 * 
 * The product 7254 is unusual, as the identity, 39 � 186 = 7254, containing 
 * multiplicand, multiplier, and product is 1 through 9 pandigital.
 * 
 * Find the sum of all products whose multiplicand/multiplier/product identity 
 * can be written as a 1 through 9 pandigital.
 * 
 * HINT: Some products can be obtained in more than one way so be sure to only 
 * include it once in your sum.
 * 
 * Answer: 45228
 */

function init() 
{
    var arr = [1,2,3,4,5,6,7,8,9],
        output = [];

    while (nextPermutation(arr)) 
    {
        for (var i=1; i<arr.length-1; i++) 
        {
            for (var j=i+1; j<arr.length; j++) 
            {
                var m1 = arr.slice(0, i).joinInt();
                var m2 = arr.slice(i, j).joinInt();
                var p  = arr.slice(j, arr.length).joinInt();
                if (m1 * m2 == p) 
                {
                    output.push(p);
                }
            }
        } 
    }

    return output.unique().sum();
}

Array.prototype.sum = function() {
    var sum = 0;
    for (var i=0; i<this.length; i++) {
        sum += this[i];
    }
    return sum;
}

Array.prototype.unique = function() {

    var seen = {};
    var output = [];
    var j = 0;
    for (var i=0; i<this.length; i++) {
        var item = this[i];
        if (!seen[item]) {
            seen[item] = true;
            output[j++] = item;
        }
    }
    return output;
}

Array.prototype.joinInt = function() {
    var n = 0;
    var e = Math.pow(10, this.length-1);
    for (var i=0; i<this.length; i++) {
        n += this[i] * e;
        e /= 10;
    }
    return n;
}

module.exports.init = init;

