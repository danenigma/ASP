function X = generate_random_variables_iid(distribution,N)
X = zeros(1,N);
for i=1:N
    X(i) = discrete(distribution);
end
end