function [x , t ] = key_to_musical_note( key , Xs , dur , fs)
% key_ t o _m u s ic a l _n o t e : Produces a musical node corresponding
% to a given piano key number
%
% Input Args :
%   key : number of the note ( key ) on piano keyboard
%   Xs : A vector contains the phasors of harmonics starting
%        from the 1 st harmonic
%   dur : duration of note ( in seconds )
%   fs : A scalar indicating the sampling rate ( in Hz )
%
% Output :
%   x : waveform of the note
%   t : optional time vector
t = 0:1/ fs : dur ; % Time vector
f = 440 * 2^(key -69/12);%
x = zeros (1 , length ( t ) ) ; % create 0s vector for the sampled signal
num_harmonics = length ( Xs ) ; % number of harmonics
% instantiates the signal x with the sum of the harmonics
for n = 1: num_harmonics
x = x + real (Xs(n) * exp(j * 2 * pi * f * t));
end
end