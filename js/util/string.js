"use strict";

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

module.exports.isPalindrome = isPalindrome;