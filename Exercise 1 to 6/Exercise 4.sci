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

n_x = -10:10;
offsetx = length(n_x)/2 + 0.5;

//x1(n) 
x1n = zeros(1, length(n_x));
x1n(1) = 0;
x1n(2) = 1;
x1n(3) = 3;
x1n(4) = -2;
//x1n(?) = ?
x1origin = 1;

//x2(n) 
x2n = zeros(1, length(n_x));
x2n(1) = 1;
x2n(2) = 1;
x2n(3) = 2;
x2n(4) = 3;
//x2n(?) = ?
x2origin = 2;

//y(n)
[yn, yorigin] = add(x1n, x1origin, x2n, x2origin);
n_x1 = n_x + offsetx - x1origin;
n_x2 = n_x + offsetx - x2origin;
n_y = (1:length(yn)) - yorigin;
//Display
//Console
printf("y(n) = [ %d", yn(1)); 
for i=2:length(yn)
    printf(", %d", yn(i));
end
printf(" ]\n");
printf("yorigin = %d", yorigin);
//Plot
clf();
//x1(n) plot
subplot(3, 1, 1);
plot2d3(n_x1,x1n);
xlabel("n");
ylabel("x1(n)");
title("x1(n)");
//x2(n) plot
subplot(3, 1, 2);
plot2d3(n_x2,x2n);
xlabel("n");
ylabel("x2(n)");
title("x2(n)");
//y(n) plot
subplot(3, 1, 3);
plot2d3(n_y,yn);
xlabel("n");
ylabel("y(n)");
title("y(n) = x1(n)+x2(n)");
