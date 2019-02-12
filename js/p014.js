"use strict";

/*
 * Longest Collatz sequence
 * Problem 14
 * The following iterative sequence is defined for the set of positive integers:
 * 
 * n → n/2 (n is even)
 * n → 3n + 1 (n is odd)
 * 
 * Using the rule above and starting with 13, we generate the following sequence:
 * 
 * 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 * It can be seen that this sequence (starting at 13 and finishing at 1) 
 * contains 10 terms. Although it has not been proved yet (Collatz Problem), 
 * it is thought that all starting numbers finish at 1.
 * 
 * Which starting number, under one million, produces the longest chain?
 * 
 * NOTE: Once the chain starts the terms are allowed to go above one million.
 * 
 * Answer: 837799
 */

function init() {
    var a = 0,
        max = 0,
        n = 0,
        c = {1:1};

    for (var i=1; i<1000000; i++) {
        n = i;
        if (c.hasOwnProperty(i)) {
            continue;
        } else {
            c[i] = 1;
            while (n != 1) {
                if (n % 2 == 0) {
                    n /= 2;
                } else {
                    n = 3 * n + 1;
                }

                if (c.hasOwnProperty(n)) {
                    c[i] += c[n];
                    break;
                } else {  
                    c[i] += 1;
                }
            }
        }
        
        if (c[i] > max) {
            max = c[i];
            a = i;
        }
        // console.log(i, collatz(i).length, c[i]);
        // var x = collatz(i).length;
        // if (x > max) {
        //     max  = x;
        //     a = i;
        // }
    }

    return a;
}

// Optimise by storing the intermediate lengths in a hash table.

function collatz(n) {
    var c = {
        chain: [n],
        length: 1
    };

    while (n != 1) {
        if (n % 2 == 0) {
            n /= 2;
        } else {
            n = 3 * n + 1;
        }
        // c.chain.push(n);
        c.length += 1;
    };

    return c;
}

module.exports.init = init;