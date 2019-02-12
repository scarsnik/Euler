"use strict";
var tools = require("./util/tools.js"),
    polygonalNum = tools.polygonalNum;
/*
 * Cyclical figurate numbers
 * Problem 61 
 * Triangle, square, pentagonal, hexagonal, heptagonal, and octagonal numbers 
 * are all figurate (polygonal) numbers and are generated by the following 
 * formulae:
 * 
 * Triangle     P3,n=n(n+1)/2       1, 3, 6, 10, 15, ...
 * Square       P4,n=n2     1, 4, 9, 16, 25, ...
 * Pentagonal       P5,n=n(3n−1)/2      1, 5, 12, 22, 35, ...
 * Hexagonal        P6,n=n(2n−1)        1, 6, 15, 28, 45, ...
 * Heptagonal       P7,n=n(5n−3)/2      1, 7, 18, 34, 55, ...
 * Octagonal        P8,n=n(3n−2)        1, 8, 21, 40, 65, ...
 * The ordered set of three 4-digit numbers: 8128, 2882, 8281, has three 
 * interesting properties.
 * 
 * The set is cyclic, in that the last two digits of each number is the first 
 * two digits of the next number (including the last number with the first).
 * Each polygonal type: triangle (P3,127=8128), square (P4,91=8281), and 
 * pentagonal (P5,44=2882), is represented by a different number in the set.
 * This is the only set of 4-digit numbers with this property.
 * Find the sum of the only ordered set of six cyclic 4-digit numbers for which
 * each polygonal type: triangle, square, pentagonal, hexagonal, heptagonal, 
 * and octagonal, is represented by a different number in the set.
 *
 * Answer: 28684
 */

function init() 
{
    var nums = generatePolyNums(8, 4);
    return bt(nums, 6).reduce(function(x, y) { return parseInt(x,10)+parseInt(y,10); });
}


function bt(input, target)
{
    var finished = false,
        result = [];

    for (var n in input[8])
    {
        recur(input, [[], new Set()], n);
        if (finished) break;
    }
    
    return result;

    function recur(input, solution, next)
    {
        if ( finished ) return ;
        if ( reject(solution) ) return ;
        
        if ( accept(solution) )
        {
            console.log("solution", solution);
            finished = true;
            result = solution[0].slice(0);
        }

        for (var i=8; i>=3; i--)
        {
            if ( !solution[1].has(i) && next in input[i])
            {
                for (var j=0; j<input[i][next].length; j++)
                {
                    solution[0].push(next+input[i][next][j]);
                    solution[1].add(i);

                    recur(input, solution, input[i][next][j]);
                    
                    solution[0].pop();
                    solution[1].delete(i);
                }
            }
        }
    }

    function reject(a)
    {
        var left = a[0][0];
        var right = a[0].slice(-1)[0];

        if (a[0].length < target) return false;
        // console.log("reject", a, left, right, left.substr(0,2), right.substr(2,2))
        if (right.substr(2,2) === left.substr(0,2))
        {
            return false;
        }
        return true;
    }

    function accept(a)
    {
        return a[0].length == target;
    }
}

function generatePolyNums(num, digits)
{
    var nums = {},
        lo = Math.pow(10, digits-1)-1,
        hi = Math.pow(10, digits);

    for (var i=3; i<=num; i++)
    {
        nums[i] = {};
        var j = 1;
        while (true)
        {
            var p = polygonalNum(j, i);
            if (p > lo && p < hi) 
            {
                var k = p.toString().substr(0,2);
                var v = p.toString().substr(2,2);
                if (nums[i].hasOwnProperty(k))
                {
                    nums[i][k].push(v);
                }
                else
                {
                    nums[i][k] = [v];
                }
            }

            if (p >= hi) break;

            j++;
        }
    }
    return nums;
}

module.exports.init = init;