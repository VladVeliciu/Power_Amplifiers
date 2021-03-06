function Power()

figure('Name','Info Power',...
    'Units','normalized',...
    'NumberTitle','off',...
    'Position',[0.1 0.1 0.8 0.8],...
    'Color',[0.3 0.9 0.3]); 

label_meniu();

uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.3 0.90 0.3 .075],...
    'backgroundcolor',[0.3 0.9 0.3],...
    'string','Power computance','FontSize',22);

w = imread('power.jpg'); %reads the picture% 
subplot('position',[0.25 0.22 0.45 0.65]);
imshow(w,[]) %displays the picture%

uicontrol('Style','pushbutton',...
    'Units','normalized',...
    'Position',[0.9 0.1 0.08 .05],...
    'String','BACK',...
    'Callback','close;Meniu(50,5,3,0.7,0.7,3,10)');
uicontrol('Style','pushbutton',...
    'Units','normalized',...
    'Position',[0.9 0.03 0.08 .05],...
    'String','CLOSE',...
    'Callback','close'); 
