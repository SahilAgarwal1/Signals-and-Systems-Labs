%% Lab 6
%% Exercise 6.1
%a)
%X[exp(j*w)] = exp(-j*w*-3)

w = -pi:pi/1000:pi;

X = zeros(1,10);
for n = 1:10
    X(n) = del(n-3);
end

X = dtft(X,w);
figure;
subplot (2 , 1 , 1)
plot (w/pi,20*log10(abs(X))) ;
grid on ;
title ( 'Magnitude Response a10')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude (dB) ') ;
subplot (2 , 1 , 2)
plot ( w / pi , angle ( X ) / pi ) ;
grid on ;
title ( ' Phase Response a10')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample) ');
ylabel('Phase(/times /pi rad)');


X = zeros(1,100);
for n = 1:100
    X(n) = del(n-3);
end

X = dtft(X,w);
figure;
subplot (2 , 1 , 1)
plot (w/pi,20*log10(abs(X))) ;
grid on ;
title ( 'Magnitude Response a100')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude ') ;
subplot (2 , 1 , 2)
plot ( w / pi , angle ( X ) / pi ) ;
grid on ;
title ( ' Phase Response a100')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample) ');
ylabel('Phase(/times /pi rad)');



%b)
%X[exp(j*w)] = 1/(1-(8/9)*exp(-j*w))

X = zeros(1,10);
for n = 1:10
    X(n) = ((8/9)^n) * un(n);
end

X = dtft(X,w);
figure;
subplot (2 , 1 , 1)
plot (w/pi,20*log10(abs(X))) ;
grid on ;
title ( 'Magnitude Response b10')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude (dB) ') ;
subplot (2 , 1 , 2)
plot ( w / pi , angle ( X ) / pi ) ;
grid on ;
title ( ' Phase Response b10')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample) ');
ylabel('Phase(/times /pi rad)');

X = zeros(1,100);
for n = 1:100
    X(n) = ((8/9)^n) * un(n);
end


X = dtft(X,w);
figure;
subplot (2 , 1 , 1)
plot (w/pi,20*log10(abs(X))) ;
grid on ;
title ( 'Magnitude Response b100')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude ') ;
subplot (2 , 1 , 2)
plot ( w / pi , angle ( X ) / pi ) ;
grid on ;
title ( ' Phase Response b100')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample) ');
ylabel('Phase(/times /pi rad)');

%c)
%X[exp(j*w)] = 1/(1 + (8/9)*exp(-j*w))

X = zeros(1,10);
for n = 1:10
    X(n) = ((-8/9)^n) * un(n);
end

X = dtft(X,w);
figure;
subplot (2 , 1 , 1)
plot (w/pi,20*log10(abs(X))) ;
grid on ;
title ( 'Magnitude Response c10')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude (dB) ') ;
subplot (2 , 1 , 2)
plot ( w / pi , angle ( X ) / pi ) ;
grid on ;
title ( ' Phase Response c10')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample) ');
ylabel('Phase(/times /pi rad)');


X = zeros(1,100);
for n = 1:100
    X(n) = ((-8/9)^n) * un(n);
end

X = dtft(X,w);
figure;
subplot (2 , 1 , 1)
plot (w/pi,20*log10(abs(X))) ;
grid on ;
title ( 'Magnitude Response c100')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude ') ;
subplot (2 , 1 , 2)
plot ( w / pi , angle ( X ) / pi ) ;
grid on ;
title ( ' Phase Response c100')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample) ');
ylabel('Phase(/times /pi rad)');

%d)
%X[exp(j*w)] = 1/(1-exp(-j*w)) + pi*δ2π(ω)

X = zeros(1,10);
for n = 1:10
    X(n) = un(n) - un(n-5);
end

