n = -10:10;
xn = zeros(1, length(n));
offset = length(n)/2 +0.5;
xn(2) = 1;
xn(3) = 1;
xn(4) = 1;
xn(5) = 1;
xorigin = 2;
n_x = n - xorigin + offset + 2;
//Display
//Plot
clf();
//x(n) plot
plot2d3(n_x,xn);
xlabel("n");
ylabel("x(n-2)");
title("x(n-2)");
