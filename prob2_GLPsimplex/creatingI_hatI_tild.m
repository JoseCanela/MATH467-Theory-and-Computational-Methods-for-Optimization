%% Inserting I corresponding to m_hat and -I corresponding to m_tild into A_trans
function [A_trans] = creatingI_hatI_tild(mConstr,m_hat,m_tild,ndim,A_trans)
A_trans((mConstr+1):(mConstr+m_hat),(ndim+1):(ndim+m_hat)) = eye(m_hat);
A_trans((mConstr+m_hat+1):(mConstr+m_hat+m_tild),(ndim+m_hat+1):(ndim+m_hat+m_tild)) = -eye(m_tild);
end