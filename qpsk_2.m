% Demonstration of Eb/N0 Vs BER for QPSK modulation scheme
%RECEIVER
clear;
clc;
%input
N=1000000;
EbN0dB=-4:2:10;
data=randn(1,N)>=0;
oddData=data(1:2:end);
evenData=data(2:2:end);
qpskModulated = sqrt(1/2)*(1i*(2*oddData-1)+(2*evenData-1));
M=4;
Rm=log2(M);
Rc=1;
BER=zeros(1,length(EbN0dB));
index=1;
for i = EbN0dB,
EbN0=10.^(i/10);
noiseSigma= sqrt(1./(2*Rm*Rc*EbN0));
noise=noiseSigma*(randn(1,length(qpskModulated))+1i*randn(1,length(qpskModulated)));
received=qpskModulated + noise;
detected_real=real(received)>=0;
detected_img=imag(received)>=0;
estimatedBits=reshape([detected_img;detected_real],1,[]);
BER(index)=sum(xor(data,estimatedBits))/length(data);
index=index+1;
end
plotHandle=plot(EbN0dB,log10(BER),'r--');
set(plotHandle,'LineWidth',1.5);
title('SNR per bit (En/N0) Vs BER Curve for QPSK Modulated Scheme');
xlabel('SNR per bit (Eb/N0) in dB');
plotHandle=plot(EbN0dB,log10(BER),'r--');
set(plotHandle,'LineWidth',1.5);
title('SNR per bit (Eb/N0) Vs BET Curve for QPSK Modulation Scheme');
xlabel('SNR per bit (Eb/N0) in dB');
ylabel('Bit Error Rate (BER) in dB');
grid on;
hold on;
theoreticalBER=0.5*erfc(sqrt(10.^(EbN0dB/10)));
plotHandle=plot(EbN0dB,log10(theoreticalBER),'b*');
set(plotHandle,'LineWidth',1.5);
legend('Simulatd','Theoretical=QPSK','Theoretical-QPSK');
grid on;
