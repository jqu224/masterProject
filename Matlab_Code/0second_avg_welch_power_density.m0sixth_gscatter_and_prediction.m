%% 6: making scatter plots labeled by group


load variance_all.mat
load xmeans_all.mat

load horn_Xmean.mat; horn_Xmean = Xmean_dB'
load rail_Xmean.mat; rail_Xmean = Xmean_dB'
load aircraft_Xmean.mat; airc_Xmean = Xmean_dB
% load mbta_Xmean.mat; mbta_Xmean = Xmean_dB'
% load truck_Xmean.mat; truck_Xmean = Xmean_dB'
s1 = repmat('rail w/   horn',size(horn_Xmean));
s2 = repmat('rail w/o  horn',size(rail_Xmean));
s3 = repmat('Aircaft  noise',size(airc_Xmean));
% s4 = repmat('MBTA Bus noise',size(mbta_Xmean));
% s5 = repmat('Truck    noise',size(truck_Xmean));
% group = strcat([s1;s2;s3;s4;s5]);
% variance = [data1(1:12,1);data1(1:32,2);data1(1:58,3);data1(1:10,4);data1(1:12,5)];
% Xmeans = [data(1:12,1);data(1:32,2);data(1:58,3);data(1:10,4);data(1:12,5)];
group = strcat([s1;s2;s3]);
variance = [data1(1:12,1);data1(1:32,2);data1(1:58,3)];
Xmeans = [data(1:12,1);data(1:32,2);data(1:58,3)];

% group = strcat([s4;s5]);
% variance = [data1(1:10,1);data1(1:12,2)];
% Xmeans = [data(1:10,1);data(1:12,2)];

figure;
gscatter(variance,Xmeans,group,'rbgkm','<o+')
xlabel('variance');
ylabel('Xmeans dB');
boldify
title('Xmeans(dB) v Variance - Scatter Plots Labeled by Group')

%
classifier_name = {'Naive Bayes','Discriminant Analysis','Classification Tree','Nearest Neighbor'};


choice = choosedialog_classifier;
x1range = min(variance):.01:max(variance);
x2range = min(Xmeans):.01:max(Xmeans);
[xx1, xx2] = meshgrid(x1range,x2range);
XGrid = [xx1(:) xx2(:)];
labels = unique(group);

figure
switch choice
    case 'Naive Bayes'
       % Train a naive Bayes model.
       classifier{1} = fitcnb([variance,Xmeans],group);
       predictedspecies = predict(classifier{1},XGrid);
       gscatter(xx1(:), xx2(:), predictedspecies,'rgb');
       title(classifier_name{1})
       legend off, axis tight
       legend(labels,'Location',[0.35,0.01,0.35,0.05],'Orientation','Horizontal')
    case 'Discriminant Analysis' 
       % Train a discriminant analysis classifier.
       classifier{2} = fitcdiscr([variance,Xmeans],group);
       predictedspecies = predict(classifier{2},XGrid);
       gscatter(xx1(:), xx2(:), predictedspecies,'rgb');
       title(classifier_name{2})
       legend off, axis tight
       legend(labels,'Location',[0.35,0.01,0.35,0.05],'Orientation','Horizontal')
    case 'Classification Tree'
       % Train a classification decision tree.
       classifier{3} = fitctree([variance,Xmeans],group);
       predictedspecies = predict(classifier{3},XGrid);
       gscatter(xx1(:), xx2(:), predictedspecies,'rgb');
       title(classifier_name{3})
       legend off, axis tight
       legend(labels,'Location',[0.35,0.01,0.35,0.05],'Orientation','Horizontal')
    case 'K - Nearest Neighbor'  
       % Train a k-nearest neighbor classifier.
       classifier{4} = fitcknn([variance,Xmeans],group);
       predictedspecies = predict(classifier{4},XGrid);
       gscatter(xx1(:), xx2(:), predictedspecies,'rgb');
       title(classifier_name{4})
       legend off, axis tight
       legend(labels,'Location',[0.35,0.01,0.35,0.05],'Orientation','Horizontal')
    case '3D Classification Probability' 
        classifier{1} = fitcnb([variance,Xmeans],group);
        x1range = min(variance):.01:max(variance);
        x2range = min(Xmeans):.01:max(Xmeans);
        [xx1, xx2] = meshgrid(x1range,x2range);
        XGrid = [xx1(:) xx2(:)];
        [predictedspecies,Posterior,~] = predict(classifier{1},XGrid);

        sz = size(xx1);
        s = max(Posterior,[],2);
        figure('Units','Normalized','Position',[0.25,0.55,0.4,0.35]);
        hold on
        surf(xx1,xx2,reshape(Posterior(:,1),sz),'FaceColor','green','EdgeColor','none')
        surf(xx1,xx2,reshape(Posterior(:,2),sz),'FaceColor','red','EdgeColor','none')
        surf(xx1,xx2,reshape(Posterior(:,3),sz),'FaceColor','blue','EdgeColor','none')
        xlabel('variance');
        ylabel('xmeans');
        zlabel('Probability');
        legend(labels);
        title('Classification Probability')
        alpha(0.2)
        view(3)
        hold off
    otherwise
        disp('which one?')
        % dirOutput = dir(fullfile('railh*.wav'));
        % dirOutput = dir(fullfile('mbta*.wav'));
end






