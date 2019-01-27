clear;
x = [0:0.1:30];
y1 = sin(x);
h1 = plot(x,y1,'b')    %b -- обозначение для синего цвета линии
grid on     %включение сетки
axis([0 30 -1.2 1.4])      %пределы по оси Ох от 0 до 30 и по оси Оу от -1.2 до 1.4
hold on
y2 = cos(x);
h2 = plot(x,y2,'r--')    %r -- обозначение для красного цвета линии, два дефиса -- пунктирная линия
legend([h1,h2],'sin(x)','cos(x)')    %легенда для графиков h1 -- sin(x), h2 -- cos(x)
title 'sin(x) and cos(x) functions'
xlabel 'x'
ylabel 'y'