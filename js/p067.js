"use strict";
const fs = require('fs');
/*
 * Maximum path sum II
 * Problem 67 
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
 * Find the maximum total from top to bottom in triangle.txt 
 * (right click and 'Save Link/Target As...'), a 15K text file containing a 
 * triangle with one-hundred rows.
 * 
 * NOTE: This is a much more difficult version of Problem 18. It is not 
 * possible to try every route to solve this problem, as there are 299 
 * altogether! If you could check one trillion (1012) routes every second it 
 * would take over twenty billion years to check them all. There is an
 * efficient algorithm to solve it. ;o)
 * 
 * Answer: 7273
 */
module.exports.init = init;

function init() 
{
	var data = fs.readFileSync('./data/p067_triangle.txt', 'utf8').split(/\n/g);
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

