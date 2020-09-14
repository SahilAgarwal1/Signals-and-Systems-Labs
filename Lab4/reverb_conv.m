function yc = reverb_conv(x,s,A)
% This function uses the convolution method, which is computationally 
% the same as multiplying polynomials whose coefficient values match those
% of h and x. It is more efficient then the filter, with a time of 
%0.006 to execute
h = [1 zeros(1,s-1) A];
yc = conv(h,x);
end

