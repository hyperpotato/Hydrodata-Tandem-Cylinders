clear all; close all; clc
Cdlevs = [-0.25 0 0.5 0.75 1 1.25 1.5 1.75 2 2.25 2.5 3 4];
Clvlevs = [-5:1:-1 -0.5 -0.25 0 0.1 0.2 0.4];
Cmylevs = [-1 -0.5 -0.2 -0.1 -0.05 0 0.1 0.5 1 1.25 1.5 1.75 2 2.5];
G_d = {'Single', '2D', '2.25D', '2.5D', '2.75D', '3D', '3.5D', '4D',...
    '4.5D', '5D', '6D', '7D', '8D'};
load('2CylDownstream.mat')
fr = data.fr;
AyD = data.AyD;
path = 'FIG';

%% plot Cd Clv Cmy in FIG/.. for Single to 8D result
for num = 1:13
    Cd = data.Cd{num};
    figure(1)
    [C,h] = contour(fr,AyD,Cd, Cdlevs, '-k');
    clabel(C,h,'FontSize',12,'Fontname', 'Times');
    hold on;
    contour(fr,AyD,Cd, [0 0], '-r', 'LineWidth',2);
    set(gca,'FontSize',14);set(gca,'Fontname', 'Times')
    ax = gca;ax.YTick = [0.05 0.2:0.2:1.2 1.35];
    ax = gca;ax.XTick = [0.1:0.05:0.35];
    h = xlabel('$f_r$');set(h,'Interpreter','latex');
    h = ylabel('$A_y/d$');set(h,'Interpreter','latex');
    hold off
    saveas(gcf, [path '/Cd/'...
        num2str(num, '%02d') '_' G_d{num} '.fig']);
end

for num = 1:13
    Clv = data.Clv{num};
    figure(1)
    [C,h] = contour(fr,AyD,Clv, Clvlevs, '-k');
    clabel(C,h,'FontSize',12,'Fontname', 'Times');
    hold on;
    contour(fr,AyD,Clv, [0 0], '-r', 'LineWidth',2);
    set(gca,'FontSize',14);set(gca,'Fontname', 'Times')
    ax = gca;ax.YTick = [0.05 0.2:0.2:1.2 1.35];
    ax = gca;ax.XTick = [0.1:0.05:0.35];
    h = xlabel('$f_r$');set(h,'Interpreter','latex');
    h = ylabel('$A_y/d$');set(h,'Interpreter','latex');
    hold off
    saveas(gcf, [path '/Clv/'...
        num2str(num, '%02d') '_' G_d{num} '.fig']);
end

for num = 1:13
    Cmy = data.Cmy{num};
    figure(1)
    [C,h] = contour(fr,AyD,Cmy, Cmylevs, '-k');
    clabel(C,h,'FontSize',12,'Fontname', 'Times');
    hold on;
    contour(fr,AyD,Cmy, [0 0], '-r', 'LineWidth',2);
    set(gca,'FontSize',14);set(gca,'Fontname', 'Times')
    ax = gca;ax.YTick = [0.05 0.2:0.2:1.2 1.35];
    ax = gca;ax.XTick = [0.1:0.05:0.35];
    h = xlabel('$f_r$');set(h,'Interpreter','latex');
    h = ylabel('$A_y/d$');set(h,'Interpreter','latex');
    hold off
    saveas(gcf, [path '/Cmy/'... 
        num2str(num, '%02d') '_' G_d{num} '.fig']);
end

%% Get the interpreted data between experiemntal sample points
clear all; close all; clc
load('2CylDownstream.mat')
A = [0.56,0.205];
% get Cd at AyD = 0.56 and fr = 0.205 for single cylinder case
dataInt = findInterp(AyD, fr, data.Cd{1}, A); 