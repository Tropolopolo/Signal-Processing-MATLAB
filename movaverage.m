function seq = movaverage(series, N)
    n = length(series);
    k = n - N + 1;
    seqSum = 0;
    for i = k: n
        seqSum = seqSum + series(i);
    end
    
    seq = (1/N)*seqSum;
end