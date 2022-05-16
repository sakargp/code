clc;
clear all;

Hbts = 50;
Tbts = 350;
Htav = 300;
Hm = 3;
f = 900;
d = 0.5:0.5:15;
Pt = 0.020;
Gt = 10;

Hb = Hbts + Tbts - Htav;
models = {'Big City (Urban model)';
'Small & Medium City (Urban model)';'Sub urban environment';'Open Rural environment'};
    
display('Hata-Okumura Model');
display(['1' models{1,1}]);
display(['2' models{2,1}]);
display(['3' models{3,1}]);
display(['4' models{4,1}]);

reply = input('Select Your choice of environmnt : ', 's');

if 0 < str2num(reply) < 4
    modelName = models{str2num(reply),1};
    display(['Chosen Model : ' modelName])
else
    error('Invalid Selection');
end

switch reply
    case '1',
        C = 0;
        if f <= 200
            aHm = 8.29*(log10(1.54*Hm))^2-1.1;
        else
            aHm = 3.2*(log10(11.75*Hm))^2-4.97;
        end
    case '2',
        C = 0;
        aHm = (1.1*log10(f)-0.7)*Hm-(1.56*log10(f)-0.8);
    case '3',
        aHm = (1.1*log10(f)-0.7)*Hm-(1.56*log10(f)-0.8);
        C = -2*(log10(f/28))^2-5.4;
    case '4',
        aHm = (1.1*log10(f)-0.7)*Hm-(1.56*log10(f)-0.8);
        C=-4.78*(log10(f))^2+18.33*log10(f)-40.98;
    otherwise ,
        error('Invalid model selection');
end

A = 69.55 + 26.16*log10(f) - 13.82*log10(Hb)-aHm;
B = 44.9 - 6.55*log10(Hb);
PL=A+B*log10(d)+C;
subplot(2,1,1)
plot(d,PL,'r','LineWidth',2);
title(['Hata-Okumura Path Loss Model for : ' modelName]);
xlabel('Distance - Kilometers');
ylabel('Path Loss (dB)');

Pr = 10*log10(Pt*1000)+Gt-PL ;
subplot(2,1,2)
plot(d,Pr,'r','LineWidth',2);
title(['Hata-Okumura Model for : ' modelName]); xlabel('Distance - Kilometers');
ylabel('Received Signal Level (dBm)');

    
