%% Exercise 5.1
%a

type freq_resp.m

%b

type gen_filter

%c

w0 = pi/4;
L = 20;
w = -pi:pi/1000:pi;
b = gen_filter(w0,L);
H = freq_resp(b,w);

figure(1) ;
subplot (2 , 1 , 1)
plot (w/pi,abs(H)) ;
grid on ;
title ( 'Magnitude Response')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude ') ;
subplot (2 , 1 , 2)
plot ( w / pi , angle ( H ) / pi ) ;
grid on ;
title ( ' Phase Response ')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample) ');
ylabel('Phase(/times /pi rad)');
% The magnitude response reaches it's max value at the radian frequency of
% 0.256

% d

% y[n] = SUM (k = 0:L-1) b(k) * X[n-k]

%e
x = zeros(1,80);
xtemp = 0;
for n = 0:79
    xtemp = xtemp + (2 + cos((pi/4) * (n)) + cos((3*pi/4) * (n) ...
        + (pi/2)));
    x(n+1) = xtemp;
    xtemp = 0;
end


y = filter(b,1,x);

figure(2)
ns = [0:79];
subplot(2,1,1)
stem(ns,x);
xlabel('Samples');
ylabel('x[n]');

subplot(2,1,2)
stem(ns,y);
xlabel('Samples');
ylabel('y[n]');

% The output plot matches the equation provided in d

%% Exercise 5.2
%a
type gen_filter_w_info

[b,f_start, f_end, bw] = gen_filter_w_info(pi/4,20);
f_start
f_end
bw

%b

[b, f_start, f_end, bw] = gen_filter_w_info(pi/4,40);
f_start
f_end
bw

% bandwidth doubles as length halves


%c

% function to get rad/samp from hz

type getRadSamp

% Octave : 2 3 4 5 6 7
% Start key # : 36 48 60 72 84 96
% End key # : 47 59 71 83 95 107
% Start freq ( Hz ) : 65.4 130.8 261.6 523.3 1046.5 2093.0
% End freq ( Hz ) : 123.5 246.9 493.9 987.8 1987.5 3951.1
% Center freq ( Hz ) : 94.4 188.9 379.2 755.5 1551.0 3022.0
% Start freq ( rad/sample ) : 0.0373 0.0745 0.1490 0.2981 0.5961 1.1922
% End freq ( rad/sample ) : 0.0703 0.1406 0.2813 0.5627 1.1321 2.2506
% Center freq ( rad/sample ) : 0.0538 0.1076 0.2160 0.4303 0.8835 1.7214


%d


type guessL

w = -pi:pi/1000:pi;

[b2,f_start,f_end, bw] = gen_filter_w_info(0.0538 ,round...
    (guessL(0.0538,20,0.703,0.0373)));
f_start
f_end

H = freq_resp(b2,w);

figure(3) ;
plot (w/pi,abs(H)) ;
grid on ;
title ( 'Magnitude Response b2')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude ') ;

[b3,f_start,f_end, bw] = gen_filter_w_info(0.1076 ,round...
    (guessL(0.1076,20,0.1406,0.0745)));
f_start
f_end

H = freq_resp(b3,w);

figure(4) ;
plot (w/pi,abs(H)) ;
grid on ;
title ( 'Magnitude Response b3')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude ') ;

[b4,f_start,f_end, bw] = gen_filter_w_info(0.2160 ,round...
    (guessL(0.2160,20,0.2813,0.1490)));
f_start
f_end

H = freq_resp(b4,w);

figure(5) ;
plot (w/pi,abs(H)) ;
grid on ;
title ( 'Magnitude Response b4')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude ') ;

[b5,f_start,f_end, bw] = gen_filter_w_info(0.4303 ,round...
    (guessL(0.4303,20,0.5627 ,0.2981)));
f_start
f_end

H = freq_resp(b5,w);

figure(6) ;
plot (w/pi,abs(H)) ;
grid on ;
title ( 'Magnitude Response b5')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude ') ;

[b6,f_start,f_end, bw] = gen_filter_w_info(0.8835  ,round...
    (guessL(0.8835 ,20,1.1321,0.5961)));
f_start
f_end

H = freq_resp(b6,w);

figure(7) ;
plot (w/pi,abs(H)) ;
grid on ;
title ( 'Magnitude Response b6')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude ') ;


[b7,f_start,f_end, bw] = gen_filter_w_info(1.7214  ,round...
    (guessL(1.7214 ,20,2.2506,1.1922)));
f_start
f_end

H = freq_resp(b7,w);

figure(8) ;
plot (w/pi,abs(H)) ;
grid on ;
title ( 'Magnitude Response b7');
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude ') ;

%e
[xwav,fs] = audioread('x-file.wav');
xmod = filter(b3,1,xwav);
audiowrite('x-file-octave3.wav',xmod,fs);
% The audio is filtered and seems to be lower in volume as less signal
% gets through

xmod = filter(b7,1,xwav);
audiowrite('x-file-octave7.wav',xmod,fs);
% The audio is even more filtered and 
%seems to be even lower in volume as less signal
% gets through the filter 






