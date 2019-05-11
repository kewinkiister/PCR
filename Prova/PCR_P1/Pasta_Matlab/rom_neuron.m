clc
clear all
close all
N=100; % numero de vetores de teste aleatorios
EW=8; % tamanho do expoente
FW=18; % tamanho da mantissa
% valores de entrada entre 0 e 1.0
max_in = 0.50; % pesos com valores entre 0 e 10.0
men1= 'memory_initialization_radix=2;';
men2= 'memory_initialization_vector=';

floatxir = fopen('floatxir.txt','w');
floatxul = fopen('floatxul.txt','w');

floatsx = fopen('floatsx.txt','w');
floatsz = fopen('floatsz.txt','w');

binsx = fopen('binsx.txt','w');
binsz = fopen('binsz.txt','w');

binxir = fopen('binxir.txt','w');
binxul = fopen('binxul.txt','w');

fprintf(binxir,'%s\n', men1);
fprintf(binxir,'%s\n', men2);
fprintf(binxul,'%s,\n',men1);
fprintf(binxul,'%s,\n',men2);
    
% rand('seed',06111991); % seed for random number generator
%rand('twister',140044299); % seed for random number generator
for i=1:N
    sx=(0.15*(randn())+0.1);    %randn: Distribui??o normal
    sz=(0.25*(randn())+0.5);
    xir= 100 + sx*randn();
    xul= 100 + sz*randn();

    
    xirbin=float2bin(EW,FW,xir);
    xulbin=float2bin(EW,FW,xul);

    
    fprintf(floatxir,'%f\n',xir);
    fprintf(floatxul,'%f\n',xul);

    
    fprintf(binxir,'%s,\n',xirbin);
    fprintf(binxul,'%s,\n',xulbin);

end

sx=(0.15*(randn())+0.1);    %randn: Distribui??o normal
sz=(0.25*(randn())+0.5);

fprintf(floatsx,'%f\n',sx);
fprintf(floatsz,'%f\n',sz);

sxbin=float2bin(EW,FW,sx);
szbin=float2bin(EW,FW,sz);


fprintf(binsx,'%s\n',sxbin);
fprintf(binsz,'%s\n',szbin);



fclose(floatsx);
fclose(floatsz);
fclose(binsx);
fclose(binsz);

fclose(floatxir);
fclose(floatxul);
fclose(binxir);
fclose(binxul);
