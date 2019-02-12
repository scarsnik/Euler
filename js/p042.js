"use strict";
const fs = require('fs');
var tools = require("./util/tools"),
    triNumArray = tools.triNumArray;

/*
 * Coded triangle numbers
 * Problem 42
 * The nth term of the sequence of triangle numbers is given by, t_n = ½n(n+1); 
 * so the first ten triangle numbers are:
 * 
 * 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
 * 
 * By converting each letter in a word to a number corresponding to its 
 * alphabetical position and adding these values we form a word value. For 
 * example, the word value for SKY is 19 + 11 + 25 = 55 = t_10. If the word 
 * value is a triangle number then we shall call the word a triangle word.
 * 
 * Using words.txt (right click and 'Save Link/Target As...'), a 16K text 
 * file containing nearly two-thousand common English words, how many are 
 * triangle words?
 * 
 * Answer: 162
 */

function init() {
    var count = 0;
    var t = triNumArray(1000);
    var f = fs.readFileSync('./data/p042_words.txt', 'utf8');
    var w = f.replace(/\"/g,'').split(',');
    for (var i=0; i<w.length; i++) {
        var s = 0;
        for (var j=0; j<w[i].length; j++) {
            s += w[i].charCodeAt(j) - 64;
        }
        if (t.indexOf(s) >= 0) {
            count += 1
        }

    }
    return count;
}

module.exports.init = init;
