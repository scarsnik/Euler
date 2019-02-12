"use strict";
const fs = require('fs');
const bigInt = require('big-integer');

/*
 * Large sum
 * Problem 13
 * Work out the first ten digits of the sum of the following one-hundred 
 * 50-digit numbers.
 * 
 * <'refer to file ../data/p013.txt'>
 * 
 * Answer: 5537376230
 */

function init() {
    var file = fs.readFileSync('./data/p013.txt', 'utf8')
    var nums = file.split(/\r?\n/g);
    var bigN = 0;
    for (var i=0; i<nums.length; i++) {
        bigN += bigInt(nums[i], 10);
    }
    return bigN.toString().substring(0, 11).replace('.', '');
}

module.exports.init = init;