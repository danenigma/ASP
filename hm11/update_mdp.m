function [VM,policy] = update_mdp(VM_1)
actions = 1:4;
policy = zeros(3,4);
VM = VM_1;
number_of_cols = 4;
number_of_rows = 3;

for row=1:number_of_rows
    for col=1:number_of_cols
    if (row==2 && col ==2) || (row==1 && col==4) || (row==2 && col==4)
    else

        best_action = 0;
        bestvx = -inf;
        vx = 0;
        for act=1:length(actions)
            if (act==1)%right
               if is_valid(row,col+1)%if not wall
                  vx = -0.04 + 0.8*VM_1(row,col+1); 
                  disp('I AM HERE!!############################################# ')
               else
                  vx = -0.04 + 0.8*VM_1(row,col);  
               end
               if is_valid(row-1,col)%up
                  vx = vx + 0.1*VM_1(row-1,col) ;
               else
                  vx =vx + 0.1*VM_1(row,col);
               end
               if is_valid(row+1,col)%down
                   vx = vx+ 0.1*VM_1(row+1,col);
               else
                   vx = vx + 0.1*VM_1(row,col);
               end

            end
            if (act==2)%left
               if is_valid(row,col-1)%if not wall
                  vx = -0.04 + 0.8*VM_1(row,col-1); 
               else
                  vx = -0.04 + 0.8*VM_1(row,col);  
               end
               if is_valid(row-1,col)%up
                  vx =vx + 0.1*VM_1(row-1,col) ;
               else
                  vx =vx + 0.1*VM_1(row,col);
               end
               if is_valid(row+1,col)%down
                   vx = vx+ 0.1*VM_1(row+1,col);
               else
                   vx = vx + 0.1*VM_1(row,col);
               end

            end
            if (act==3)%up
               if is_valid(row-1,col)%if not wall
                  vx = -0.04 + 0.8*VM_1(row-1,col); 
               else
                  vx = -0.04 + 0.8*VM_1(row,col);  
               end
               if is_valid(row,col-1)%left
                  vx =vx + 0.1*VM_1(row,col-1) ;
               else
                  vx =vx + 0.1*VM_1(row,col);
               end
               if is_valid(row,col+1)%right
                   vx = vx+ 0.1*VM_1(row,col+1);
               else
                   vx = vx + 0.1*VM_1(row,col);
               end

            end
            if (act==4)%down
               if is_valid(row+1,col)%if not wall
                  vx = -0.04 + 0.8*VM_1(row+1,col); 
               else
                  vx = -0.04 + 0.8*VM_1(row,col);  
               end
               if is_valid(row,col-1)%left
                  vx =vx + 0.1*VM_1(row,col-1) ;
               else
                  vx =vx + 0.1*VM_1(row,col);
               end
               if is_valid(row,col+1)%right
                   vx = vx+ 0.1*VM_1(row,col+1);
               else
                   vx = vx + 0.1*VM_1(row,col);
               end

            end

            if vx>bestvx
                   bestvx  = vx;
                   best_action = act;
            end

        end
        policy(row,col) = best_action;
        VM(row,col) = bestvx;
    end
    
            end
        end
end


