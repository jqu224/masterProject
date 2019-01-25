function [firstslide, secondslide, thirdslide, fourthslide, fifthslide, sixthslide, seventhslide, eighthslide] = fractionPower(pxx,frt,scd,trd,frh,fvh,six,sev)
    pxxsum = sum(pxx);
   
    switch nargin
        case 8 % 7 clapboard: 8 interval    
            firstslide = sum(pxx(1:frt))/pxxsum; 
            secondslide = sum(pxx(frt+1:scd))/pxxsum; 
            thirdslide = sum(pxx(scd+1:trd))/pxxsum;
            fourthslide = sum(pxx(trd+1:frh))/pxxsum; 
            fifthslide  = sum(pxx(frh+1:fvh))/pxxsum; 
            sixthslide  = sum(pxx(fvh+1:six))/pxxsum; 
            seventhslide  = sum(pxx(six+1:sev))/pxxsum; 
            eighthslide = sum(pxx(sev+1:3000))/pxxsum;
        case 4 % 3 clapboard: 4 interval
            firstslide = sum(pxx(1:frt))/pxxsum;
            secondslide = sum(pxx(frt+1:scd))/pxxsum; 
            thirdslide = sum(pxx(scd+1:trd))/pxxsum;
            fourthslide = sum(pxx(trd+1:3000))/pxxsum; 
        otherwise
            disp('which one?')
        end
    % frt = 22
    % scd = 44
    % trd = 88
    % frh = 176
    % fvh = 353
    % six = 707
    % sev = 1414

end


