function [X,Mean,Var] = generate_random_variables_d(N,p)
    X = zeros(1,N);
    Mean = zeros(1,N);
    Var = zeros(1,N);
    for i=1:N
        X(i)    = (discrete([p,1-p])-1)/2^i;
        Mean(i) = p/2^i;
        Var(i)  = p*(1-p)/4^i;
    end
end