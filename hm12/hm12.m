sigma_a = 2;
mu_a = 1;
p = 1/100;
q = 1-p;
phi = -0.5:0.1:0.5;
c=10;
sxx = sigma_a*(1-q)./(1+q^2-2*q*cos(2*3.14.*phi));
sxx0 = sigma_a*(1-q)/(1+q^2-2*q*cos(0));
sxx(6) = sxx0+ mu_a^2;%at zero
figure;
stem(phi,sxx,'x','DisplayName','SXX');
H_phi_sq = ((phi.^2)*(c^2)+(phi.^4)*(c^4))./((1+phi.^2*c^2).^2); 
syy = H_phi_sq.*sxx;
hold on;
stem(phi,syy,'DisplayName','SYY');
xlabel('phi');
ylabel('PSD');
legend('show');
title('Original and Filtered PSD')
figure;
plot(phi,sqrt(H_phi_sq));
xlabel('phi');
ylabel('H()');
title('Frequency response of the filter');