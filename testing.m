clc 

clear all

close all


mu=0.000000001;
absm=0:0.01:1;

y= (1/log(1+mu)).*(mu./(1+mu.*absm));
figure

plot(absm,y,'g-^')
grid on
grid minor
hold on 


mu=10;


y= (1/log(1+mu)).*(mu./(1+mu.*absm));

plot(absm,y,'b--o')


mu=100;


y= (1/log(1+mu)).*(mu./(1+mu.*absm));

plot(absm,y,'c*')

mu=1000;


y= (1/log(1+mu)).*(mu./(1+mu.*absm));

plot(absm,y,'r--+')
xlabel("m/m_{p}")
ylabel("y")
legend("\mu=0.000000001","\mu=10","\mu=100","\mu=1000")
saveas(gcf, 'myFigure.svg');
