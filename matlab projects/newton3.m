syms x y
f = x^3 * exp(-x^2 - y^4);

gradf = jacobian(f);
gradgradf = jacobian(gradf);
antistrofos = inv(gradgradf);
gradgradf2 = [gradf(1,1) ; gradf(1,2)];
d = antistrofos * gradgradf2;
metro = norm(gradf);
xy=[0 -1 1]; %we have same starting values for both x and y in all of i, ii, iii
e=0.01; %the error
gradfx=@(x,y)3*x^2*exp(-x^2-y^4)-2*x^4*exp(-x^2-y^4);
gradfy=@(x,y)-4*x^3*y^3*exp(-x^2-y^4);
fcontour(f)
f = @(x,y) x.^3 * exp(-x.^2 - y.^4);
%the results for the search direction
katefx = @(x,y) (2*x^3*y^3*(- 2*y*x^2 + 3*y))/(6*x^6 + 4*x^4*y^4 - 21*x^4 + 6*x^2*y^4 + 9*x^2) - (exp(x^2 + y^4)*(3*x^2*exp(- x^2 - y^4) - 2*x^4*exp(- x^2 - y^4))*(4*y^4 - 3))/(2*(6*x^5 + 4*x^3*y^4 - 21*x^3 + 6*x*y^4 + 9*x));
katefy = @(x,y) (x^3*y^3*(2*x^4 - 7*x^2 + 3))/(6*x^7*y^2 + 4*x^5*y^6 - 21*x^5*y^2 + 6*x^3*y^6 + 9*x^3*y^2) - (exp(x^2 + y^4)*(3*x^2*exp(- x^2 - y^4) - 2*x^4*exp(- x^2 - y^4))*(- 2*y*x^2 + 3*y))/(2*(6*x^6 + 4*x^4*y^4 - 21*x^4 + 6*x^2*y^4 + 9*x^2));
gamma=2;
a = 0.001;
b = 0.25;
fcontour(f)
for j=1:3
    xk=xy(j);
    yk=xy(j);
    hold on
    plot(xk,yk,'x')
    metro1=double(subs(metro,{x,y},{xk,yk}));
    k=2;
     while metro1>e
        while 1 > 0
			xk1 = xk -katefx(xk,yk)*gamma;
			yk1 = yk -katefy(xk,yk)*gamma;
			if (f(xk1,yk1) <= f(xk,yk) - gamma * b * a * (katefx(xk,yk)*gradfx(xk,yk)+katefy(xk,yk)*gradfy(xk,yk)))
				g=gamma;
				break;
			else
				gamma = gamma * b;
            end    
        end
        xk = xk - g*katefx(xk,yk);
        yk = yk - g*katefy(xk,yk);
        hold on
        plot(xk,yk,'x')
        metro1=double(subs(metro,{x,y},{xk,yk}));
     end
end

    
