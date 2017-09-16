function [mu_found,load_mu,state_trans,lost_packets] = get_mu(N,State0,lambda,mu,buffer_size,percentage,load)
    mu_found = 0;
    a = lambda*(1-mu);
    b = mu*(1-lambda);
    c = 1-(a+b);
    load_mu = 0;
    if strcmp(load,'low') %low load 

        for i=1:length(mu)
            P = get_stochastic_matrix(buffer_size,lambda,mu(i));
            state_trans = simMC(N,State0,P);
            [lost_packets,~ ]= get_reward_on_state_trans(state_trans,buffer_size+1,buffer_size+1,[a,c],1);
            lost_packets = (lost_packets/N)*100;
            if lost_packets<percentage
                load_mu  = mu(i);
                mu_found = 1;
                break;
            end
        end
    end

end