test = (1:100);
P_m = zeros(length(test),1);
P_m_A = zeros(length(test),1);
p = 0.9;
N = 20;
for i=1:length(test)
    P_m(i) = get_PTC(p,i,N);
    P_m_A(i) = get_PTA(p,i,N);
end
inti = P_m.*test';
cdfa = cumsum(P_m_A);
cdfc = cumsum(P_m);
muTc = sum(P_m.*test')*100;
muTa = sum(P_m_A.*test')*100;

