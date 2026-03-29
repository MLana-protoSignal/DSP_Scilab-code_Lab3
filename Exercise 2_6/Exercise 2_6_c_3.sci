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

function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    max1 = 1; max2 = 1;
    for i = 1:length(x1n)
        if x1n(i) <> 0 then max1 = i; end
        if x2n(i) <> 0 then max2 = i; end
    end
    yorigin = max(x1origin, x2origin);
    end1 = max1 - x1origin;
    end2 = max2 - x2origin;
    len_y = max(end1, end2) + yorigin;
    yn = zeros(1, len_y);
    i=1;
    while i <= length(yn)
        idx1 = i + (x1origin - yorigin);
        idx2 = i + (x2origin - yorigin);
        if idx1 >= 1 & idx2 >= 1 & idx1 <= length(x1n) & idx2 <= length(x2n) then
            yn(i) = x1n(idx1) + x2n(idx2);
        elseif idx1 >= 1  & idx1 <= length(x1n) then
            yn(i) = x1n(idx1);
        elseif idx2 >= 1 & idx2 <= length(x2n) then
            yn(i) = x2n(idx2);
        end
        i=i+1;
    end
endfunction

n = -10:10;
xn = zeros(1, length(n));
xn(1) = 1;
xn(2) = 1;
xn(3) = 1;
xn(4) = 1;
xorigin = 1;
[xn, xorigin] = delay (xn, xorigin, 2);
[xn_1, xorigin_1] = delay (xn, xorigin, 1);
xn_1 = -xn_1;
[yn, yorigin] = add(xn, xorigin, xn_1, xorigin_1);
n_y = 1:length(yn);
n_y = n_y - yorigin;
//Display
//Plot
clf();
//y(n) plot
plot2d3(n_y,yn);
xlabel("n");
ylabel("T[x(n-2)]");
title("T[x(n-2)]");
