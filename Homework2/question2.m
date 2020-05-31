f = 1;
t = 0:0.0001:10;
signal1 = cos(2*pi*f*t+5);
signal2 = sin(pi*f*t/2);
x = signal1 + signal2; %summation of two different signals
fSample = 1.2;
tSample = 0:1/fSample:10;

signalSample1 = cos(2*pi*f*tSample+5);
signalSample2 = sin(pi*f*tSample/2);
xsampled = signalSample1 + signalSample2; %sampled signal with frequency 1.2


subplot(3, 1, 1)
plot(t,x)
hold on;

reconstructionoflight = zeros(1,length(t));
for i = 1:1:length(t) %reconstruct the signal using sinc
    for n = 1:1:length(tSample)
        reconstructionoflight(i) = reconstructionoflight(i) + xsampled(n)*sinc((t(i)-n*(1/fSample))/(1/fSample));
    end
end
stem(tSample,xsampled)
plot(t,reconstructionoflight)

fSample = 3; %repeat for different frequencies 
tSample = 0:1/fSample:10;

signalSample1 = cos(2*pi*f*tSample+5);
signalSample2 = sin(pi*f*tSample/2);
xsampled = signalSample1 + signalSample2;

subplot(3, 1, 2)
plot(t,x)
hold on;

reconstructionoflight = zeros(1,length(t));
for i = 1:1:length(t)
    for n = 1:1:length(tSample)
        reconstructionoflight(i) = reconstructionoflight(i) + xsampled(n)*sinc((t(i)-n*(1/fSample))/(1/fSample));
    end
end
stem(tSample,xsampled)
plot(t,reconstructionoflight)


fSample = 10;
tSample = 0:1/fSample:10;

signalSample1 = cos(2*pi*f*tSample+5);
signalSample2 = sin(pi*f*tSample/2);
xsampled = signalSample1 + signalSample2;

subplot(3, 1, 3)
plot(t,x)
hold on;

reconstructionoflight = zeros(1,length(t));
for i = 1:1:length(t)
    for n = 1:1:length(tSample)
        reconstructionoflight(i) = reconstructionoflight(i) + xsampled(n)*sinc((t(i)-n*(1/fSample))/(1/fSample));
    end
end
stem(tSample,xsampled)
plot(t,reconstructionoflight)
