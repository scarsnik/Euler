"use strict";
/*
 * Cubic permutations
 * Problem 62 
 * The cube, 41063625 (345^3), can be permuted to produce two other cubes: 
 * 56623104 (384^3) and 66430125 (405^3). In fact, 41063625 is the smallest 
 * cube which has exactly three permutations of its digits which are also cube.
 * 
 * Find the smallest cube for which exactly five permutations of its digits 
 * are cube.
 * 
 * Answer: 127,035,954,683
 */

function init() 
{
    var target = 5,
        cubes = {},
        answer = "",
        i = 1,
        n = 0;

    while (true)
    {
        n = Math.pow(i, 3).toString().split("").sort().join("");
        if (n in cubes)
        {
            cubes[n].push(i);
        }
        else
        {
            cubes[n] = [i];
        }
        
        if (cubes[n].length == target) 
        {
            answer = Math.pow(cubes[n][0], 3);
            break;
        }

        i++;
    }

    return answer;
}


module.exports.init = init;
