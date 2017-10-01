function P_m = get_prob_success(p,m,N)
        P_m = (1-(1-p)^m)^N;
end 