%% Creating matrix A for L1 Reg
function [A_L1] = creatingmatrixA_L1(mConstr,A_L1,x,slope_direction,intercept_position)
for i = 1:mConstr
        A_L1(i,i) = 1;
        A_L1(i,(i+1)) = -1;
        if slope_direction<0
        A_L1(i,(2*mConstr+1)) = -x(i);
        else 
            A_L1(i,(2*mConstr+1)) = x(i);
        end
        if intercept_position<0
        A_L1(i,(2*mConstr+2)) = -1;
        else
            A_L1(i,(2*mConstr+2)) = 1;
        end
end
end
