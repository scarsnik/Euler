"use strict";

var fs = require("fs"),
    assert = require("assert"),
    bigInt = require("big-integer");

/*******************************************************************************
 *
 *       Prime and sieve functions
 *
 ******************************************************************************/
module.exports.primeFactorization = primeFactorization;
module.exports.isPrime = isPrime;
module.exports.sieveEratosthenes = sieveEratosthenes;
module.exports.sievePrimeness = sievePrimeness;

/*******************************************************************************
 *
 *       String functions
 *
 ******************************************************************************/
module.exports.isPalindrome = isPalindrome;
module.exports.padLeft = padLeft;
module.exports.filename = filename;

/*******************************************************************************
 *
 *       Number theory functions
 *
 ******************************************************************************/
module.exports.gcd = gcd;
module.exports.gcdExtended = gcdExtended;
module.exports.lcm = lcm;
module.exports.pythagoreanTriple = pythagoreanTriple;
module.exports.polygonalNum = polygonalNum;
module.exports.isPolygonalNum = isPolygonalNum;
module.exports.properDivisors = properDivisors;
module.exports.factorial = factorial;
module.exports.longDivision = longDivision;
module.exports.integerDigits = integerDigits;
module.exports.isPandigital = isPandigital;
module.exports.sqrtPcf = sqrtPcf;
module.exports.cf = cf;


/*******************************************************************************
 *
 *       Array functions
 *
 ******************************************************************************/
module.exports.unique = unique;
module.exports.joinInt = joinInt;
module.exports.range = range;

/*******************************************************************************
 *
 *       Combinatoric functions
 *
 ******************************************************************************/
module.exports.nextPermutation = nextPermutation;
module.exports.subsets = subsets;
module.exports.permutations = permutations;
module.exports.combinations = combinations;
module.exports.rotations = rotations;

/*******************************************************************************
 *
 *       Linear algebra functions
 *
 ******************************************************************************/
module.exports.matMul = matMul;
module.exports.transpose = transpose;
module.exports.eye = eye;
module.exports.matPrint = matPrint;



/*******************************************************************************
 *
 *       Prime and sieve functions
 *
 ******************************************************************************/

function primeFactorization(n) {

    var c = n,      // remaining number to factor
        i = 3,      // index used for counting
        f = {};     // store the factors

    while (c % 2 == 0) 
    {
        f[2] = f[2] + 1 || 1;
        c /= 2;
    }

    while (i <= Math.sqrt(c) + 1) 
    {
        if (c % i == 0) 
        {
            f[i] = f[i] + 1 || 1;
            c /= i;
        } 
        else
        {
            i += 2;
        }
    }

    if (c > 1)
    {
        f[c] = f[c] + 1 || 1;
    }

    return f;
}

function isPrime(n)
{
    var i = 5;

    if (n == 2 || n == 3)
    {
        return true;
    }

    if (n < 2 || n % 2 == 0 || n % 3 == 0)
    {
        return false;
    }

    if (n < 9)
    {
        return true;
    }

    while (i <= Math.floor(Math.sqrt(n)))
    {
        if (n % i == 0 || n % (i + 2) == 0)
        {
            return false;
        }
        else
        {
            i += 6;
        }
    }

    return true;
}

function sievePrimeness(n) {
    // Using sieve of eratosthenes
    // Returns an array with true values where the index is a prime

    var a = [];                 // output array of trues/falses
    var m = Math.sqrt(n);       // maximum index need to check

    for (var i=0; i<n; i++) 
    {
        a[i] = true;
    }

    a[0] = false;
    a[1] = false;

    for (var i=2; i<m; i++) 
    {
        if (a[i]) 
        {
            for (var j=i*i; j<n; j+=i)
            {
                a[j] = false;
            }
        }
    }

    return a;
}

function sieveEratosthenes(n, p) {
    // using sieve of eratosthenes
    // Returns an array of primes

    var primes = p || sievePrimeness(n);
    return primes.map((e, i) => i * e).filter(e => e);
}




/*******************************************************************************
 *
 *       String functions
 *
 ******************************************************************************/

function isPalindrome(str, ignoreCase, ignoreSpaces)
{
    var s = str;

    if (ignoreCase)
    {
        s = s.toLowerCase();
    }

    if (ignoreSpaces)
    {
        s = s.replace(/\s/g, "")
    }

    var len = s.length,
        max = Math.floor(len / 2),
        i = 0;

    for (i=0; i<max; i++)
    {
        if (s[i] !== s[len - i - 1])
        {
            return false;
        }
    }

    return true;
}


