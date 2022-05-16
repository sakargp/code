clc;
clear all;

n = input("Enter the number of server");
c = input("Enter the number of calls per hour=");
th = input("Enter the holding duration of each call=");
A=c*th/60;
A=round(A);
fprintf("\nThe value of offered traffic A=%d",A);

for N=1:1:n;
  A=2;
  Num=A^N/factorial(N);
  fprintf("\n The value of numerator Num=%d",Num);
  sum=0;
  for k=1:1:n
    Den =A*k/factorial(k);
    sum = sum+Den;
  end
  Den = sum+1;
  fprintf("\n The value of denominator Den=%d",Den);
  B=Num/Den;
  fprintf("\nThe value of GOS = %d",B);
  grid on;
  plot(N,B,"r+:");
end

xlabel("Number of trunks");
ylabel("Blocking probability");
title("Program to simulate LCC model");
