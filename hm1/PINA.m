function pina = PINA(pi0,P,n)
    len_pi = size(pi0);
    pina  = zeros(n,len_pi(2));
    pina(1,:) = pi0*P;
    for i=2:n
        pina(i,:) = pina(i-1,:)*P; 
    end
end