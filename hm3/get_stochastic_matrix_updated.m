function P = get_stochastic_matrix_updated(buffer_size,lamda,mu)
    P = zeros(buffer_size+1,buffer_size+1);
    a = lamda*(1-mu);
    b = mu*(1-lamda);
    c = 1-(a+b);
    P(1,1) = 1-a;
    P(1,2) = a;
    P(buffer_size+1,buffer_size+1) = c+a;
    P(buffer_size+1,buffer_size)   = b;
    for i=2:buffer_size
        P(i,i) = c;
        P(i,i+1) = a;
        P(i,i-1) = b;
    end

end