function padLeft(n, c, s) {
    // n is the number
    // c is the character
    // s is the size

    var a = n.toString();
    
    while (a.length < s) 
    {
        a = c + a;
    }

    return a;
}


function filename(s) {
    // s = C:\Users\cweng\OneDrive\Euler\js\problems\p003.js
    // returns "p003.js"
    var parts = s.split("/");
    
    if ( parts.length==1 ) 
    {
        parts = s.split("\\");
    }

    return parts[parts.length-1];
}


/*******************************************************************************
 *
 *       Number theory functions
 *
 ******************************************************************************/

function gcd(a, b) {
    // Greatest common divisor
    var t;

    while (b != 0) 
    {
        t = b;
        b = a % b;
        a = t;
    }

    return a;
}

function gcdExtended(a, b) {
    // Greatest common divisor + linear congruence solver
    // i.e. return gcd(a, b) and x, y such that a*s + b*t = gcd(a, b)

    var s = 1, olds = 0;
    var t = 0, oldt = 1;
    var r = a, oldr = b;
    var q, temp;

    while (r != 0) {
        q = Math.floor(oldr / r);

        temp = r;
        r = oldr - q * r;
        oldr = temp;

        temp = s;
        s = olds - q * s;
        olds = temp;

        temp = t;
        t = oldt - q * t;
        oldt = temp;
    }
    
    return {
        "gcd": oldr, 
        "bezout": [olds, oldt], 
        "quotients": [t, s]
    };
}

function lcm(a, b) {
    // Least common multiple
    return a * b / gcd(a, b);
}

function pythagoreanTriple(m, n) {
    // Euclids formula

    if (m < n)
    {
        assert.fail(m, n, undefined, "<");
    }

    if (m < 0)
    {
        assert.fail(m, 0, undefined, "<");
    }
    
    if (n < 0)
    {
        assert.fail(n, 0, undefined, "<");
    }
    
    return [m*m - n*n, 2*m*n, m*m + n*n];
}

function polygonalNum(n, sides)
{
    // Also known as figurate numbers

    if (sides < 2 )
    {
        assert.fail(sides, 2, undefined, "<");
    }

    if (sides > 8 )
    {
        assert.fail(sides, 8, undefined, ">");
    }

    switch (sides)
    {
        case 3:
            return n * (n + 1) / 2;

        case 4:
            return n * n;

        case 5:
            return n * (3 * n - 1) / 2;

        case 6:
            return n * (2 * n - 1);

        case 7:
            return n * (5 * n - 3) / 2;

        case 8:
            return n * (3 * n - 2);
    }
}

function isPolygonalNum(n, sides)
{
    // Also known as figurate numbers
    
    if (sides < 2 )
    {
        assert.fail(sides, 2, undefined, "<");
    }

    if (sides > 8 )
    {
        assert.fail(sides, 8, undefined, ">");
    }

    var t;

    switch (sides)
    {
        case 3:
            t = parseInt(0.5 + Math.sqrt(0.25 + 2 * n), 10);
            return polygonalNum(n, 3) == t;

        case 4:
            // return n * n;

        case 5:
            t = parseInt( (0.5 + Math.sqrt(0.25+(6*n))) / 3, 10);
            return polygonalNum(n, 5) == t;

        case 6:
            t = parseInt((1 + Math.sqrt(1 + 8 * n)) / 4, 10)
            return polygonalNum(n, 6) == t;

        case 7:
            // return n * (5 * n - 3) / 2;

        case 8:
            // return n * (3 * n - 2);
    }
}

/*
    Get all the proper divisors of a number (n).
    i.e. all integers less than n that divide n evenly.
*/
function properDivisors(n) {
    var divs = [1];
    if (n < 2) return divs;
    else {
        var sqrt = Math.sqrt(n),
            iRoot = Math.floor(sqrt);

        for (var i=2; i<sqrt; i++) {
            if (n % i === 0) {
                divs.push(i, n/i);
            }
        }
        if (sqrt == iRoot) divs.push(sqrt);
    }
    return divs;
}

