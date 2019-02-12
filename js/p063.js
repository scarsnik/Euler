"use strict";
var tools = require("./util/tools.js");
/*
 * Powerful digit counts
 * Problem 63 
 * The 5-digit number, 16807=7^5, is also a fifth power. 
 * Similarly, the 9-digit number, 134217728=8^9, is a ninth power.
 * 
 * How many n-digit positive integers exist which are also an nth power?
 * 
 * Answer: 49
 */

function init() 
{

    var power = 1,
        base = 0,
        count = 0;

	while (true)
    {
        base = 1;
        while(true)
        {
            var n = Math.pow(base, power);

            if (digits(n) == power)
            {
                count++;
            }

            if (n >= Math.pow(10, power))
            {
                break;
            }

            base++;
        }
        
        if (base <= 2) {
            break;
        }

        power++;
    }

    return count;
}

function digits(n)
{
    return n.toString().length;
}

module.exports.init = init;
