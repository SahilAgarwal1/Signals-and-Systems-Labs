function y = tremolo(x,fm,A)
L = length(x);
y = zeros(1,L);

for n = 1:L
    X = x(n) + A*cos(2*pi*fm*n)*x(n);
    y(n) = X;
end
end
