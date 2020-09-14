tt = 0:1/1000:1;
H=2+10*cos(1500*pi*tt + pi/4) + 8*cos(1500*pi*tt - pi/4);
Y = fft(H,10);

figure
plot(Y)
grid on
