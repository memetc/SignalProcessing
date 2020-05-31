[sn,fsn] = audioread('p232_001n.wav'); %read noisy and clean signal
[sc,fsc] = audioread('p232_001c.wav');

sn = sn(28000:80000); %I cut the first part because I aobserved that there was no sound.
sc = sc(28000:80000);


subplot(1,3,1) %plotting signal
plot(sn)
title('Noisy')
subplot(1,3,2)
plot(sc)
title('Clean')


SN = fft(sn); %transformation to frequency domain
SC = fft(sc);
fresponse = SC./SN; % frequency response 
subplot(1,3,3)
plot(fresponse)

tresponse = ifft(fresponse);
filtered = cconv(sn, tresponse); 
figure();
plot(filtered)
title('Filtered')
%sound(sn)
%sound(sc)
sound(filtered)