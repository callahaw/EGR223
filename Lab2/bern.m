function prob = bern(k, N, p)
    q = 1 - p;
    if( k < 0 || N <= 0 || k > N)
        disp('Ope, Invalid input!\n');
        return
    else
        prob = factorial(N)/(factorial(k) * factorial(N-k))*p^k*q^(N-k);
    end
end