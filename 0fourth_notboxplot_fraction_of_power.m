%% 4 making 'notboxplots' of the power in different frequency bins - 

load seven_octave_freq_band.mat

frt = answer{1};
scd = answer{2};
trd = answer{3};
frh = answer{4};
fvh = answer{5};
six = answer{6};
sev = answer{7};
% xt is the x axis
% xt = {'0-22Hz','22-44Hz','44-88Hz','88-176Hz','176-353Hz','353-707Hz','707-1414Hz','1414-3000Hz'} ; 
xt = {['0-' frt 'Hz'],[frt '-' scd 'Hz'],[scd '-' trd 'Hz'],[trd '-' frh 'Hz'],[frh '-' fvh 'Hz'],[fvh '-' six 'Hz'],[six '-' sev 'Hz'],[sev '- 3000Hz']} ; 
        


choice = choosedialog_art;

load fractionofpower_aircrafts.mat
airc_fracp = fractionofpower;


load fractionofpower_rail_wo_horn.mat
rail_fracp = fractionofpower;

load fractionofpower_truck.mat
truc_fracp = fractionofpower;

% load fractionofpower_mbta.mat
% mbta_fracp = fractionofpower;
% 
% load fractionofpower_rail_and_horn.mat
% horn_fracp = fractionofpower;


switch choice
    case 'aircraft'
        figure
        notBoxPlot(airc_fracp)
        title('fraction of power of aircraft noise by frequency range')
        set(gca,'xtick',1:8); 
        set(gca,'xticklabel',xt);
    case 'rail'
        figure
        notBoxPlot(rail_fracp);
        title('fraction of power of rail without horn noise by frequency range')
        set(gca,'xtick',1:8); 
        set(gca,'xticklabel',xt);
    case 'truck'
        figure
        notBoxPlot(truc_fracp)
        title('fraction of power of truck noise by frequency range')
        set(gca,'xtick',1:8); 
        set(gca,'xticklabel',xt);
    otherwise
        disp('which one?')
        errordlg('please choose a valid category','Input Error');
%         figure
        % dirOutput = dir(fullfile('railh*.wav'));
        % notBoxPlot(horn_fracp)
        % title('fraction of power of rail with horn noise by frequency range')
        % xt = {'0-22Hz','22-44Hz','44-88Hz','88-176Hz','176-353Hz','353-707Hz','707-1414Hz','1414-3000Hz'} ; 
        % set(gca,'xtick',1:8); 
        % set(gca,'xticklabel',xt);
        
        % dirOutput = dir(fullfile('mbta*.wav'));
        % notBoxPlot(mbta_fracp)
        % title('fraction of power of mbta buses noise by frequency range')
        % xt = {'0-22Hz','22-44Hz','44-88Hz','88-176Hz','176-353Hz','353-707Hz','707-1414Hz','1414-3000Hz'} ; 
        % set(gca,'xtick',1:8); 
        % set(gca,'xticklabel',xt);

end


