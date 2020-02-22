
%% Problem 2:Implementation of general LP alg.
function [Solution,BasicVar,Status] = GEN_simplex_imp(A,b,c,A_hat,b_hat,A_tild,b_tild)
%
% Usage: [Solution,BasicVar,Status]= GEN_simplex_imp(A,b,c,A_hat,b_hat,A_tild,b_tild)
%   Inputs:
%       A         : Array of dimension m by n for the equality constraints
%                   Ax=b.
%       b         : Vector of dimension m for the right hand side of the
%                   equality constraints. 
%       c         : The weights for the cost functional.
%
%       A_hat      : Array of dimension m_hat by n for the inequality constraint
%                   Ax<=b.
%       b_hat      : Vector of dimension m_hat for the right hand side of the
%                   inequality constraint Ax<=b. 
%       A_tild      : Array of dimension m_tild by n for the inequality constraint
%                   Ax>=b.
%       b_tild      : Vector of dimension m_tild for the right hand side of the
%                   inequality constraint Ax>=b. 
%   Outputs:                
%       Solution  : Optimal solution when exists.
%       BasicVar  : Indices of basis variables for the solution.
%       Status    : Status of the solution. Status = 0 if the solution is
%                   optimal. Status = -1 if no optimal solution exits.
 
[mConstr,ndim] = size(A); 
m_hat = length(b_hat);
m_tild = length(b_tild);
c_trans = zeros((ndim+m_hat+m_tild),1);

A_trans = zeros((mConstr+m_hat+m_tild),(ndim+m_hat+m_tild));
b_trans = zeros((mConstr+m_hat+m_tild),1);

% Transformation of A's
A_trans = transformingA(mConstr,ndim,A_trans,A) +...
transformingA_hat(mConstr,m_hat,ndim,A_trans,A_hat) +...
transformingA_tild(mConstr,m_hat,m_tild,ndim,A_trans,A_tild) +...
creatingI_hatI_tild(mConstr,m_hat,m_tild,ndim,A_trans)

% Transformation of b's
b_trans = transformingb_hat(mConstr,m_hat,b_trans,b_hat) +...
    transformingb_tild(mConstr,m_hat,m_tild,b_trans,b_tild) +...
    transformingb(mConstr,b_trans,b)

% Transformation of c 
c_trans(1:ndim) = c

% Get Solution x*
[Solution,BasicVar,Status] = simplex_imp(A_trans,b_trans,c_trans);
end

