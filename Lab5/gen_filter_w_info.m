function [b, f_start, f_end, bw] = gen_filter_w_info(w0, L)
w = -pi:pi/1000:pi;
b = gen_filter(w0,L);
H = freq_resp(b, w);
index_passband = find(abs(H) >= 0.7071);
w_passband = w(index_passband);
w_passband_positive = w_passband(find(w_passband >= 0));
f_start = min(w_passband_positive);
f_end = max(w_passband_positive);
bw = f_end - f_start;
end

