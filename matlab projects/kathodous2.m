syms x y
f =x^3 * exp(-x^2 - y^4);
grad = gradient(f);
metro=norm(grad); %it counts the norm of the grad function in the workspace
dfdx = @(x,y) 3*x^2*exp(- x^2 - y^4) - 2*x^4*exp(- x^2 - y^4);
dfdy = @(x,y) -4*x^3*y^3*exp(- x^2 - y^4);

xy=[0 -1 1]; %we have same starting values for both x and y in all of i, ii, iii
e=0.01; %the error
fcontour(f)  
gamma=zeros(3,5);
f = @(x,y) x.^3 * exp(-x.^2 - y.^4);
for j=1:3 %the 3 starting values for x and y
    xk=xy(j);
    yk=xy(j);
    hold on
    plot(xk,yk,'x')
      
    %now to find the γ(γαμμα)
    xg=@(g) xk - dfdx(xk,yk)*g;
    yg=@(g) yk - dfdy(xk,yk)*g;
    fg=@(g) f(xg(g),yg(g)); 
    g = fminsearch(fg,0);
    gamma(j,1) = g;
    %now the comparing
    metro1=double(subs(metro,{x,y},{xk,yk})); 
    k=2;
    while metro1>e
        xk=xk-g*dfdx(xk,yk);
        yk=yk-g*dfdy(xk,yk);
        hold on 
        plot(xk,yk,'x');
        %the norm and the derivatives change
        xg=@(g) xk - dfdx(xk,yk)*g;
        yg=@(g) yk - dfdy(xk,yk)*g;
        fg=@(g) f(xg(g),yg(g)); 
        g = fminsearch(fg,0);
        gamma(j,k) = g;
        k=k+1;
        metro1=double(subs(metro,{x,y},{xk,yk}));
    end
end

        
        
    
   
    
    