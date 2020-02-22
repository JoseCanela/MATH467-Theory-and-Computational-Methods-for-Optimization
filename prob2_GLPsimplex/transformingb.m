%% Inserting b Constraint into b_trans
function [b_trans] = transformingb(mConstr,b_trans,b)
b_trans(1:mConstr) = b;
end