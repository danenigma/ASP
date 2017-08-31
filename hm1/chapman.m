function [R,chap_kol] = chapman(P,N,start,ending)
len_p = size(P);
R = zeros(len_p(1),len_p(1),N);
%P = [0.3 0.7 0;0.1 0.4 0.5;1 0 0];
R(:,:,1)=P;
for n=2:N
    for i=1:len_p(1)
     for j=1:len_p(1)  
        accum=0;
        for k=1:len_p(1)
         accum = accum+R(i,k,n-1)*P(k,j);   
        end
        R(i,j,n) = accum;
     end
    end
end
chap_kol = R(start,ending,:);
end
