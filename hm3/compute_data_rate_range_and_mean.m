
function [linkBinoPdf,linkBinoCdf,data_rate_range_95,mu] = compute_data_rate_range_and_mean(N,P,Rb)
    possibleNumberOfUsers = 0:N;
    linkBinoPdf = binopdf(possibleNumberOfUsers,N,P);%get a binomial dist 
    mu = sum(linkBinoPdf.*possibleNumberOfUsers);% compute the mean of the base design
    linkBinoCdf = binocdf(possibleNumberOfUsers,N,P);% compute the cdf
    number_of_u_95  = possibleNumberOfUsers(find(linkBinoCdf>=0.975, 1 ));
    number_of_u_5   = possibleNumberOfUsers(find(linkBinoCdf<=0.025, 1, 'last' ));
    data_rate_range_95 = [round(Rb/number_of_u_95),round(Rb/number_of_u_5)];
end