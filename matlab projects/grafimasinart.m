f= @(x,y) x^3 * exp(-x^2 - y^4);
figure(1)
fsurf(f) %in 3 dimensions

figure(2)
fcontour(f) %in 2 dimensions