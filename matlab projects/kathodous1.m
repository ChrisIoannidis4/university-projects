syms x y
f = x^3 * exp(-x^2 - y^4);
dfdx = @(x,y) 3*x^2*exp(-x^2-y^4) - 2*x^4*exp(-x^2-y^4);
dfdy = @(x,y) -4*x^3*y^3*exp(-x^2-y^4);
grad = gradient(f);
metro=norm(grad);%it counts the norm of the grad function in the workspace
f=@(x,y) x^3*exp(- x^2 - y^4);
metro1=(abs(3*x^2*exp(- x^2 - y^4) - 2*x^4*exp(- x^2 - y^4))^2 + 16*exp(- 2*real(x^2) - 2*real(y^4))*abs(x)^6*abs(y)^6)^(1/2);
xy=[0 -1 1]; %we have same starting values for both x and y in all of i, ii, iii
e=0.01; %the error
gamma=0.1; %we choose this value for γ 
fcontour(f)  

for j=1:3 %the 3 starting values for x and y
    xk=xy(j);
    yk=xy(j);
    hold on
    plot(xk,yk,'x')
    metro1=double(subs(metro,{x,y},{xk,yk}));   
    while metro1>e
        xk=xk-gamma*dfdx(xk,yk);
        yk=yk-gamma*dfdy(xk,yk);
        hold on
        plot(xk,yk,'x')
        metro1=double(subs(metro,{x,y},{xk,yk})); 
    end
end
        
        

