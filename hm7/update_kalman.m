function [x_k,P_k] = update_kalman(P_k_1,H,R,z_k,x_k_hat)
K_k   = P_k_1*H'*inv((H*P_k_1*H'+R));
x_k   = x_k_hat + K_k*(z_k-H*x_k_hat);
P_k   = (eye(2,2)-K_k*H)*P_k_1;
end