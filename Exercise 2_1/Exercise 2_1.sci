function y = xn(n)
    y = zeros(1, length(n));
    for i = 1:length(n)
        if n(i) >= -3 & n(i) <= -1 then
            y(i) = 1 + n(i)/3;
        elseif n(i) >= 0 & n(i) <= 3 then
            y(i) = 1;
        else
            y(i) = 0;
        end
    end
endfunction

n = -8:8;

xa  = xn(n);
xb1 = xn(4 - n);
xb2 = xn(-n - 4);
xc  = xn(-n + 4);

scf(0); clf();
plot2d3(n, xa);
xlabel("n"); ylabel("x(n)"); title("x(n)");

scf(1); clf();
plot2d3(n, xb1);
xlabel("n"); ylabel("x(4-n)"); title("x(4-n)");

scf(2); clf();
plot2d3(n, xb2);
xlabel("n"); ylabel("x(-n-4)"); title("x(-n-4)");

scf(3); clf();
plot2d3(n, xc);
xlabel("n"); ylabel("x(-n+4)"); title("x(-n+4)");
