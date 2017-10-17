function X = simMC(M,A,P)
X = zeros(1,M);
X(1) = A;
for m=1:M-1
      X(m+1) = discrete(P(X(m),:));
end
end