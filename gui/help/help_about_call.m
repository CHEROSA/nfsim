function [] = help_about_call(src,eventdata)
    h_dlg = dialog('units','normalized',...
        'position',[0.3, 0.3, 0.4, 0.4],...
        'menubar','none',...
        'name','About nfsim',...
        'numbertitle','off',...
        'resize','off');
    ax = axes('units', 'normalized', 'position', [0, 0, 1, 1]);
    axis(ax, [0, 1, 0, 1])

    [logo, map, alpha] = imread('nfsim_logo.png');
    himg = image(...
        'Parent', ax,...
        'CData' , logo,...
        'XData' , [0.2, 0.8],...
        'YData' , [1, 0.5]);
    colormap(map);
    set(himg, 'AlphaData', alpha);
    set(ax, 'xtick', [], 'ytick', [])

    tx = text(0.5, 0.3,...
        {'Navigation Function Toolbox for MATLAB',...
        'Created by Ioannis Filippidis',...
        'Control Systems Lab', 'Mechanical Engineering Department'...
        'National Technical University of Athens', 'Greece', '',...
        'Version 0.01',...
        'Copyright (c) 2010-2011 Ioannis Filippidis', '',...
        'jfilippidis@gmail.com'},...
        'Parent', ax,...
        'fontsize', 10,...
        'HorizontalAlignment', 'center',...
        'units', 'normalized');
end