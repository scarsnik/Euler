"use strict";
const fs = require('fs');
/*
 * Maximum path sum I
 * Problem 18
 * By starting at the top of the triangle below and moving to adjacent numbers 
 * on the row below, the maximum total from top to bottom is 23.
 * 
 * 3
 * 7 4
 * 2 4 6
 * 8 5 9 3
 * 
 * That is, 3 + 7 + 4 + 9 = 23.
 * 
 * Find the maximum total from top to bottom of the triangle below:
 * 
 * 75
 * 95 64
 * 17 47 82
 * 18 35 87 10
 * 20 04 82 47 65
 * 19 01 23 75 03 34
 * 88 02 77 73 07 63 67
 * 99 65 04 28 06 16 70 92
 * 41 41 26 56 83 40 80 70 33
 * 41 48 72 33 47 32 37 16 94 29
 * 53 71 44 65 25 43 91 52 97 51 14
 * 70 11 33 28 77 73 17 78 39 68 17 57
 * 91 71 52 38 17 14 91 43 58 50 27 29 48
 * 63 66 04 68 89 53 67 30 73 16 69 87 40 31
 * 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
 * 
 * NOTE: As there are only 16384 routes, it is possible to solve this problem 
 * by trying every route. However, Problem 67, is the same challenge with a 
 * triangle containing one-hundred rows; it cannot be solved by brute force, 
 * and requires a clever method! ;o)
 * 
 * Answer: 1074
 */

function init() {
    
    var data = fs.readFileSync('./data/p018.txt', 'utf8').split(/\r?\r\n/g);
    var pyr = [];
    for (var i=0; i<data.length; i++) {
        pyr.push( 
            data[i]
            .split(' ')
            .map(function(x) { 
                return parseInt(x, 10); 
            }) 
        );
    }

    // Run from the base of the pyramid upwards.
    var end = pyr.length-1;
    var base = pyr[end].length;
    var path = Array(base+1).fill(0);

    for (var r=end; r>=0; r--) {
        for (var c=0; c<pyr[r].length; c++) {
            path[c] = Math.max(path[c]+pyr[r][c], path[c+1]+pyr[r][c])
        }
    }
    return path[0];
}


module.exports.init = init;