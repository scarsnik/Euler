"use strict";

backtracking(3);


function backtracking(n)
{
    var finished = false,
        a = [],          
        c = [],          /* candidates for next position */
        nCandidates = 0; /* next position candidate count */

    bt(a, 0, n);

    function bt(a, k, input)
    {
        if (isSolution(a, k, input))
        {
            processSolution(a, k, input);
        }
        else
        {
            k++;
            constructCandidates(a, k, input);

            for (var i=0; i<nCandidates; i++)
            {
                a[k] = c[i];
                bt(a, k, input);

                if (finished) return;
            }
        }
    }

    function isSolution(a, k, n)
    {
        return k == n;
    }

    function constructCandidates(a, k, n)
    {
        c[0] = true;
        c[1] = false;
        nCandidates = 2;
    }

    function processSolution(a, k)
    {
        var i, 
            elements = [];

        for (i=1; i<=k; i++)
        {
            if ( a[i] ) 
            {
                elements.push(i)
            }
        }

        console.log(elements);
    }
   
}




function Backtracking(isSolution, constructCandidates, processSolution)
{
    var finished = false,
        a = [],          
        c = [],          /* candidates for next position */
        nCandidates = 0; /* next position candidate count */

    var solution

    bt(a, 0, n);

    function bt(a, k, input)
    {
        if (isSolution(a, k, input))
        {
            processSolution(a, k, input);
        }
        else
        {
            k++;
            constructCandidates(a, k, input);

            for (var i=0; i<nCandidates; i++)
            {
                a[k] = c[i];
                bt(a, k, input);

                if (finished) return;
            }
        }
    }

    this.isSolution(a, k, n)
    {
        return k == n;
    }

    function constructCandidates(a, k, n)
    {
        c[0] = true;
        c[1] = false;
        nCandidates = 2;
    }

    function processSolution(a, k)
    {
        var i, 
            elements = [];

        for (i=1; i<=k; i++)
        {
            if ( a[i] ) 
            {
                elements.push(i)
            }
        }

        console.log(elements);
    }
   
}
