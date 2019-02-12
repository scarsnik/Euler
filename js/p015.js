"use strict";
/*
 * Lattice paths
 * Problem 15
 * Starting in the top left corner of a 2×2 grid, and only being able to move 
 * to the right and down, there are exactly 6 routes to the bottom right corner.
 * 
 * How many such routes are there through a 20×20 grid?
 * 
 * Answer: 137846528820
 */

function init() {
    var output = '>>>>> NOT COMPLETED <<<<<';
    var m = 20, 
        n = 20;

    // console.log(gridCount(m, n));
    // console.log(hashCount(m, n));
    // console.log(combCount(m, n));
    return hashCount(m, n);
}

function hashCount(m, n) {
    var hash = {};
    function count(m, n) {
        if (n == 0 || m == 0) return 1;
        
        var key = m+'-'+n;
        if (hash.hasOwnProperty(key)) {
            return hash[key];
        }
        
        hash[key] = count(m, n-1) + count(m-1, n);
        return hash[key];
    }
    return count(m, n);
}

function gridCount(m, n) {
    var grid = new Array(m+1);
    for (var i=0; i<=m; i++) {
        grid[i] = new Array(n+1);
    }

    for (var i=0; i<=m; i++) {
        grid[i][0] = 1;
    }

    for (var j=0; j<=n; j++) {
        grid[0][j] = 1;
    }

    for (var i=1; i<=m; i++) {
        for (var j=1; j<=n; j++) {
            grid[i][j] = grid[i-1][j] + grid[i][j-1];
        }
    }

    return grid[m][n];
}

function combCount(m, n) {
    return comb(m+n, m);
}

function comb(n, k) {
    var top = 1,
        bot = 1;
    
    for (var i=n; i>=n-k+1; i--) {
        top *= i;
    }

    for (var i=k; i>0; i--) {
        bot *= i;
    }

    return Math.floor(top / bot);
}


module.exports.init = init;