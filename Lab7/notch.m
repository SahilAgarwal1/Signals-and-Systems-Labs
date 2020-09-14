function [b,a] = notch(w0 , alpha)
b = [1 -2*cos(w0) 1];
a = [1 -2*alpha*cos(w0) alpha*alpha];
