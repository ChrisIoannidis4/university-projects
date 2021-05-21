syms x y
f = x^3 * exp(-x^2 - y^4);
gradf = jacobian(f);
gradgradf = jacobian(gradf);
metro = norm(gradf);
mk=0.1;
gamma=0.1;
dfdx=@(x,y) 3*x^2*exp(-x^2-y^4)-2*x^4*exp(-x^2-y^4);
dfdy=@(x,y) -4*x^3*y^3*exp(-x^2-y^4);
I=eye(2);
f=@(x,y) x.^3*exp(-x.^2-y.^4);
A=gradgradf+mk*I;
xy=[ 0 -1 1];
e=0.01;
for j = 1:3
    fcontour(f)
    xk = xy(j);
    yk = xy(j);
    hold on 
    plot(xk,yk,'x')
    B=double(subs(A, {x,y}, {xk,yk}));
    katefxy = double(subs(gradf, {x,y}, {xk,yk}));
    d=-(katefxy/B);
    metro1=double(subs(metro,{x,y},{xk,yk})); 
            
    while metro1 > e
        
        while any(eig(B)<0)
           mk=mk*2;
           A=gradgradf2+mk*I;
           B=double(subs(A, {x,y}, {xk,yk}));
        end  
        
        xk = xk - gamma*d(1,1);
        yk = yk - gamma*d(1,2);
        hold on 
        plot(xk,yk,'x')
        katefxy = double(subs(gradf, {x,y}, {xk,yk}));
        metro1=double(subs(metrof,{x,y},{xk,yk}));
        d=-(katefxy/B);
         
    end
    
end



    
 