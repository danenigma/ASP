function [X,R] = simMC(M,P,O)
X = zeros(1,M);%states
R = zeros(1,M);%observables
X(1) = discrete([0.5,0.5]);
R(1) = discrete(O(X(1),:));
for m=1:M-1
      X(m+1) = discrete(P(X(m),:));
      R(m+1) = discrete(O(X(m+1),:));
end
end