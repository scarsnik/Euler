"use strict";
/*
 * Number spiral diagonals
 * Problem 28
 * Starting with the number 1 and moving to the right in a clockwise direction 
 * a 5 by 5 spiral is formed as follows:
 * 
 * 21 22 23 24 25
 * 20  7  8  9 10
 * 19  6  1  2 11
 * 18  5  4  3 12
 * 17 16 15 14 13
 * 
 * It can be verified that the sum of the numbers on the diagonals is 101.
 * 
 * What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral 
 * formed in the same way?
 * 
 * Answer: 669171001
 */

function init() {
    
    const LIMIT = 1001;

    var ne = 0, sw = 0;
    for (var i=1; i<=LIMIT; i++) {
        if (i % 2 == 0) {
            sw += Math.pow(i, 2) + 1;
        } else {
            ne += Math.pow(i, 2);
        }
    }

    var se = 0, nw = 0;
    var seVal = 1, nwVal = 1;
    var seInc = 2, nwInc = 6;
    for (var j=0; j<(LIMIT-1)/2; j++) {
        nwVal += nwInc;
        seVal += seInc;
        
        nwInc += 8;
        seInc += 8;
        
        nw += nwVal;
        se += seVal;
    }
    return sw + ne + nw + se;
}

module.exports.init = init;

//                                             nw  inc1    inc2                
// 73  74  75  76  77  78  79  80  81      0   1   6   8       1   2   8
// 72  43  44  45  46  47  48  49  50      1   7   14  8       3   10  8
// 71  42  21  22  23  24  25  26  51      2   21  22  8       13  18  8
// 70  41  20  7   8   9   10  27  52      3   43  30  8       31  26  8
// 69  40  19  6   1   2   11  28  53      4   73  38  8       57  34  8
// 68  39  18  5   4   3   12  29  54      5   111 46  8       91  42  8
// 67  38  17  16  15  14  13  30  55      6   157 54  8       133 50  8
// 66  37  36  35  34  33  32  31  56      7   211 62  8       183 58  8
// 65  64  63  63  61  60  59  58  57      8   273 70  8       241 66  8
//                                         9   343 78  8       307 74  8
//                                         10  421 86  8       381 82  8
//                                         11  507 94  8       463 90  8
//                                         12  601 102 8       553 98  8
//                                         13  703 110 8       651 106 8
//                                         14  813 118 8       757 114 8
//                                         15  931 126 8       871 122 8
//                                         16  1057    134 8       993 130 8
//                                         17  1191    142 8       1123    138 8
