clear;
global w ch_x ch_vx ch_t;

g = 10;
L = 5;

ch_x = pi/2;
ch_t = 2*pi*sqrt(L/g);
ch_vx = ch_x/ch_t;
w = sqrt(g/L);
r_start = [0.4 0]; %начальные условия
t_span = [0 5]; %отрезок времени
options = odeset('RelTol',1e-5,'AbsTol',1e-5 ); %точность вычислений (по умолчанию степени -3 и -6)

[T,R] = ode45(@ex_funct,t_span,r_start,options);

figure('Position', [150 150 1100 400])
subplot(1,2,1)
plot(T*ch_t,R(:,1)*ch_x) %рисуем траекторию
title 'trajectory'
xlabel 'time'
ylabel 'angle'
grid on

X = L*sin(R(:,1)*ch_x); %перевод угловых величин в обычные
Y = L-L*cos(R(:,1)*ch_x);
V = L*R(:,2)*ch_vx;
VX = V.*X;
VY = V.*Y;

subplot(1,2,2)
h1=plot(T*ch_t,V.^2); %кинетическая энергия
title 'energy'
xlabel 'time'
ylabel 'energy'
grid on
hold on
h2=plot(T*ch_t,g*Y); % потенциальная энергия
legend([h1 h2],'kinetic','potential')
 
%%
figure('Position', [150 150 1100 400])
subplot(1,2,1)
plot(T*ch_t,X)
title 'trajectory'
xlabel 'time'
ylabel 'x-coord'
grid on
subplot(1,2,2)
title 'trajectory'
xlabel 'x-coord'
ylabel 'y-coord'
grid on
hold on
plot(0,5,'o',...
    'MarkerSize',6,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0 0 0])
s = size(X)
axis([-5 5 0 10])
for i=1:s(1,1)
plot(X(i),Y(i),'ko')
pause(0.1)
end