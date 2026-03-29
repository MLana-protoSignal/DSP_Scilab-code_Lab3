function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    maxx = 1; maxh = 1;
    for i = 1:length(xn)
        if xn(i) <> 0 then maxx = i; end
    end
    for i = 1:length(hn)
        if hn(i) <> 0 then maxh = i; end
    end
    x_cut = xn(1:maxx);
    h_cut = hn(1:maxh);
    yn = conv(x_cut, h_cut);
    yorigin = xorigin + horigin - 1;
endfunction

n_range = -10:10;
offsetx = length(n_range)/2 + 0.5;
xn = zeros(1, length(n_range));
xn(1) = 1; xn(2) = 2; xn(3) = 3; xn(4) = -4;
xorigin = 3;
hn = zeros(1, length(n_range));
hn(1) = 2; hn(2) = 1; hn(3) = 2; hn(4) = 1;
horigin = 4;
[yn, yorigin] = convolution(xn, xorigin, hn, horigin);
n_x = n_range + offsetx - xorigin;
n_h = n_range + offsetx - horigin;
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
subplot(3, 1, 1);
plot2d3(n_x, xn);
xlabel("n"); ylabel("x(n)"); title("x(n)");
subplot(3, 1, 2);
plot2d3(n_h, hn);
xlabel("n"); ylabel("h(n)"); title("h(n)");
subplot(3, 1, 3);
plot2d3(n_y, yn);
xlabel("n"); ylabel("y(n)"); title("y(n) = x(n)*h(n)");
