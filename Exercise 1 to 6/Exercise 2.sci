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
        if i <= length(xn) then yn(i) = xn(i);end
        i = i + 1;
    end
endfunction

n = -10:10;
xn = zeros(1, length(n));
xn(1) = 1;
xn(2) = -2;
xn(3) = 3;
xn(4) = 6;
xorigin = 3;
[yn, yorigin] = advance(xn, xorigin, 2);
n_x = n + length(n)/2 + 0.5 - xorigin;
n_y = 1:length(yn);
n_y = n_y - yorigin;
//Display
//Console
printf("y(n) = [ %f", yn(1)); 
for i=2:length(n_y)
    printf(", %f", yn(i));
end
printf(" ]\n");
printf("yorigin = %d", yorigin);
//Plot
clf();
//x(n) plot
subplot(2, 1, 1);
plot2d3(n_x,xn);
xlabel("n");
ylabel("x(n)");
title("x(n)");
//y(n) plot
subplot(2, 1, 2);
plot2d3(n_y,yn);
xlabel("n");
ylabel("y(n)");
title("y(n) = x(n+2)");

