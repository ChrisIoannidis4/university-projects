syms x1 x2
f = 0.5 * (x1^2) + 0.5* (x2^2); %fmin=0
grad = gradient(f);
metro=norm(grad);
f=@(x1,x2) 0.5 * (x1^2) + 0.5* (x2^2);
dfdx=@(x1,x2) x1;
dfdy=@(x1,x2) x2;
e=0.01;
gamma= 0.01;
sk=0.1;
x11 = 11;
x21 = 3;%starting points
metro1=double(subs(metro,{x1,x2},{x11,x21}));
fcontour(f)
hold on
plot(x11,x21,'x') %starting values on the plot

while metro1>e
    test1= x11-gamma*sk*dfdx(x11,x21);
    test2= x21-gamma*sk*dfdy(x11,x21);
    
    if test1<-20
        x1pavla=-20;
    elseif test1>10
        x1pavla=10;
    else
        x1pavla=x11-sk*dfdx(x11,x21);
    end
    
    if test2<-12
        x2pavla=-12;
    elseif test2>15
        x2pavla=15;
    else
        x2pavla=x21-sk*dfdy(x11,x21);
    end
    
    
    x11= x11+ gamma*(x1pavla-x11);
    x21= x21+ gamma*(x2pavla-x21);
    
    hold on
    plot(x11,x21,'x')
    metro1=double(subs(metro,{x1,x2},{x11,x21}));
end