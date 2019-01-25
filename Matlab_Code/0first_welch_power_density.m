%% 1? welch_power_density 
% this is the very first script that saves/plots welch_power_density of a
% particular category of noise
close all
clear all
dirOutputAircraft = dir(fullfile('air*.wav')); 
dirOutputRail = dir(fullfile('rail+*.wav'));
dirOutputTruck = dir(fullfile('truck+*.wav'));
% dirOutput = dir(fullfile('m*.wav')); % for motor
 
fileNames_Air = {dirOutputAircraft.name};
fileNames_Rail = {dirOutputRail.name};
fileNames_Truck = {dirOutputTruck.name};

numfile_Air = size(fileNames_Air);
numfile_Rail = size(fileNames_Rail);
numfile_Truck = size(fileNames_Truck);

choice = choosedialog_art_all;

switch choice
    case 'aircraft'
       numfile = numfile_Air;
       fileNames = fileNames_Air;
    case 'rail'
       numfile = numfile_Rail;
       fileNames = fileNames_Rail;
    case 'truck'
       numfile = numfile_Truck;
       fileNames = fileNames_Truck;
    otherwise
       warndlg('you need to choose a category')
       return
end

message = sprintf('You have chosen %d wav files, press OK to plot welch power density.\n This could take a long time\n', numfile(2));
button = questdlg(message, 'Cancel', 'Cancel', 'Continue', 'Continue');
if strcmpi(button, 'Cancel')
	return; % Or break or continue
end

type_of_plot = choosedialog_plot_power_all_avg_dba;


switch type_of_plot
    case 'plot all figures'
        figure 
        hold on
            for n = 1:numfile(2)
                [y,Fs(n)] = audioread(fileNames{n});
                Fs = 48000;

                F = [1:3000];
                x = y(:,1);
                npts = round(Fs)/8;
                wind = hann(npts);  
                pwelch(x,wind,0.5,F,Fs);
                pxx = pwelch(x,wind,0.5,F,Fs);
                pxxdb(n,:) = 10*log10(pxx);

            end
        hold off
    case 'pull and save the data'
        for n = 1:numfile(2)
            [y,Fs(n)] = audioread(fileNames{n});
            Fs = 48000;

            F = [1:3000];
            x = y(:,1);
            npts = round(Fs)/8;
            wind = hann(npts);  
            pxx = pwelch(x,wind,0.5,F,Fs);
            pxxdb(n,:) = 10*log10(pxx);
        end
        filename_choice = sprintf(['pxxdb_welch_power_density_' choice '.mat']);
        save(filename_choice,'pxxdb')
    otherwise
        disp('which one?')
end
