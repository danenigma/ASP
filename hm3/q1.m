
%(a)
DEBUG = 0;
Rb = 1000;%Kbps
Nb = 100;%max number of users
Pb = 0.3;%probability of being active
[linkBinoPdf,linkBinoCdf,data_rate_range_95,mub]=compute_data_rate_range_and_mean(Nb,Pb,Rb);
figure;
stem(0:Nb,linkBinoPdf);
fprintf('The average number active users our base design is : %2.2f \n',mub);
hold on;
plot(0:Nb,linkBinoCdf);
hold off;
fprintf('The data rates that will be experienced by users 95 percent of the time range from %i kbps to %i kbps\n',...
    data_rate_range_95(1),data_rate_range_95(2));

%(b)
%mu1 = mub -> N1P1 = NbPb -> P1 = NbPb/N1
Rb = 1000;%Kbps
N1 = 100:100:10000;
data_rate_ranges = zeros(length(N1),2);

for i = 1:length(N1)
  
    P1 = Nb*Pb/N1(i);% P1 ->0
    [linkBinoPdf,linkBinoCdf,data_rate_range_95,mu1]=compute_data_rate_range_and_mean(N1(i),P1,Rb);
    data_rate_ranges(i,:) = data_rate_range_95;
    
    if DEBUG
    fprintf('The average number active users for Design 1 is : %2.2f \n',mu1);
    fprintf('The data rates that will be experienced by users 95 percent of the time ranges from %i kbps to %i kbps\n',...
        data_rate_range_95(1),data_rate_range_95(2));
    end
end