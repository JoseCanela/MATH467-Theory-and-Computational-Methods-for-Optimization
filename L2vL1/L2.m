%% L2 Approximation for y= ax+b
function p = L2(TNX,DJI)
N = length(TNX);
 
Q = [sum(2*dot(TNX,TNX)) sum(2*TNX); sum(2*TNX) 2*N];
b = [sum(2*dot(TNX,DJI)); sum(2*DJI)];

% Vector p =[a,b]
p = Q\b;
 
% Slope approx
disp('Slope Approx')
a = p(1)

%Intercept approx
disp('Intercept Approx');
b = p(2)

hold on 
grid on
scatter(TNX,DJI);
f = plot(TNX,a*TNX+b)
title('L2: TNX vs DJI')
xlabel('TNX')
ylabel('DJI')
hold off
    
end





