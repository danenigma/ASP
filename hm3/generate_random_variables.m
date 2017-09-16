function [X,Mean,Var] = generate_random_variables(N)
X = zeros(1,N);
Mean = zeros(1,N);
Var = zeros(1,N);
for i=1:N
    X(i) = randi([1 i],1,1);
    Mean(i) = mean(1:i);
    Var(i)  = var(1:i);
end
end