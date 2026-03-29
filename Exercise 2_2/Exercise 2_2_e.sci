function [yn, yorigin] = multi (x1n, x1origin, x2n, x2origin)
    //Find the max index of y(n), whose value <> 0
    max1 = 1;
    max2 = 1;
    i = 1;
    while i <= length(x1n)
        if x1n(i) <> 0 then max1 = i end
        if x2n(i) <> 0 then max2 = i end
        i = i+1;
    end
    //y(n)
    n1_start = 1 - x1origin;
    n1_end   = max1 - x1origin;
    n2_start = 1 - x2origin;
    n2_end   = max2 - x2origin;
    ny_start = max(n1_start, n2_start);
    ny_end   = min(n1_end, n2_end);
    if ny_start > ny_end then
        yn      = zeros(1, length(x1n));
        yorigin = 1;
    else
        len_y   = ny_end - ny_start + 1;
        yn      = zeros(1, len_y);
        i = 1;
        while i <= len_y
            idx1  = i + (ny_start - n1_start);
            idx2  = i + (ny_start - n2_start);
            yn(i) = x1n(idx1) .* x2n(idx2);
            i = i+1;
        end
        yorigin = min(x1origin, x2origin);  
    end
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
    yn = zeros(1, length(xn));
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
//x(n)
xn = zeros(1, length(n));
xn(1) = 1;
xn(2) = 1;
xn(3) = 1;
xn(4) = 1;
xn(5) = 1/2;
xn(6) = 1/2;
xorigin = 2;
[xn, xorigin] = delay (xn, xorigin, 1)
//delta(n)
deltan = zeros(1, length(n));
deltan(1) = 1;
deltaorigin = 1;
[deltan, deltaorigin] = delay (deltan, deltaorigin, 3)
//y(n)
[yn, yorigin] = multi (xn, xorigin, deltan, deltaorigin)
n_y = 1:length(yn);
n_y = n_y - yorigin;
//Display
//Plot
clf();
//y(n) plot
plot2d3(n_y, yn);
xlabel("n");
ylabel("y(n)");
title("y(n)");

