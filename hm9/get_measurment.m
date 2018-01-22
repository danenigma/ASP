function [X_k,Z_k] = get_measurment(X_k_1,u_k,n)
A = [0.96,0.04;0,1];
H = eye(2);
B = [-0.2;0];
V = [normrnd(0,1.5);normrnd(0,1.5)];
W = [normrnd(0,0.03);normrnd(0,0.02)];

X_k = A*X_k_1 + [0;0.14*sin((2*pi/300)*n)] + B*u_k + W ;
Z_k = H*X_k + V ;

end