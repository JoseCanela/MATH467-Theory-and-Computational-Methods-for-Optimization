%% Inserting A_tild Constraint into A_trans
function [A_trans] = transformingA_tild(mConstr,m_hat,m_tild,ndim,A_trans,A_tild)
A_trans((mConstr+m_hat+1):(mConstr+m_hat+m_tild),1:ndim) = A_tild;
end
