function choice = choosedialog_classifier
% choose from aircraft';'rail';'truck'

    d = dialog('Units','normalized','Position',[0.4 0.6 0.2 0.2],'Name','Select One');
    txt = uicontrol('Parent',d,...
           'Style','text',...
           'FontUnits', 'pixels',  'FontSize', 17,...
           'Units','normalized','Position',[0.15 0.6 0.7 0.3],...
           'String','Select a catergory:');
       
    popup = uicontrol('Parent',d,...
           'Style','popup',...
           'Units','normalized','Position',[0.32 0.5 0.4 0.2],...
           'String',{'Naive Bayes';'Discriminant Analysis';'Classification Tree';'K - Nearest Neighbor' ;'3D Classification Probability'},...
           'Callback',@popup_callback);
       
    btn = uicontrol('Parent',d,...
           'Units','normalized','Position',[0.4 0.2 0.2 0.2],...
           'String','OK',...
           'Callback','delete(gcf)');
       
    choice = '3D Classification Probability';
       
    % Wait for d to close before running to completion
    uiwait(d);
   
       function popup_callback(popup,event)
          idx = popup.Value;
          popup_items = popup.String;
          % This code uses dot notation to get properties.
          % Dot notation runs in R2014b and later.
          % For R2014a and earlier:
          % idx = get(popup,'Value');
          % popup_items = get(popup,'String');
          choice = char(popup_items(idx,:));
       end
end
