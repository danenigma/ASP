function [x_k,P_k] = update_kalman(P_k_1,H,R,z_k,x_k)
K_k   = P_k_1*H'*inv((H*P_k_1H'+R));
x_k   = x_k + K_k(z_k-H*x_k);
P_k   = (I-K_k*H)*P_k_1;
end