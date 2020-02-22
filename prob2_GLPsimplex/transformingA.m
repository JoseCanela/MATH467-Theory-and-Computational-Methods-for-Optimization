%% Inserting the Constraint A into A_trans
function [A_trans] = transformingA(mConstr,ndim,A_trans,A)
A_trans(1:mConstr,1:ndim) = A;
end