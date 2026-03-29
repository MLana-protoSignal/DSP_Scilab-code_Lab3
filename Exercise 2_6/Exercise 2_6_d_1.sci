n = -10:10;
xn = zeros(1, length(n));
xn(1) = 1;
xn(2) = 1;
xn(3) = 1;
xn(4) = 1;
xorigin = 1;
yn = zeros(1, length(n));
i=1;
while i<=length(yn)
    yn(i) = (i-xorigin).*xn(i);
    i=i+1;
end
yorigin = xorigin;
n_y = 1:length(yn);
n_y = n_y - yorigin;
//Display
//Plot
clf();
//y(n) plot
plot2d3(n_y,yn);
xlabel("n");
ylabel("y(n)");
title("y(n) = nx(n)");
