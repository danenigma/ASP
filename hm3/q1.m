
%(a)
possibleNumberOfUsers = 0:100;%number of users 0-100
Rb = 1000;%Kbps
Nb = 100;%max number of users
Pb = 0.3;%probability of being active
linkBinoPdf = binopdf(possibleNumberOfUsers,Nb,Pb);%get a binomial dist 
stem(possibleNumberOfUsers,linkBinoPdf);%ploting pdf
mub = sum(linkBinoPdf.*possibleNumberOfUsers);% compute the mean of the base design
fprintf('The average number active users our base design is : %2.2f \n',mub);
linkBinoCdf = binocdf(possibleNumberOfUsers,Nb,Pb);% compute the cdf
hold on;
plot(possibleNumberOfUsers,linkBinoCdf);
hold off;
number_of_u_95  = possibleNumberOfUsers(min(find(linkBinoCdf>=0.95)));
number_of_u_5   = possibleNumberOfUsers(max(find(linkBinoCdf<=0.05)));
data_rate_range = [round(Rb/number_of_u_95),round(Rb/number_of_u_5)];
fprintf('The data rates that will be experienced by users 95 percent of the time range from %i kbps to %i kbps\n',...
    data_rate_range(1),data_rate_range(2));

%(b)
