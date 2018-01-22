function A = display_states(states)

disp('states:');
for i=1:length(states)
    if states(i)==1 
            fprintf('B');
            if ne(i,length(states))
            fprintf('->');
            end
    else
            fprintf('E');
            if ne(i,length(states))
            fprintf('->');
            end
    end
end
fprintf('\n');
A =0;
end