
%**************************(b)**********************
N = 100;
Yns_b = zeros(N,1);
mu     = mean(1:5);%mean of uniform dist
sigma  = var(1:5);%var of uniform dist
for i=1:length(Yns_b)
    X = randi([1 5],1,10);
    Yns_b(i) = computeGCLT(X,mu*ones(1,10),sigma*ones(1,10));
end
figure 
Yns_b = Yns_b/sum(Yns_b);
hist(Yns_b);
title('b')
figure
qqplot(Yns_b);
title('b')
%**************************(c)**********************
N = 1000;
Yns_c = zeros(N,1);
for i=1:length(Yns_c)
    [X,mu,sigma]=generate_random_variables(10);
    Yns_c(i) = computeGCLT(X,mu,sigma);
end
Yns_c = Yns_c/sum(Yns_c);
figure;
hist(Yns_c);
title('c')
figure
qqplot(Yns_c);
title('c')
%**************************(c)**********************
N = 1000;
Yns_d = zeros(N,1);
for i=1:length(Yns_d)
    [X,mu,sigma]=generate_random_variables_d(10,0.5);
    Yns_d(i) = computeGCLT(X,mu,sigma);
end
figure;
Yns_d = Yns_d/sum(Yns_d);
hist(Yns_d);
title('d')
figure
qqplot(Yns_d);
title('d')
