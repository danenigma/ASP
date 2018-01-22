function T = discrete(P)
Pnorm = [0 P]/sum(P);
Pcum  = cumsum(Pnorm);

R = rand(1);
[~,T] = histc(R,Pcum);
end
