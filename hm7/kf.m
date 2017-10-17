A = [0.95,-0.05;0,1];
C = [1,0;0,1];
Q = [0.2;0.1];
R = [2;1];
SV = Q*Q';
SW = R*R';
N = 2;
M = length(A);
X = zeros(M,N);
Xh = X;
H = zeros(M,M);
K = H;
X(:,1) = [25;25];
for n=1:N-1
        V = normrnd(0,Q);
        W = normrnd(0,R);
        X(:,n+1) = A*X(:,n)+getB_k(n)*[0,1]' + V;
        Y = C*X(:,n+1) + W;   
        
        S = A*H*A' + SV;
        
        K = S*C'*(C*S*C'+SW)^(-1);
        
        H = (1-K*C)*S;
        Xh(:,n+1) = (A- K*C*A)*Xh(:,n) + K*Y;
end

%{
(c)
UK() holder for plotting
if qfunc((28-x_estimate)/sd of estimate)>0.1
    u_k = u_k_1;
else
    u_k = u_k_0;
end
3.
if mc outputs p don't do fusion
else fusion

3.
alpha = 0.1;
beta = 0.7;
P = [1-alpha,alpha;1-beta,beta];
state = 1;
state = discrete(P(state,:));%predict the next state
for 1000;
    while Mc=M:
            get measurement and fuse
          
 

%}