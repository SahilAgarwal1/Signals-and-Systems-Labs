function yo = reverb_own(x,s,A)
% This function uses a direct implementation, which is computationally 
% equivalent to multiplying and adding the two functions. It is the most
%efficent with a time of 0.002 seconds to execute
x_delayed = [zeros(1,s) x.'];
x_longer = [x.' zeros(1,s)];
yo = x_longer + A*x_delayed;
end