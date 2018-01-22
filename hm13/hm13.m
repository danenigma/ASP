clear;
clc;
close all;

fe = 0.05;
n = linspace(-200,200);
h = 2*fe*sinc(2*fe*n);
figure;
plot(n,h);
xlabel('n')
ylabel('hn')
%c=2
n = linspace(-20,20);
h = 2*fe*sinc(2*fe*n);
figure;
plot(n,h);
xlabel('n')
ylabel('hn')
dtft = fft (h);
dtft = fftshift (abs(dtft));
fc = (-numel(dtft)/2:numel(dtft)/2-1)./numel(dtft);
figure;
plot(fc,dtft);
xlabel('f');
ylabel('|H|');
%c=5
n = linspace(-60,60);
h = 2*fe*sinc(2*fe*n);
figure;
plot(n,h);
xlabel('n')
ylabel('hn')
dtft = fft (h);
dtft = fftshift (abs(dtft));
fc = (-numel(dtft)/2:numel(dtft)/2-1)./numel(dtft);
figure;
plot(fc,dtft);
xlabel('f');
ylabel('|H|');
%c=10
n = linspace(-110,110);
h = 2*fe*sinc(2*fe*n);
figure;
plot(n,h);
xlabel('n')
ylabel('hn')
dtft = fft (h);
dtft = fftshift (abs(dtft));
fc = (-numel(dtft)/2:numel(dtft)/2-1)./numel(dtft);
figure;
plot(fc,dtft);
xlabel('f');
ylabel('|H|');
%last part 
iidp = zeros(1,100);
for i=1:100
flip = discrete([1,1]);
if(flip==2)
iidp(i) = 1;
else
iidp(i) = -1;
end
end

%c=5
n = linspace(-60,60);
h = 2*fe*sinc(2*fe*n);
figure;
stem(iidp)
xlabel('n');
iidpft  = fft(iidp);
filterdFt = iidpft.*fft(h);
filteredDt = ifft(filterdFt);
figure;
plot(filteredDt);
xlabel('n');
ylabel('Amplitude')

%c=2
n = linspace(-20,20);
h = 2*fe*sinc(2*fe*n);
figure;
stem(iidp)
xlabel('n');
iidpft  = fft(iidp);
filterdFt = iidpft.*fft(h);
filteredDt = ifft(filterdFt);
figure;
plot(filteredDt);
sxx = (abs(iidpft).^2).*(abs(fft(h))).^2;
x = -0.5:0.01:0.49;
figure;
stem(x,sxx);
xlabel('phi');
ylabel('sxx');

%c=5
n = linspace(-60,60);
h = 2*fe*sinc(2*fe*n);
figure;
stem(iidp)
xlabel('n');
iidpft  = fft(iidp);
filterdFt = iidpft.*fft(h);
filteredDt = ifft(filterdFt);
figure;
plot(filteredDt);
sxx = (abs(iidpft).^2).*(abs(fft(h))).^2;
x = -0.5:0.01:0.49;
figure;
stem(x,sxx);
xlabel('phi');
ylabel('sxx');
%c=10
n = linspace(-110,110);
h = 2*fe*sinc(2*fe*n);
figure;
stem(iidp)
xlabel('n');
iidpft  = fft(iidp);
filterdFt = iidpft.*fft(h);
filteredDt = ifft(filterdFt);
figure;
plot(filteredDt);
sxx = (abs(iidpft).^2).*(abs(fft(h))).^2;
x = -0.5:0.01:0.49;
figure;
stem(x,sxx);
xlabel('phi');
ylabel('sxx');