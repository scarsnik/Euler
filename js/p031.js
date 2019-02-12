"use strict";
/*
 * Coin sums
 * Problem 31
 * In England the currency is made up of pound, £, and pence, p, and there are 
 * eight coins in general circulation:
 * 
 * 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
 * It is possible to make £2 in the following way:
 * 
 * 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
 * How many different ways can £2 be made using any number of coins?
 * 
 * Answer: 73682
 */

function init() {
	var coins = [1, 2, 5, 10, 20, 50, 100, 200];
	var amount = 200;

	function ways(target, coin) {
		if (coin <= 1) return 1;
		var res = 0;
		while (target >= 0) {
			res += ways(target, coin-1);
			target -= coins[coin-1];
		}
		return res;
	}	
	return ways(amount, 8);
}

module.exports.init = init;

