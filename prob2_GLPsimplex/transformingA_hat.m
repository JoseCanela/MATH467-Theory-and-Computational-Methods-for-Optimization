%% Inserting A_hat Constraint into A_trans
function [A_trans] = transformingA_hat(mConstr,m_hat,ndim,A_trans,A_hat)
A_trans((mConstr+1):(mConstr+m_hat),1:ndim) = A_hat;
end
