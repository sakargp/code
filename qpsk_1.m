clear all;
close all;
clc;
fc=1000;
t=linspace(0,1/1000,50);
e0=cos(2*pi*fc*t);
e1=-cos(2*pi*fc*t);
b=mod(randperm(16),2);
bnot=1-b;
n=['The binary data is   ',num2str(b)];
bpsk1=[];bpsk2=[];bin=[];

for i=1:length(b)
    bpsk1=[bpsk1,b(i)*e0];
    bpsk2=[bpsk2,bnot(i)*e1];
    bin=[bin,b(i)*ones(1,50)];
end;

bpskout=bpsk1+bpsk2;
tm=[0:length(bpsk1)-1];
plot(tm,bin,'r--');
axis([0 length(bin) 0 1.5]);
hold on;
plot (tm, bpskout,'b');
axis([0 length(tm) -1.5 1.5]);
hold off;
xlabel('Time index');
ylabel('Amplitude');
legend('Simulation og Binary Phase Shift keying');
gtext(n);
