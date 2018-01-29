% randomly plot the features of selected kind of wav 
close all 
clear all
choice = choosedialog_art;

switch choice
    case 'aircraft'
        dirOutput = dir(fullfile('air*.wav'));
    case 'rail'
        dirOutput = dir(fullfile('rail+*.wav'));
    case 'truck'
        dirOutput = dir(fullfile('truck*.wav'));
    otherwise
        disp('which one?')
        % dirOutput = dir(fullfile('railh*.wav'));
        % dirOutput = dir(fullfile('mbta*.wav'));
end

fileNames1 = {dirOutput.name};
numfile = size(fileNames1);



prompt = {'start freq (must be at least 1)', 'end freq (upper bound better to be lower than 3000)'};
dlg_title = 'Enter Endpoints/Termination point for selected freq:';
num_lines = 1;
defaultans = {'1', '3000'};
answer = inputdlg(prompt, dlg_title, [1 155; 1 155], defaultans,'on');

frt = str2num(answer{1});
scd = str2num(answer{2});
if frt < scd
    F = [frt:scd];
    % randomly choose one of the .wav file
    n = randi(numfile,1)

        figure(n)
        [y,Fs(n)] = audioread(fileNames1{n});

         x = y(:,1);
        npts = round(Fs(n))/8;
        wind = hann(npts);  
         F = [1:3000];
        pxx = pwelch(x,wind,0.5,F,Fs(n));
        pxxdb = 10*log10(pxx);
        hold on
    %     spectrogram over the whole freq
        subplot(221)
        spectrogram(y(:,1),round(Fs(n))/2,[],[],Fs(n),'yaxis')
        title(fileNames1{n})
        caxis([-110,-70]) 

    %     spectrogram over selected freq
        subplot(222)
        spectrogram(y(:,1),round(Fs(n))/2,[],F,Fs(n),'yaxis')
        caxis([-110,-70])
        title(fileNames1{n})

    %     1/3 octave spectrogram  
        subplot(223)
        x = y(:,1);
        npts = round(Fs(n))/8;
        wind = hann(npts);  
        pwelch(x,wind,0.5,F,Fs(n))

    %     partial loudness
        [a,b] = loudness_1991(y(:,1)',100,Fs(1),1);

else
    errordlg('Please make sure that endpoints of the freq band are valid and in order','Input Error');
    return
end
    

