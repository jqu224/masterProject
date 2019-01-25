function choice = choosedialog_plot_power_all_avg_dba
% choose from 'plot all figures' or 'pull and save the data'

    d = dialog('Units','normalized','Position',[0.4 0.6 0.2 0.2],'Name','Select One');
    txt = uicontrol('Parent',d,...
           'Style','text',...
           'FontUnits', 'pixels',  'FontSize', 17,...
           'Units','normalized','Position',[0.15 0.6 0.7 0.3],...
           'String','Plot all or save data to file?');
       
    popup = uicontrol('Parent',d,...
           'Style','popup',...
           'Units','normalized','Position',[0.32 0.5 0.4 0.2],...
           'String',{'plot all figures';'pull and save the data'},...
           'Callback',@popup_callback);
       
    btn = uicontrol('Parent',d,...
           'Units','normalized','Position',[0.4 0.2 0.2 0.2],...
           'String','OK',...
           'Callback','delete(gcf)');
       
    choice = 'PLEASE CHOOSE:';
       
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