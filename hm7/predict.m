function x_k = predict(A,x_k_1,B,u_k)
% x(:,n+1)=a* x(:,n)+v;
% x_k = A*x_k_1+B*u_k;
% P_k = A*P_k_1*A' + Q;
v= [normrnd(0,0.04); normrnd(0,0.01)];
x_k = A*x_k_1 + B*u_k + v;
end