%% Inserting b_hat Constraint into b_trans
function [b_trans] = transformingb_hat(mConstr,m_hat,b_trans,b_hat)
b_trans((mConstr+1):(mConstr+m_hat)) = b_hat;
end