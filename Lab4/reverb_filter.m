function yc = reverb_filter(x,s,A)
% The filter function computationally uses the rational transfer function
% which can also be expressed as the function processing the difference
%eqn. It is not very efficient, with a time of 0.426 to execute
h = [1 zeros(1,s-1) A];
yc = filter(h,1,x);
end


