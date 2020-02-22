%% L1 Approximation for y = ax+b
function [a,b] = L1(TNX,DJI,linear_relationship,intercept_position)

% Initializing Parameter values for computation speed
mConstr = length(TNX); 
BasicVar0 = 1:mConstr;
A_L1 = zeros(mConstr,(2*mConstr+2)); %matrix A
c = ones((2*mConstr+2),1); %coefficients are full of 1s


% creatingMatrix A
A_L1 = creatingmatrixA_L1(mConstr,A_L1,TNX,linear_relationship,intercept_position);

%Implements professor's simplex method to find a and b 
[Solution,BasicVar,Status] = basicsimplex(A_L1,DJI,c,BasicVar0);

% Slope approx
disp('Slope Approx')
a = linear_relationship*Solution(2*mConstr+1)

%Intercept approx
disp('Intercept Approx');
b = intercept_position*Solution(2*mConstr+2)

hold on
grid on
scatter(TNX,DJI);
g = plot(TNX,a*TNX+b)
title('L1: TNX vs DJI')
xlabel('TNX')
ylabel('DJI')
hold off
    
end