X = dtft(X,w);
figure;
subplot (2 , 1 , 1)
plot (w/pi,20*log10(abs(X))) ;
grid on ;
title ( 'Magnitude Response d10')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude (dB) ') ;
subplot (2 , 1 , 2)
plot ( w / pi , angle ( X ) / pi ) ;
grid on ;
title ( ' Phase Response d10')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample) ');
ylabel('Phase(/times /pi rad)');

X = zeros(1,100);
for n = 1:100
    X(n) = un(n) - un(n-5);
end

X = dtft(X,w);
figure;
subplot (2 , 1 , 1)
plot (w/pi,20*log10(abs(X))) ;
grid on ;
title ( 'Magnitude Response d100')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude ') ;
subplot (2 , 1 , 2)
plot ( w / pi , angle ( X ) / pi ) ;
grid on ;
title ( ' Phase Response d100')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample) ');
ylabel('Phase(/times /pi rad)');

%e)
% X[exp(j * w)] = π * [δ2π(ω − pi/4) + δ2π(ω + pi/4)]
X = zeros(1,10);
for n = 1:10
    X(n) = cos((pi/4)* n);
end

X = dtft(X,w);
figure;
subplot (2 , 1 , 1)
plot (w/pi,20*log10(abs(X))) ;
grid on ;
title ( 'Magnitude Response e10')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude (dB) ') ;
subplot (2 , 1 , 2)
plot ( w / pi , angle ( X ) / pi ) ;
grid on ;
title ( ' Phase Response e10')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample) ');
ylabel('Phase(/times /pi rad)');

X = zeros(1,100);
for n = 1:100
    X(n) = un((pi/4)* n);
end


X = dtft(X,w);
figure;
subplot (2 , 1 , 1)
plot (w/pi,20*log10(abs(X))) ;
grid on ;
title ( 'Magnitude Response e100')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude ') ;
subplot (2 , 1 , 2)
plot ( w / pi , angle ( X ) / pi ) ;
grid on ;
title ( ' Phase Response e100')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample) ');
ylabel('Phase(/times /pi rad)');


% The grapghs of the signals match the equations derived analytically. 

% Truncating the signal to 100 rather than 10 returns a fuller image of the
% signal, as it is being observed over a greater time period. 

%% Exercise 6.2

%a 

[corrupt,Fs] = audioread('corrupted_wannabe.wav');


w = -pi:pi/2000:pi;
corrupt_dtft =dtft(corrupt,w);
length(corrupt_dtft)

figure;
subplot (2 , 1 , 1)
plot (w/pi,20*log10(abs(corrupt_dtft))) ;
grid on ;
title ( 'Magnitude Response Corrupt')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude (dB) ') ;


%b

% The normalized radian frequency of the interference is 0.4535
% The continous time cyclic frequency is 0.4535 / pi
% The frequency in hertz is 0.4535 * 400.1

%c

h = [1 -2*cos(0.4535*pi) 1];

h = dtft(h,w);
figure;
subplot (2 , 1 , 1)
plot (w/pi,20*log10(abs(h))) ;
grid on ;
title ( 'Magnitude Response')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude (dB) ') ;
subplot (2 , 1 , 2)
plot ( w / pi , angle ( h ) / pi ) ;
grid on ;
title ( ' Phase Response')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample) ');
ylabel('Phase(/times /pi rad)');

%d
h = [1 -2*cos(0.4535*pi) 1];
not_corrupt = conv(corrupt,h);
audiowrite('filtered_wannabe.wav',not_corrupt,Fs)
not_corrupt = dtft(not_corrupt,w);

figure;
subplot (2 , 1 , 1)
plot (w/pi,20*log10(abs(not_corrupt))) ;
grid on ;
title ( 'Magnitude Response')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample ) ') ;
ylabel ( ' Amplitude (dB) ') ;
subplot (2 , 1 , 2)
plot ( w / pi , angle ( not_corrupt) / pi ) ;
grid on ;
title ( ' Phase Response')
xlabel ( 'Normalized Radian Frequency (\times \pi rad/sample) ');
ylabel('Phase(/times /pi rad)');


    


