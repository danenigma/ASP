function [discounted_rewards,rewards] = get_reward_on_state_trans(state_trans,state_1,state_2,P,edge_num)
    rewards = 0;
    discounted_rewards = 0;
    for i=1:(length(state_trans)-1)
        if(state_trans(i)== state_1 && state_trans(i+1)==state_2)
                if discrete(P) == edge_num % coin flip
                    discounted_rewards = discounted_rewards + 1;
                end
                rewards = rewards +1;
        end

    end

end