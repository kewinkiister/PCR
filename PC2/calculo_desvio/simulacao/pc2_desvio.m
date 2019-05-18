clear all 
clc
close all
EW=8; % tamanho do expoente
FW=18; % tamanho da mantissa

rand('twister',140020161);

X_arq_float = fopen('X_arq_float_.txt','w');
X_arq_bin   = fopen('X_arq_bin_.txt','w');

for i=1:100
  x = 500 + randn()*20;
  fprintf(X_arq_float,'%f\n',x);
  x = float2bin(EW,FW,x);
  fprintf(X_arq_bin,'%s\n',x);

end
  
  

close all