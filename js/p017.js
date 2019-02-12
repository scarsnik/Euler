"use strict";
/*
 * Number letter counts
 * Problem 17
 * If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
 * then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
 * 
 * If all the numbers from 1 to 1000 (one thousand) inclusive were written out 
 * in words, how many letters would be used?
 * 
 * NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and 
 * forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 
 * 20 letters. The use of "and" when writing out numbers is in compliance with 
 * British usage.
 * 
 * Answer: 21124
 */

function init() {
    var nums = {
        0:'',
        1:'one',
        2:'two',
        3:'three',
        4:'four',
        5:'five',
        6:'six',
        7:'seven',
        8:'eight',
        9:'nine',
        10:'ten',
        11:'eleven',
        12:'twelve',
        13:'thirteen',
        14:'fourteen',
        15:'fifteen',
        16:'sixteen',
        17:'seventeen',
        18:'eighteen',
        19:'nineteen',
        20:'twenty',
        30:'thirty',
        40:'forty',
        50:'fifty',
        60:'sixty',
        70:'seventy',
        80:'eighty',
        90:'ninety',
        100:'hundred',
        1000:'thousand'
    }

    var s99 = 0;
    for (var i=1; i<=99; i++) {
        if (i <= 20) {
            s99 += nums[i].length;
        } else {
            var r = i % 10;
            var n = i - r;
            s99 += nums[n].length + nums[r].length;
        }
    }
    var s999 = 0;
    for (var i=1; i<=9; i++) {
        s999 += (nums[i].length + nums[100].length + 3) * 100 - 3;
        s999 += s99;
    }

    return s99 + s999 + nums[1].length + nums[1000].length;
    // return '>>>>> NOT COMPLETED <<<<<';
}

module.exports.init = init;