clear;
x = [-10:0.5:10];
y = 1.5*sin(x-0.8);

figure('Position',[150 150 1100 400])
h1 = plot(x,y,'g.','MarkerSize',8);

s = size(x);
x1 = x+0.4*(rand(1,max(s))-0.5);
y1 = y+0.4*(rand(1,max(s))-0.5);
y1(1,4) = NaN; y1(1,17) = NaN; y1(1,31) = NaN;

hold on
h2 = plot(x1,y1,'k.','MarkerSize',15);
axis([-10.5 10.5 -1.7 2.2])
grid on
legend([h1 h2],'model','data with errors')
title 'datasets'

%% this
x1 = x1(~isnan(y1)); y1 = y1(~isnan(y1));
%% or this
[x1, y1] = prepareCurveData( x1, y1 );
%%
ft = fittype( 'sin1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
%opts.Display = 'Off';
%opts.Lower = [-Inf 0 -Inf];
opts.StartPoint = [0 0.8 -0.5];

[fitresult, gof] = fit( x1, y1, ft, opts );

figure('Position',[150 150 1100 400])
h3 = plot( fitresult,'r', x1, y1 ,'k.');
axis([-10.5 10.5 -1.7 2.2])
h3(1).MarkerSize = 15;
h3(2).LineWidth = 1.5;
legend( h3, 'datapoints', 'sine fit', 'Location', 'NorthEast' );
title 'fitted datapoints'
grid on
