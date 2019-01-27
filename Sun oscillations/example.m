clear;
x = [0:0.1:30];
y1 = sin(x);
h1 = plot(x,y1,'b')    %b -- ����������� ��� ������ ����� �����
grid on     %��������� �����
axis([0 30 -1.2 1.4])      %������� �� ��� �� �� 0 �� 30 � �� ��� �� �� -1.2 �� 1.4
hold on
y2 = cos(x);
h2 = plot(x,y2,'r--')    %r -- ����������� ��� �������� ����� �����, ��� ������ -- ���������� �����
legend([h1,h2],'sin(x)','cos(x)')    %������� ��� �������� h1 -- sin(x), h2 -- cos(x)
title 'sin(x) and cos(x) functions'
xlabel 'x'
ylabel 'y'