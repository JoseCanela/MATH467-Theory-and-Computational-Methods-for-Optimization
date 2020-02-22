%% %% Inserting b_tild Constraint into b_trans
function [b_trans] = transformingb_tild(mConstr,m_hat,m_tild,b_trans,b_tild)
b_trans((mConstr+m_hat+1):(mConstr+m_hat+m_tild)) = b_tild;
end
