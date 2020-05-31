figure('Name','Figure1'); 
T = 10*(1/200);

fs = 1000;
t = 0:1/fs:T-1/fs;

x = (sawtooth(2*pi*25*t,1/2)+1)/2;

subplot(2,1,1); plot(t,x)
grid on

Fs = 100;                      % samples per second
dt = 1/Fs;                     % seconds per sample
StopTime = 1;                  % seconds
N = size(t,2);
%%Fourier Transform:
X = fftshift(fft(x));
%%Frequency specifications:
dF = Fs/N;                      % hertz
f = -Fs/2:dF:Fs/2-dF;           % hertz
%%Plot the spectrum:
subplot(2,1,2); plot(f,abs(X).^2/N);
xlabel('Frequency (in hertz)');
title('Magnitude Response');


figure('Name','Figure2'); 
k = 0:1/fs:T-1/fs;
signal = 1/2;
for n = 1:2:3
    an = -4/(n^2*pi^2);
    signal = signal + an*cos(n*pi/0.02*k);
end
subplot(2,1,1); plot(k,signal)

signal = 1/2;
for n = 1:2:13
    an = -4/(n^2*pi^2);
    signal = signal + an*cos(n*pi/0.02*k);
end
subplot(2,1,2); plot(k,signal)