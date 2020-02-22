
%% Problem 1: Implementation of the basic simplex algorithm
function [Solution,BasicVar,Status] = simplex_imp(A,b,c)

% Usage: [Solution,BasicVar,Status]=simplex_imp(A,b,c)
%   Inputs:
%       A         : Array of dimension m by n for the equality constraints
%                   Ax=b.
%       b         : Vector of dimension m for the right hand side of the
%                   equality constraints. 
%       c         : The weights for the cost functional.
%      
%   Outputs:                
%       Solution  : Optimal solution when exists.
%       BasicVar  : Indices of basis variables for the solution.
%       Status    : Status of the solution. Status = 0 if the solution is
%                   optimal. Status = -1 if no optimal solution exits.
 
% Line 20 - 28 are code from professor's basic simplex alg
[mConstr,ndim]=size(A);
 
% Initial indices of basis variables for the solution. 
BasicVar0 = [1:mConstr];
% Basis of A
A_basic = A(:,BasicVar0);

%According to matlab A\b is more accurate than inv(A)*b
x_A_basic = A_basic\b';

% Index denoting the rows that we are searching through for the matrix on 
% line 36.
i = 1;

%Indices of columns
v = 1:ndim;

% Matrix of different combinations of the indices for BasicVar0 
B = nchoosek(v,mConstr); %According to Matlab Documentation,
                              %"C = nchoosek(v,k) returns a matrix 
                              %containing all possible combinations of 
                              %the elements of vector v taken k at a time. 
                              %Matrix C has k columns and n!/((n?k)! k!) 
                              %rows, where n is length(v)."

% This section a mirror image of the type of operation the professor did.
%Essentially we are trying to determine what will be the BasicVar0 we use.
while min(x_A_basic)<0
    BasicVar0 = B(i,:);
    A_basic = A(:,BasicVar0);
    x_A_basic = A_basic\b;
    i = i+1;
end
%Implementing professor's basic simplex algorithm! 
[Solution,BasicVar,Status]=basicsimplex(A,b,c,BasicVar0);
 
end
