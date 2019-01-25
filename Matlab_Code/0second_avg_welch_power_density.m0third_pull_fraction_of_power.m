% 3 pull and save the data as fractionofpower_' choice '.mat
% before making 'notboxplots' of the power in different frequency bins - 

choice = choosedialog_art_all;

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


% for 1/3 octave freq bands:
% '0-22Hz','22-44Hz','44-88Hz','88-176Hz','176-353Hz','353-707Hz','707-1414Hz','1414-3000Hz'
prompt = {'firstslide', 'secondslide', 'thirdslide', 'fourthslide', 'fifthslide', 'sixthslide', 'seventhslide'};
dlg_title = 'Enter seven Endpoints/Termination point for eight frequency intervals:';
num_lines = 1;
defaultans = {'22','44','88','176','353','707','1414'};
answer = inputdlg(prompt, dlg_title, [1 155; 1 155; 1 155; 1 155; 1 155; 1 155; 1 155], defaultans,'on');

frt = str2num(answer{1});
scd = str2num(answer{2});
trd = str2num(answer{3});
frh = str2num(answer{4});
fvh = str2num(answer{5});
six = str2num(answer{6});
sev = str2num(answer{7});
    
% make sure the seven endpoints are in order:
if frt<scd && scd<trd && trd<frh && frh<fvh && fvh<six && six<sev
    seven_choice = sprintf(['seven_octave_freq_band.mat']);
    save(seven_choice,'answer');
    fileNames1 = {dirOutput.name};
    numfile = size(fileNames1);
    for n = 1:numfile(2)
        [y,Fs(n)] = audioread(fileNames1{n});
        Fs = 48000;

        x = y(:,1);
        npts = round(Fs)/8;
        wind = hann(npts);  
        F = [1:3000];
        pxx = pwelch(x,wind,0.5,F,Fs);

        [firstslide, secondslide, thirdslide, fourthslide, fifthslide, sixthslide, seventhslide, eighthslide] = fractionPower(pxx,frt,scd,trd,frh,fvh,six,sev);
       fractionofpower(n,:) = [firstslide, secondslide, thirdslide, fourthslide, fifthslide, sixthslide, seventhslide, eighthslide];

    end
    filename_choice = sprintf(['fractionofpower_' choice '.mat']);
    save(filename_choice,'pxxdb')
else
    errordlg('please make sure that seven endpoints of the 8 freq band are in order','Input Error');
    return
end