function factorial(n) {

    var FACT_TABLE = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 
        3628800, 39916800, 479001600, 6227020800, 87178291200, 
        1307674368000, 20922789888000, 355687428096000, 6402373705728000, 
        121645100408832000, 2432902008176640000 ]

    if (n < 0)
    {
        assert.fail(n, 0, undefined, "<");
    }

    if (n > 20)
    {
        assert.fail(n, 20, undefined, ">");
    }

    return FACT_TABLE[n];
}

function longDivision(n, d) {
    var digits = [];
    var hashq = {};
    var hashr = {};

    var i = 0;
    while (true) {
        var r = n % d;
        var q = (n - r) / d;
        // console.log(n, q, r);

        if (hashq.hasOwnProperty(q) && hashr.hasOwnProperty(r)) break;

        digits.push(q);
        hashq[q] = true;
        hashr[r] = true;

        var n = r * 10;
    }
    return digits;
}

function unique(arr) {
    var seen = {};
    var output = [];
    var j = 0;
    for (var i=0; i<arr.length; i++) {
        var item = arr[i];
        if (!seen[item]) {
            seen[item] = true;
            output[j++] = item;
        }
    }
    return output;
}

function joinInt(array) {
    var n = 0;
    var e = Math.pow(10, array.length-1);
    for (var i=0; i<array.length; i++) {
        n += array[i] * e;
        e /= 10;
    }
    return n;
}

/*
    Given an integer, returns an array of its digits.
    input: 12345
    output: [1,2,3,4,5]
 */
function integerDigits(n) {
    var arr = [];
    while (n > 0) {
        arr.push(n % 10);
        n = Math.floor(n/10);
    }
    return arr.reverse();
}


function isPandigital(n, d) {
    var x = n.toString();
    return x.split("").sort((a,b)=>a>b).join("") == d;
}

function range(start, end) {
    var output = [];
    for (var i=start; i<=end; i++) {
        output.push(i);
    }
    return output;
}

function logbase(n, b) {
    // Returns the log (base b) of n
    if (typeof b == "undefined") b = 10;
    return Math.log(n) / Math.log(b);
}


function cf(seq, limit)
{
    // seq = generator that produces convergent integgers
    // maximum iterations.
    var h0 = 0, h1 = 1,
        k0 = 1, k1 = 0,
        th = 0,
        tk = 0,
        a = 0,
        i = 0;

    while (i < limit)
    {
        if (Array.isArray(seq))
        {
            a = seq.slice(1)[i];
        }
        else
        {
            a = seq.next().value;
        }

        // Store h1/k1 in temp vars
        th = bigInt(h1);
        tk = bigInt(k1);

        // Calculate new h1/k1 values
        h1 = bigInt(a).times(h1).plus(h0);
        k1 = bigInt(a).times(k1).plus(k0);

        // Assign h0/k0 to the previous h1/k1 values
        h0 = bigInt(th);
        k0 = bigInt(tk);

        // console.log(typeof seq, i, a, h1.toString(), k1.toString(), done);
        i++;
    }

    return [h1, k1];
}

function sqrtPcf(n)
{
    // Square Root Periodic Continued Fractions
    var sqrtN = Math.sqrt(n),
        seq = [];

    if (Number.isInteger(sqrtN))
    {
        return [sqrtN];
    }

    var m = 0,
        d = 1,
        a = Math.floor(sqrtN);

    seq.push(a);

    while (true)
    {
        m = d * a - m;
        d = Math.floor((n - m*m) / d);
        a = Math.floor((seq[0] + m) / d);
        seq.push(a);

        if (a == 2*seq[0])
        {
            break;
        }
    }

    return seq;
}

/*******************************************************************************
 *
 *       Combinatoric functions
 *
 ******************************************************************************/

function nextPermutation(array) {
    // Refer to: https://www.nayuki.io/page/next-lexicographical-permutation-algorithm
    // Find longest non-increasing suffix
    var i = array.length - 1;
    while (i > 0 && array[i - 1] >= array[i])
        i--;
    // Now i is the head index of the suffix

    // Are we at the last permutation already?
    if (i <= 0)
        return false;

    // Let array[i - 1] be the pivot
    // Find rightmost element that exceeds the pivot
    var j = array.length - 1;
    while (array[j] <= array[i - 1])
        j--;
    // Now the value array[j] will become the new pivot
    // Assertion: j >= i

    // Swap the pivot with j
    var temp = array[i - 1];
    array[i - 1] = array[j];
    array[j] = temp;

    // Reverse the suffix
    j = array.length - 1;
    while (i < j) {
        temp = array[i];
        array[i] = array[j];
        array[j] = temp;
        i++;
        j--;
    }

    // Successfully computed the next permutation
    return true;
}

