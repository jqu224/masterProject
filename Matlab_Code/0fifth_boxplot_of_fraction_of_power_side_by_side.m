%% 5: boxplot of fraction of power side by side 

load seven_octave_freq_band.mat
frt = answer{1};
scd = answer{2};
trd = answer{3};
frh = answer{4};
fvh = answer{5};
six = answer{6};
sev = answer{7};
% xt is the x axis, default setting is as the following:
% xt = {'0-22Hz','22-44Hz','44-88Hz','88-176Hz','176-353Hz','353-707Hz','707-1414Hz','1414-3000Hz'} ; 
xt = {['0-' frt 'Hz'],[frt '-' scd 'Hz'],[scd '-' trd 'Hz'],[trd '-' frh 'Hz'],[frh '-' fvh 'Hz'],[fvh '-' six 'Hz'],[six '-' sev 'Hz'],[sev '- 3000Hz']} ; 
        

load fractionofpower_rail_wo_horn.mat
rail_fracpower = fractionofpower;
% 
% load fractionofpower_rail_and_horn.mat
% horn_fracpower = fractionofpower;
% 
% load fractionofpower_mbta.mat
% mbta_fracpower = fractionofpower;

load fractionofpower_truck.mat
truc_fracpower = fractionofpower;


load fractionofpower_aircrafts.mat
airc_fracpower = fractionofpower;

% boxplot(fractionofpower)



size1 = size(rail_fracpower);

Xpos = [15 55 95 135 175 215 255 295];
group = [repmat(Xpos(1), size1(1), 1); ...
         repmat(Xpos(2), size1(1), 1); ...
         repmat(Xpos(3), size1(1), 1); ...
         repmat(Xpos(4), size1(1), 1); ...
         repmat(Xpos(5), size1(1), 1); ...
         repmat(Xpos(6), size1(1), 1); ...
         repmat(Xpos(7), size1(1), 1); ...
         repmat(Xpos(8), size1(1), 1)];
figure
rail_fracpower1 = rail_fracpower(:);
x1 = boxplot(rail_fracpower1,group,'positions', Xpos,'colors','r','Widths',5,'BoxStyle','filled');
xx = 0:0.0000000001:0.0000000001;
hold on
h1 = plot(xx,'g');
h2 = plot(xx,'m');
h3 = plot(xx,'b');


size1 = size(truc_fracpower);
Xpos1 = Xpos+10;
group1 = [repmat(Xpos1(1), size1(1), 1); ...
         repmat(Xpos1(2), size1(1), 1); ...
         repmat(Xpos1(3), size1(1), 1); ...
         repmat(Xpos1(4), size1(1), 1); ...
         repmat(Xpos1(5), size1(1), 1); ...
         repmat(Xpos1(6), size1(1), 1); ...
         repmat(Xpos1(7), size1(1), 1); ...
         repmat(Xpos1(8), size1(1), 1)];
truc_fracpower1 = truc_fracpower(:);
x2 = boxplot(truc_fracpower1,group1,'positions', Xpos1,'colors','b','Widths',5,'BoxStyle','filled');

size1 = size(airc_fracpower);
Xpos2 = Xpos1+10;
group2 = [repmat(Xpos2(1), size1(1), 1); ...
         repmat(Xpos2(2), size1(1), 1); ...
         repmat(Xpos2(3), size1(1), 1); ...
         repmat(Xpos2(4), size1(1), 1); ...
         repmat(Xpos2(5), size1(1), 1); ...
         repmat(Xpos2(6), size1(1), 1); ...
         repmat(Xpos2(7), size1(1), 1); ...
         repmat(Xpos2(8), size1(1), 1)];
airc_fracpower1 = airc_fracpower(:);
x3 = boxplot(airc_fracpower1,group2,'positions', Xpos2,'colors','g','Widths',5,'BoxStyle','filled');

% h5 = plot(xx,'r');
% h4 = plot(xx,'k');

% size1 = size(horn_fracpower);
% 
% Xpos = Xpos+5;
% group = [repmat(Xpos(1), size1(1), 1); ...
%          repmat(Xpos(2), size1(1), 1); ...
%          repmat(Xpos(3), size1(1), 1); ...
%          repmat(Xpos(4), size1(1), 1); ...
%          repmat(Xpos(5), size1(1), 1); ...
%          repmat(Xpos(6), size1(1), 1); ...
%          repmat(Xpos(7), size1(1), 1); ...
%          repmat(Xpos(8), size1(1), 1)];
% 
% horn_fracpower = horn_fracpower(:);
% boxplot(horn_fracpower,group,'positions', Xpos,'colors','m','Widths',3);
% 
% size1 = size(mbta_fracpower);
% 
% Xpos = Xpos+5;
% group = [repmat(Xpos(1), size1(1), 1); ...
%          repmat(Xpos(2), size1(1), 1); ...
%          repmat(Xpos(3), size1(1), 1); ...
%          repmat(Xpos(4), size1(1), 1); ...
%          repmat(Xpos(5), size1(1), 1); ...
%          repmat(Xpos(6), size1(1), 1); ...
%          repmat(Xpos(7), size1(1), 1); ...
%          repmat(Xpos(8), size1(1), 1)];
% mbta_fracpower = mbta_fracpower(:);
% boxplot(mbta_fracpower,group,'positions', Xpos,'colors','b','Widths',3);

hold off
% fill(Xpos,x1,'c');


ylim([0 1])
xlim([0 320])
% hline = refline([100 0]);
% line([40 40], [0 1],'LineStyle',':')
% line([80 80], [0 1],'LineStyle',':')
% line([120 120], [0 1],'LineStyle',':')
% line([160 160], [0 1],'LineStyle',':')
% line([200 200], [0 1],'LineStyle',':')
% line([240 240], [0 1],'LineStyle',':')
% line([280 280], [0 1],'LineStyle',':')
% line([320 320], [0 1],'LineStyle',':')
xlabel('Hz')
ylabel('fraction of power')
set(gca,'xtick',25:40:350); 
set(gca,'xticklabel',xt);
legend([h1, h2, h3],'rails','trucks','aircrafts');
% % % legend([h1, h2, h3, h4, h5],'rail w/o horns','rail w/ horns','buses','trucks','aircrafts');
boldify
title('fraction of power by categories')
