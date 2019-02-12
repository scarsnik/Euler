"use strict";
var fs = require("fs");
var tools = require("./util/tools.js"),
	permutations = tools.permutations;
/*
 * XOR decryption
 * Problem 59
 * Each character on a computer is assigned a unique code and the preferred 
 * standard is ASCII (American Standard Code for Information Interchange). 
 * For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.
 * 
 * A modern encryption method is to take a text file, convert the bytes to 
 * ASCII, then XOR each byte with a given value, taken from a secret key. 
 * The advantage with the XOR function is that using the same encryption key 
 * on the cipher text, restores the plain text; for example, 65 XOR 42 = 107, 
 * then 107 XOR 42 = 65.
 * 
 * For unbreakable encryption, the key is the same length as the plain text 
 * message, and the key is made up of random bytes. The user would keep the 
 * encrypted message and the encryption key in different locations, and without 
 * both "halves", it is impossible to decrypt the message.
 * 
 * Unfortunately, this method is impractical for most users, so the modified 
 * method is to use a password as a key. If the password is shorter than the 
 * message, which is likely, the key is repeated cyclically throughout the 
 * message. The balance for this method is using a sufficiently long password 
 * key for security, but short enough to be memorable.
 * 
 * Your task has been made easy, as the encryption key consists of three lower 
 * case characters. Using cipher.txt (right click and 'Save Link/Target As...'), 
 * a file containing the encrypted ASCII codes, and the knowledge that the plain 
 * text must contain common English words, decrypt the message and find the sum 
 * of the ASCII values in the original text.
 */

function init() 
{
	var data = fs.readFileSync("./data/p059_cipher.txt", 'utf8'),
		encrypted = data.split(",").map(function(x) { return parseInt(x, 10); }),
		letters = "abcdefghijklmnopqrstuvwxyz",
		chars = "\n\"\' _.,?;!$%&()-:/\*^#@~+{}:>< 1234567890 abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ",
		charSet = new Set(),
		keys = permutations(letters.split(""), 3),
		sum = 0;

	for (var i=0; i<chars.length; i++)
	{
		charSet.add(chars.charCodeAt(i));
	}

	for (var i=0; i<keys.length; i++)
	{
		var d = decrypt(encrypted, keys[i].join(""));

		if ( d.every(function(x) { return charSet.has(x); }) )
		{
			sum = d.reduce(function(a, b) { return a + b; });
			break;
		}
	}
	
    return sum;
}

function decrypt(encrypted, key)
{
	var eLen = encrypted.length,
		kLen = key.length,
		decrypted = [];

	for (var i=0; i<eLen; i++)
	{
		decrypted.push(encrypted[i] ^ key.charCodeAt(i % kLen));
	}

	return decrypted;
}

module.exports.init = init;
