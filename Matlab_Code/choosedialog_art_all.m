function choice = choosedialog_art_all
% choose from aircraft';'rail';'truck'
% 0first_welch_powerdensity

    d = dialog('Units','normalized','Position',[0.4 0.6 0.2 0.2],'Name','saves and plots Welch Power Density of a particular category of noise');
    txt = uicontrol('Parent',d,...
           'Style','text',...
           'FontUnits', 'pixels',  'FontSize', 17,...
           'Units','normalized','Position',[0.15 0.6 0.7 0.3],...
           'String','Select a category:');
       
    popup = uicontrol('Parent',d,...
           'Style','popup',...
           'Units','normalized','Position',[0.32 0.5 0.4 0.2],...
           'String',{'aircraft';'rail';'truck'},...
           'Callback',@popup_callback);
       
    btn = uicontrol('Parent',d,...
           'Units','normalized','Position',[0.4 0.2 0.2 0.2],...
           'String','OK',...
           'Callback','delete(gcf)');
       
    choice = 'aircraft';
       
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
