function backwardEulerScript
close
y0 = 0.2;
t0 = 0; tf = 20.;
h = 0.1;
[t, y] = backwardEuler(@logistics, t0, tf, y0, h);
plot(t, y)
title('Solution of logistics equation, K=10, r=0.5')
xlabel('time, t')
ylabel('Population, y')
axis([0 max(t) 0 12])
end

function yp = logistics(t,y)
    K = 10;
    r = 0.5;
    yp = r * (1 - y / K) * y;
end

%buggy
function [t, y] = backwardEuler(f, t0, tf, y0, h)
    t = t0:h:tf;
    y = zeros(length(t));
    y(1) = y0;
    t(1) = t0;
    n = 1;
    while t(n) < tf
       t(n+1) = t(n) + h;
       y(n+1) = (y(n) + h * f(t(n+1, y(n+1))));
       n = n+1;
    end
end