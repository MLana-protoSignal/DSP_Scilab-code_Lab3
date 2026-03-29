function [yn, yorigin] = advance(xn, xorigin, k)
    maxy = 1;
    i = 1;
    while i <= length(xn)
        if xn(i) <> 0 then maxy = i; end
        i = i + 1;
    end
    yorigin = xorigin + k;
    if(yorigin > length(xn)) then
        i=1;
        while yorigin - i >= length(xn)
            maxy = maxy+1; 
            i = i + 1;
        end
        yorigin = maxy;
    end
    yn = zeros(1, maxy);
    i = 1;
    while i <= maxy
        yn(i) = xn(i);
        i = i + 1;
    end
endfunction

n = -10:10;
xn = zeros(1, length(n));
xn(1) = 1;
xn(2) = 1;
xn(3) = 1;
xn(4) = 1;
xn(5) = 1/2;
xn(6) = 1/2;
xorigin = 2;
[yn, yorigin] = advance(xn, xorigin, 2);
n_y = 1:length(yn);
n_y = n_y - yorigin;
//Display
//Plot
clf();
//y(n) plot
plot2d3(n_y,yn);
xlabel("n");
ylabel("y(n)");
title("y(n) = x(n+2)");