function prevPermutation(array) {
    // Hmm lets think about this one.
};

function subsets(array) {
    var members = [],
        bit = 0,
        maxBits = 0,
        size = Math.pow(2, array.length);

    for (var i=0; i<size; i++) 
    {
        members[i] = [];
        maxBits = Math.floor(logbase(i, 2));

        for (var j=0; j<=maxBits; j++) 
        {
            bit = (i >> j) & 1;
            
            if (bit == 1) 
            {
                members[i].push(array[j]);
            }
        }
    }

    return members;
}

function permutations(array, k)
{
    var perms = [],
        combs = [];

    if (typeof k == "undefined")
    {
        permute(array, 0, array.length-1);
    }
    else
    {
        combs = combinations(array, k)
        for (var i=0, l=combs.length; i<l; i++)
        {
            permute(combs[i], 0, k-1);
        }
    }

    return perms;
   
    function permute(a, l, r)
    {
        if (l == r)
        {
            perms.push(a.slice(0));
        }
        else
        {
            for (var i=l; i<=r; i++)
            {
                swap(a, l, i);
                permute(a, l+1, r);
                swap(a, l, i);
            }
        }
    }

    function swap(a, i, j)
    {
        var t = a[i];
        a[i] = a[j];
        a[j] = t;
    }
}

function combinations(array, k) {
    // https://rosettacode.org/wiki/Combinations#Lexicographic_ordered_generation
    // generates combinations of size n from m items
    var c = [],
        m = array.length,
        output = [];

    for (var i=0; i<k; i++) 
    {
        c[i] = k - i;
    }

    while (true) 
    {
        var d = [];

        for (i=k; i--;) 
        {
            d.push(array[c[i]-1]);
        }

        output.push(d);

        if (c[i]++ < m) 
        {
            continue;
        }

        for (i=0; c[i] >= m - i;) 
        {
            if (++i >= k)
            {
                return output;
            }
        }

        for (c[i]++; i; i--) 
        {
            c[i-1] = c[i] + 1;
        }
    }
}

function rotations(array) {
    // bad way to do this?
    // maybe use pop / shift
    var size = array.length;
    var output = [];
    for (var i=0; i<size; i++) {
        var r = [];
        var s = i;
        var e = (i + size) % size;
        while (true) {
            r.push(array[s]);
            s = (s + 1) % size;
            if (s == e) break;
        }
        output.push(r);
    }
    return output;
}



/*******************************************************************************
 *
 *       Linear algebra functions
 *
 ******************************************************************************/

function matMul(A, B)
{
    // Returns the matrix multiplication of A*B

    var n = A.length,           // Rows in A
        m = A[0].length,        // Cols in A
        o = B.length,           // Rows in B
        p = B[0].length,        // Cols in B
        C = [],                 // Output matrix C
        sum = 0;

    if (m != o)
    {
        assert.fail("Columns in matrix A", "Rows in matrix B", undefined, "!=");
    }

    for (var i=0; i<n; i++)
    {
        C[i] = [];
        for (var j=0; j<p; j++)
        {
            sum = 0;
            for (var k=0; k<m; k++)
            {
                sum += A[i][k] * B[k][j];
            }
            C[i][j] = sum;
        }
    }

    return C;
}

function transpose(A)
{
    var n = A.length,
        m = A[0].length,
        C = [];

    for (var i=0; i<m; i++)
    {
        C[i] = [];
    }

    for (var i=0; i<n; i++)
    {
        for (var j=0; j<m; j++)
        {
            C[j][i] = A[i][j];
        }
    }

    return C;
}

function eye(n)
{
    // Returns the identify matrix of size n
    var A = [];

    for (var i=0; i<n; i++)
    {
        A[i] = [];
        for (var j=0; j<n; j++)
        {
            var x = i == j ? 1 : 0;
            A[i][j] = x;
        }
    }

    return A;
}

function matPrint(A)
{
    for (var i=0, l=A.length; i<l; i++)
    {
        console.log(A[i]);
    }
}