
%***********************************(a)********************************
DEBUG = 0;
Rb = 1000;%Kbps
Nb = 100;%max number of users
Pb = 0.3;%probability of being active
[linkBinoPdf,linkBinoCdf,data_rate_range_95,mub]=compute_data_rate_range_and_mean(Nb,Pb,Rb);
figure;
stem(0:Nb,linkBinoPdf);
fprintf('(a)\n  The average number active users for the base design is : %2.2f \n',mub);
hold on;
plot(0:Nb,linkBinoCdf);
hold off;
fprintf('  The data rates that will be experienced by users 95 percent of the time range from %i kbps to %i kbps\n',...
    data_rate_range_95(1),data_rate_range_95(2));

%***********************************(b)********************************
%mu1 = mub -> N1P1 = NbPb -> P1 = NbPb/N1
Rb = 1000;%Kbps
N1 = 100:100:10000;
data_rate_ranges = zeros(length(N1),3);

for i = 1:length(N1)
  
    P1 = Nb*Pb/N1(i);% P1 ->0
    [linkBinoPdf,linkBinoCdf,data_rate_range_95,mu1]=compute_data_rate_range_and_mean(N1(i),P1,Rb);
    data_rate_ranges(i,:) = [P1,data_rate_range_95];
    
    if DEBUG
        fprintf('The average number active users for Design 1 is : %2.2f \n',mu1);
        fprintf('The data rates that will be experienced by users 95 percent of the time ranges from %i kbps to %i kbps\n',...
        data_rate_range_95(1),data_rate_range_95(2));
    end
end
figure;
plot(N1,data_rate_ranges(:,2),'DisplayName','Lower Limit');
hold on;
plot(N1,data_rate_ranges(:,3),'DisplayName','Upper Limit');
hold off;
legend('show');
xlabel('N1')
ylabel('Data Rate(kbps)');
title('Data Rate Range Vs Number of Users')
ylim([0,100]);
fprintf('(b)\n  The average number active users for the base design is : %2.2f \n',mu1);
fprintf('  The data rates that will be experienced by users 95 percent of the time ranges from %i kbps to %i kbps\n',...
data_rate_range_95(1),data_rate_range_95(2));

%***********************************(c)********************************
c = 10;
R2 = c*Rb;
P2 = Pb;
N2 = c*100;
[linkBinoPdf,linkBinoCdf,data_rate_range_95,mu1]=compute_data_rate_range_and_mean(N2,P2,R2);
fprintf('(c)\n  The average number active users for Design 2 when c =%i is : %2.2f \n',c,mu1);
fprintf('  The data rates that will be experienced by users 95 percent of the time ranges from %i kbps to %i kbps\n',...
data_rate_range_95(1),data_rate_range_95(2));
%***********************************(d)********************************
c = 1:10:1000;
data_rate_ranges = zeros(length(c),3);

for i = 1:length(c)
    R2 = c(i)*Rb;
    P2 = Pb;
    N2 = c(i)*100;
    [linkBinoPdf,linkBinoCdf,data_rate_range_95,mu1]=compute_data_rate_range_and_mean(N2,P2,R2);
    data_rate_ranges(i,:) = [c(i),data_rate_range_95];
    
    if DEBUG
        fprintf('The average number active users for Design 1 is : %2.2f \n',mu1);
        fprintf('The data rates that will be experienced by users 95 percent of the time ranges from %i kbps to %i kbps\n',...
        data_rate_range_95(1),data_rate_range_95(2));
    end
end

figure;
plot(c,data_rate_ranges(:,2),'DisplayName','Lower Limit');
hold on;
plot(c,data_rate_ranges(:,3),'DisplayName','Upper Limit');
legend('show');
ylim([0,100]);
xlabel('c(scale factor)')
ylabel('Data Rate(kbps)');
title('Data Rate Range Vs Scale Factor(c)');
hold off;
fprintf('(d)\n  The average number active users for Design 2 is : %2.2f \n',mu1);
fprintf('  The data rates that will be experienced by users 95 percent of the time ranges from %i kbps to %i kbps\n',...
data_rate_range_95(1),data_rate_range_95(2));


