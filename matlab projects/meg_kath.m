syms x1 x2
f = 0.5 * (x1^2) + 0.5* (x2^2); %fmin=0
grad = gradient(f);
metro=norm(grad);
f=@(x1,x2) 0.5 * (x1^2) + 0.5* (x2^2);
dfdx=@(x1,x2) x1;
dfdy=@(x1,x2) x2;
e=0.01;
gamma=[0.1 1 2 10];
for j=1:4
    x11=2;
    x21=2; %starting points
    k=0;
    figure
    fcontour(f)
    hold on
    plot(x11,x21,'x') 
    metro1=double(subs(metro,{x1,x2},{x11,x21}));
    while metro1>e
        x11=x11-gamma(j)*dfdx(x11,x21);
        x21=x21-gamma(j)*dfdy(x11,x21);
        hold on
        plot(x11,x21,'x') 
        if x11 < 0 || x21 <0       %because (0,0) is the minf, and it will keep going lower in vain.
        break
        else
        metro1=double(subs(metro,{x1,x2},{x11,x21}));
        k=k+1;
        end
    end
    
    
end