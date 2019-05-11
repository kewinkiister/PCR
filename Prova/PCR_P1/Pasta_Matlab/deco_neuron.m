% funcao para decodificar resultados obtidos pela arquitetura de hardware
% do neur?nio de 4 entradas
% Estima-se o MSE usando a funcao my_nuron como modelo de referencia

close all
clc
clear all
N=100; % numero de vetores de teste aleatorios
EW=8; % tamanho do expoente
FW=18; % tamanho da mantissa

bin_outneuron=textread('filter_out.txt', '%s');
x_ir=textread('floatxir.txt', '%f');
x_ul=textread('floatxul.txt', '%f');
sx = 0.032040;
sz = 0.849863;

result_hw=zeros(N,1);
result_sw=zeros(N,1);
for i=1:N-1
    result_hw(i,1)=bin2float(cell2mat(bin_outneuron(i)),EW,FW);
    g(i+1)=sx/(sx+sz);
    d(1)= sx;
    d(i+1)= d(i)-g(i+1)*d(i);
    g(i+1)=d(i)/(d(i)+sz);
    xf(i)=x_ul(i)+g(i+1)*(x_ir(i)-x_ul(i));
    result_sw(i) = xf(i);
    erro(i) = sum((result_hw(i,:) - result_sw(i,:)).^2);
end

dh = sum((100-result_sw).^2)/100;
MSE = square(sum(erro))/N

