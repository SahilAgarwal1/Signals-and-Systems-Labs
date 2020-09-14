%% Exercise 8.1
%a
fs = 8000;
tt = 0:1/fs:4.5;
x = cos(2*pi/20*fs*tt.^2);
figure;
spectrogram(x,512,256,512,fs,'yaxis');
%soundsc(x);

% The chirp sound is increasing in frequency, this is seen in the
% spectrogram as yellow line has a positive slope.

%b
% The resulting IIR filter has order 14
% transfer function
transfer_function = tf(b,a)
%pole zero plot
figure;
zplane(b,a);
%magnitude response
fvtool(b,a);

%c
figure;
xfiltered = filter(b,a,x);
spectrogram(xfiltered,512,256,512,fs,'yaxis');
%soundsc(xfiltered);

%The signal after the filter only plays the low frequency part of the
%signal loudly. This can be corelatted to the magnitude response of the
%signal as it can be seen that the magnitude response drops dramatically
%after the lower frequency. 

%d
% the fir filter coefficients are stored in "c" to preserve the earlier a
% and b.

%The order of the fir filter is 474

%pole zero plot of fir filter
figure;
zplane(c);
%magnitude response
fvtool(c);

%c
figure;
xfiltered = conv(c,x);
spectrogram(xfiltered,512,256,512,fs,'yaxis');
%soundsc(xfiltered);

%The signal after the filter only plays the low frequency part of the
%signal loudly. This can be corelatted to the magnitude response of the
%signal as it can be seen that the magnitude response drops dramatically
%after the lower frequency. 

% The IIR filter has a lower computational complexity,as it is of a much
% lower order. The fir filter has a more predictable audio quality, as can
% be seen in it's Magnitude resp

%% Exercise 8.2

[dnf,Fs] = audioread('noisy_drum_flute.wav');
figure;
spectrogram(dnf,512,256,512,fs,'yaxis');

% From the spectrogram, it can be seen that the drum frequency peaks at
% about 1.5 kHz, and the fulte frequency is localized above 2.5 kHz
% both have a minimum db/Hz of about 60



% the b and a of this filter are stored as d and e respectivley. 


filtered = filter(d,e,dnf);
audiowrite('drums.wav',filtered,Fs);

% I created a low-pass filter, because we need to pass low frequencies
%The filter is an IIR filter to minimize the order
% Impulse response
impulse = [ zeros(1,100) 1 zeros(1,100)];
impulse_resp = filter(d,e,impulse);
figure;
stem(impulse_resp);
title('filter impulse response plot');

%Magnitude response
%used fvtools but had to export the images for proper publishing
% They are included at the bottom of the published file


%transfer function
transfer_function = tf(d,e)

%poles and zeros
zplane(d,e);

%The poles correlate to the points where the magnitude response grows or
%decays

% Dtft plot

w = -pi:pi/1000:pi;
input_dtft = dtft(dnf,w);
output_dtft = dtft(filtered,w);

figure;
subplot (2 , 1 , 1)
plot ((w/pi)*Fs/2,20*log10(abs(input_dtft)));
grid on ;
title ( 'Magnitude Response input dtft')
xlabel ( 'Frequency Hz') ;
ylabel ( ' Amplitude ') ;
subplot (2 , 1 , 2)
plot ((w/pi)*Fs/2,20*log10(abs(output_dtft))) ;
grid on ;
title ( 'Magnitude Response output dtft')
xlabel ( 'Frequency Hz') ;
ylabel ( ' Amplitude ') ;

% The magnitude response shows that the higher frequencies were removed

%% Exercise 8.3

[dnf,Fs] = audioread('noisy_drum_flute.wav');
figure;
spectrogram(dnf,512,256,512,fs,'yaxis');

% From the spectrogram, it can be seen that the drum frequency peaks at
% about 1.5 kHz, and the fulte frequency is localized above 2.5 kHz
% both have a minimum db/Hz of about 60



% the b and a of this filter are stored as f and g respectivley. 


filtered = filter(f,g,dnf);
audiowrite('flutes.wav',filtered,Fs);

% I created a high-pass filter, because we need to pass high frequencies
%The filter is an IIR filter to minimize the order
% Impulse response
impulse = [ zeros(1,100) 1 zeros(1,100)];
impulse_resp = filter(f,g,impulse);
figure;
stem(impulse_resp);
title('filter impulse response plot');

%Magnitude response
%used fvtools but had to export the images for proper publishing
% They are included at the bottom of the published file
fvtool(f,g);


%transfer function
transfer_function = tf(f,g)

%poles and zeros
zplane(d,e);

%The poles correlate to the points where the magnitude response grows or
%decays

% Dtft plot

w = -pi:pi/1000:pi;
input_dtft = dtft(dnf,w);
output_dtft = dtft(filtered,w);

figure;
subplot (2 , 1 , 1)
plot ((w/pi)*Fs/2,20*log10(abs(input_dtft)));
grid on ;
title ( 'Magnitude Response input dtft')
xlabel ( 'Frequency Hz') ;
ylabel ( ' Amplitude ') ;
subplot (2 , 1 , 2)
plot ((w/pi)*Fs/2,20*log10(abs(output_dtft))) ;
grid on ;
title ( 'Magnitude Response output dtft')
xlabel ( 'Frequency Hz') ;
ylabel ( ' Amplitude ') ;

% The magnitude response shows that the lower frequencies were removed


