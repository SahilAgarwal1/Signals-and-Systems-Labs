function b = gen_filter(w0, L)
b_unit_gain = zeros(1,L);
for k = 0:L-1
    b_unit_gain(k+1) = cos(w0*k);
end
w = -pi:pi/1000:pi;
H = freq_resp(b_unit_gain, w);
max_mag = max(abs(H));
b = b_unit_gain / max_mag;