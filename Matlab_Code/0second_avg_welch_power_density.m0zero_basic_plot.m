% randomly plot the features of selected kind of wav 
close all 
clear all
choice = choosedialog_art;

num_lines = 0; % indicate wheather there is a file selected by the user
switch choice
    case 'aircraft'
        dirOutput = dir(fullfile('air*.wav'));
    case 'rail'
        dirOutput = dir(fullfile('rail+*.wav'));
    case 'truck'
        dirOutput = dir(fullfile('truck*.wav'));
    otherwise
        % ask the user to type in a file name: 
        prompt = {'type the file name...'};
        dlg_title = 'Select a file:';
        num_lines = 1;
        defaultans = {'rail+out+1220am+rail1+0528+000254+001835+25s.wav'};
        answer = inputdlg(prompt, dlg_title, [1 155], defaultans,'on');
        dirOutput = dir(fullfile('*.wav'));
        % dirOutput = dir(fullfile('railh*.wav'));
        % dirOutput = dir(fullfile('mbta*.wav'));
end

% store the number of filenames
fileNames = {dirOutput.name};
numfile = size(fileNames);


if num_lines == 0 % randomly select a file
    n = randi(numfile(2),1);
elseif num_lines == 1 % find the filename selected by the user  
    is_file = strcmp(fileNames, answer);
    n = find(is_file==1);
end

prompt = {'start freq (must be at least 1)', 'end freq (upper bound better to be lower than 3000)'};
dlg_title = 'Enter Endpoints/Termination points for selected freq:';
num_lines = 1;
defaultans = {'1', '3000'};
answer = inputdlg(prompt, dlg_title, [1 155; 1 155], defaultans,'on');

frt = str2num(answer{1});
scd = str2num(answer{2});
if frt < scd
        F = [frt:scd];
        figure(n)
        [y,Fs(n)] = audioread(fileNames{n});
        x = y(:,1);
        npts = round(Fs(n))/8;
        wind = hann(npts);  
        pxx = pwelch(x,wind,0.5,F,Fs(n));
        pxxdb = 10*log10(pxx);
        hold on
        
    %   spectrogram 
        subplot(231)
        spectrogram(y(:,1),round(Fs(n))/2,[],[],Fs(n),'yaxis')
        title(fileNames{n})
        caxis([-110,-70]) 

    %   spectrogram over selected freq
        subplot(232)
        spectrogram(y(:,1),round(Fs(n))/2,[],F,Fs(n),'yaxis')
        caxis([-110,-70])
        title(fileNames{n})
        
    %   psd estimate
        subplot(233)
        x = y(:,1);
        npts = round(Fs(n))/8;
        wind = hann(npts);  
        pwelch(x,wind,0.5,F,Fs(n))

    %   1/3 octave spectrogram  
    %   partial loudness
        [a,b] = loudness_1991(y(:,1)',100,Fs(n),1);

else
    errordlg('Please make sure that endpoints of the freq band are valid and in order','Input Error');
    return
end
    

