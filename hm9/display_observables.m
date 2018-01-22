function A = display_observables(observables)
disp('observables');
for i=1:length(observables)
    if observables(i)==1 
            fprintf('C');
            if ne(i,length(observables))
            fprintf('->');
            end
    else
            fprintf('W');
            if ne(i,length(observables))
            fprintf('->');
            end
    end
end
fprintf('\n');
A = 0;
end