%% 2 plot avg of welch_power_density 
close all
clear all
    F = [1:3000];
load pxxdb_welch_power_density_aircrafts.mat
airc_pxxdb = pxxdb;

load pxxdb_welch_power_density_rail.mat % rail+* without horns
rail_pxxdb = pxxdb;

load pxxdb_welch_power_density_truck.mat
truc_pxxdb = pxxdb;
% 
% load pxxdb_welch_power_density_mbtabus.mat
% mbta_pxxdb = pxxdb;

% load pxxdb_welch_power_density_rail_w:h.mat
% horn_pxxdb = pxxdb;

% the mean, stdev, and standard error for each kind of data
mn1 = mean(airc_pxxdb,1);
sd1 = std(airc_pxxdb,[],1);
nExamples = size(airc_pxxdb);
se1 = sd1./sqrt(nExamples(1));

% % 
% mn2 = mean(mbta_pxxdb,1);
% sd2 = std(mbta_pxxdb,[],1);
% nExamples = size(mbta_pxxdb);
% se2 = sd2./sqrt(nExamples(1));

% % 
% mn3 = mean(horn_pxxdb,1);
% sd3 = std(horn_pxxdb,[],1);
% nExamples = size(horn_pxxdb);
% se3 = sd3./sqrt(nExamples(1));

mn4 = mean(rail_pxxdb,1);
sd4 = std(rail_pxxdb,[],1);
nExamples = size(rail_pxxdb);
se4 = sd4./sqrt(nExamples(1));

mn5 = mean(truc_pxxdb,1);
sd5 = std(truc_pxxdb,[],1);
nExamples = size(truc_pxxdb);
se5 = sd5./sqrt(nExamples(1));


figure(10)
h1 = plotRstyleUncert(F,mn1,se1*2,'b');
hold on
% h2 = plotRstyleUncert(F,mn2,se2*2,'y');
% h3 = plotRstyleUncert(F,mn3,se3*2,'m');
h4 = plotRstyleUncert(F,mn4,se4*2,'r');
h5 = plotRstyleUncert(F,mn5,se5*2,'g');
% y m c r g b w
legend([h1 h4 h5],'airplanes','rail','trucks');
% legend([h1 h2 h3 h4 h5],'planes','buses','rail w/ horns','rail w/o horns','trucks');
xlabel('frequency (Hz)')
ylabel('power/frequency(dB/Hz)');
title('Welch''s power spectral density estimate');
hold off
