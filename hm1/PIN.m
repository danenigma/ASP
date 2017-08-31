function mat = PIN(pi0,P,n)
len_pi = size(pi0);

mat  = zeros(n,len_pi(2));
    for i=1:n
        mat(i,:) = PI(pi0,P,i); 
    end
end