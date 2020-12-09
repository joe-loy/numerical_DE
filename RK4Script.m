function RK4Script
close
y0 = 0.2;
t0 = 0; tf = 20.;
h = 0.1;
[t, y] = RK4(@logistics, t0, tf, y0, h);
plot(t, y)
title('Solution of logistics equation, RK4,  K=10, r=0.5')
xlabel('time, t')
ylabel('Population, y')
axis([0 max(t) 0 12])
end

function yp = logistics(t,y)
    K = 10;
    r = 0.5;
    yp = r * (1 - y / K) * y;
end

function [t, y] = RK4(f, t0, tf, y0, h)
    t = t0:h:tf
    y = zeros(length(t), length(y0));
    y(1,:) = y0;
    for n = 1:length(t)-1
        k1 = f(t(n), y(n, :)');
        k2 = f(t(n) + .5*h, y(n,:)' + .5 * h * k1);
        k3 = f(t(n) + .5*h, y(n,:)' + .5 * h * k2);
        k4 = f(t(n+1), y(n,:)' + h * k3);
        y(n+1,:) = y(n,:)' + (1/6 * h * (k1 + 2*k2 + 2*k3 + k4));
    end
end
