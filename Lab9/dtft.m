function H = dtft(b , w)
H = zeros(size(w));
for c = 1:length(b)
    H = H + ( b(c)* exp(-c*1i*w));
end

    