"use strict";
var tools = require("./util/tools.js"),
    sieveEratosthenes = tools.sieveEratosthenes,
    isPrime = tools.isPrime;
/*
 * Prime pair sets
 * Problem 60 
 * The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes 
 * and concatenating them in any order the result will always be prime. 
 * For example, taking 7 and 109, both 7109 and 1097 are prime. The sum of these 
 * four primes, 792, represents the lowest sum for a set of four primes with 
 * this property.
 * 
 * Find the lowest sum for a set of five primes for which any two primes 
 * concatenate to produce another prime.
 * 
 * Answer: 26033
 */

function init() 
{
    var primes = sieveEratosthenes(10000),
        index = [],
        target = 5,
        output = [];

    output = bt(primes, target)

    return output.reduce(function(x, y) { return x + y; });
}

function bt(input, target)
{
    var finished = false,
        result = [];
    recur(input, [], 0);
    return result;

    function recur(input, solution, next)
    {
        if ( finished ) return ;
        if ( reject(solution) ) return ;
        
        if ( accept(solution) )
        {
            // console.log("solution", solution);
            finished = true;
            result = solution.slice(0);
        }

        for (var i=next; i<input.length; i++)
        {
            solution.push(input[i]);
            recur(input, solution, i+1);
            solution.pop();
        }
    }

    function reject(a)
    {
        var l = a.length;
        if (l < 2) return false;

        for (var i=0; i<l-1; i++)
        {
            if ( !isPrimePair(a[i], a[l-1]) )
            {
                return true;
            }
        }
        return false;
    }

    function accept(a)
    {
        return a.length == target;
    }

    function isPrimePair(p1, p2)
    {
        var q1 = isPrime(parseInt(p1.toString() + p2.toString(), 10));
        var q2 = isPrime(parseInt(p2.toString() + p1.toString(), 10));
        return q1 && q2;
    }
}


module.exports.init = init;

