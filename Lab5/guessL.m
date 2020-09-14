function x = guessL(w0,g,en,st)
% function to try and guess L for a certain end and start taking advantage
% of the linearity of the relationship between L and bw
[b, fs, fe , bw] = gen_filter_w_info(w0,g);
x = (g*(en - st))/bw;

