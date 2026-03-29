n      = -10:10;
offset = 10 + 1;
xn     = zeros(1, length(n));
xn(offset + 2)     = 1;
xn(offset + 1 + 2) = 1;
xn(offset + 2 + 2) = 1;
xn(offset + 3 + 2) = 1;
i  = -10;
yn = zeros(1, length(n));

while i <= 10
    idx = i*i + offset;
    if idx <= length(xn) then
        yn(i + offset) = xn(idx);
    end
    i = i+1;
end

clf();
plot2d3(n, yn);
xlabel("n");
ylabel("T[x(n-2)]");
title("T[x(n-2)]");
