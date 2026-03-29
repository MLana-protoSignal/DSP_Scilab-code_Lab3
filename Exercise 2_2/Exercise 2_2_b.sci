function [yn, yorigin] = fold (xn, xorigin)
    //Find the max index, whose value <> 0
    maxy = 1;
    i = 1;
    while i<=length(xn)
        if xn(i) <> 0 then maxy = i end
        i = i+1;
    end
    //Fold
    yn = zeros(1, maxy);
    i = 1;
    while i <= maxy/2
        temp = xn(i);
        yn(i) = xn(maxy + 1 - i);
        yn(maxy + 1 - i) = temp;
        i = i+1;
    end
    //Determine
    yorigin = maxy - xorigin + 1;
endfunction

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
xn(1) = 1;
xn(2) = 1;
xn(3) = 1;
xn(4) = 1;
xn(5) = 1/2;
xn(6) = 1/2;
xorigin = 2;
[yn, yorigin] = fold(xn, xorigin);
[yn, yorigin] = delay(yn, yorigin, 4);
n_y = 1:length(yn);
n_y = n_y - yorigin;
//Display
//Plot
clf();
//y(n) plot
plot2d3(n_y,yn);
xlabel("n");
ylabel("y(n)");
title("y(n) = x(4-n)");

