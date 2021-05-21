syms x y
f = x^3 * exp(-x^2 - y^4);
dfdx = @(x,y) 3*x^2*exp(-x^2-y^4) - 2*x^4*exp(-x^2-y^4);
dfdy = @(x,y) -4*x^3*y^3*exp(-x^2-y^4);
grad = gradient(f);
metro=norm(grad);
xy=[0 -1 1]; %we have same starting values for both x and y in all of i, ii, iii
e=0.01; %the error
fcontour(f)  
a = 0.001;
b = 0.25;
gamma = 2;
m = 1;
f = @(x,y) x.^3 * exp(-x.^2 - y.^4);
for j=1:3
    xk=xy(j);
    yk=xy(j);
    hold on
    plot(xk,yk,'x')
    metro1=double(subs(metro,{x,y},{xk,yk}));
    
    while metro1>e
        while 1 > 0
			xk1 = xk -dfdx(xk,yk)*gamma;
			yk1 = yk -dfdy(xk,yk)*gamma;
			if (f(xk1,yk1) <= f(xk,yk) + gamma * (b ^ m) * a * (dfdx(xk,yk)^2 + dfdy(xk,yk)^2))
				g=gamma;
				break;
			else
				gamma = gamma * b;
			end    
        end
        xk = xk - g*dfdx(xk,yk);
        yk = yk - g*dfdy(xk,yk);
        plot(xk,yk,'x')
        metro1=double(subs(metro,{x,y},{xk,yk}));
    end
end
