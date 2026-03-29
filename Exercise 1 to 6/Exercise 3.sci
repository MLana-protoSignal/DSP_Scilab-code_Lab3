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

n = -10:10; 
xn = zeros(1, length(n));
offset = length(n)/2+0.5;
xn(1) = 1;
xn(2) = -2;
xn(3) = 3;
xn(4) = 6;
//xn(?) = ?
xorigin = 3;
[yn, yorigin] = fold (xn, xorigin);
n_x = n + offset - xorigin;
n_y = 1:length(yn);
n_y = n_y - yorigin;
//Display
//Console
printf("y(n) = [ %f", yn(1)); 
for i=2:length(yn)
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
title("y(n) = x(-n)");
