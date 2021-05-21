%i use the syms to get the df/dx etc through the workspace
syms x y
f = x^3 * exp(-x^2 - y^4);

gradf = jacobian(f);
gradgradf = jacobian(gradf);
antistrofos = inv(gradgradf);
gradgradf2 = [gradf(1,1) ; gradf(1,2)];
d = antistrofos * gradgradf2;
metrof = norm(gradf);
xy=[0 -1 1]; %we have same starting values for both x and y in all of i, ii, iii
e=0.01; %the error
gamma=0.1; %we choose this value for γ
fcontour(f)
f = @(x,y) x.^3 * exp(-x.^2 - y.^4);
%the results for the search direction
katefx = @(x,y) (2*x^3*y^3*(- 2*y*x^2 + 3*y))/(6*x^6 + 4*x^4*y^4 - 21*x^4 + 6*x^2*y^4 + 9*x^2) - (exp(x^2 + y^4)*(3*x^2*exp(- x^2 - y^4) - 2*x^4*exp(- x^2 - y^4))*(4*y^4 - 3))/(2*(6*x^5 + 4*x^3*y^4 - 21*x^3 + 6*x*y^4 + 9*x));
katefy = @(x,y) (x^3*y^3*(2*x^4 - 7*x^2 + 3))/(6*x^7*y^2 + 4*x^5*y^6 - 21*x^5*y^2 + 6*x^3*y^6 + 9*x^3*y^2) - (exp(x^2 + y^4)*(3*x^2*exp(- x^2 - y^4) - 2*x^4*exp(- x^2 - y^4))*(- 2*y*x^2 + 3*y))/(2*(6*x^6 + 4*x^4*y^4 - 21*x^4 + 6*x^2*y^4 + 9*x^2));

for i = 1:3
    xk = xy(i);
    yk = xy(i);
    hold on 
    plot(xk,yk,'x')
    
    metro=double(subs(metrof,{x,y},{xk,yk}));   
    
    while metro > e
        
        
        xk = xk - gamma*katefx(xk,yk);
        yk = yk - gamma*katefy(xk,yk);
        hold on 
        plot(xk,yk,'x')
        metro=double(subs(metrof,{x,y},{xk,yk}));
         
    end
    
end

