
const FINISHED = false;

function backtrack(a, k, n) {

    var c = [];
    var nCandidates;
    var i;

    if (isSolution(a, k, n)) {
        processSolution(a, k, n);
    } else {
        k++;
        constructCandidates(a, k, n, c, nCandidates);
        for (var i=0; i<nCandidates; i++) {
            a[k] = c[i];
            backtrack(a, k, n);
            if (FINISHED) return;
        }
    }

}



