function [yn, yorigin] = delay (xn, xorigin, k)
    //Find the max index, whose value <> 0
    maxy = 1;
    i = 1;
    while i<=length(xn)
        if xn(i) <> 0 then maxy = i end
        i = i+1;
    end
    //delay
    yorigin = xorigin - k;
    if yorigin < 1 then
        i = 1;
        while (i+yorigin) <= 1 
            maxy = maxy+1;
            i=i+1;
        end
    end
    yn = zeros(1, maxy);
    i = 1;
    while i <= maxy
        if(i + yorigin <= 1) 
            yn(i) = 0;
        elseif(yorigin < 1)
            yn(i) = xn(i+yorigin-1);
        else
            yn(i) = xn(i);
        end
        i = i+1;
    end
    if yorigin < 1 then yorigin = 1; end
endfunction

n = -10:10; 
xn = zeros(1, length(n));
offset = length(n)/2+0.5;
xn(1) = 1;
xn(2) = -2;
xn(3) = 3;
xn(4) = 6;
//xn(?) = ?
xorigin = 3;
[yn, yorigin] = delay (xn, xorigin, 1);
n_x = n + offset - xorigin;
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
title("y(n) = x(n-1)");
