function ClassAB(f,N,A,Vcc,Vtht,Vthd,RL)
   figure('Name','Class AB amplifier',...
    'Units','normalized',...
    'NumberTitle','off',...
    'Position',[0.1 0.1 0.8 0.8],...
    'Color',[0.3 0.8 0.3]);

label_meniu();
T=1/f;
t=(0:T/100:N*T);
vin=A*sin(2*pi*f*t);%input voltage
for t1=1:length(vin)%define output voltage
    if vin(t1)>=0
        if vin(t1)+Vthd<Vtht
            vout(t1)=0;
        elseif vin(t1)+Vthd-Vtht>Vcc
            vout(t1)=Vcc;
        else
            vout(t1)=vin(t1)+Vthd-Vtht;
        end
    elseif vin(t1)<0
        if vin(t1)-Vthd>-Vtht
            vout(t1)=0;
        elseif vin(t1)-Vthd+Vtht<-Vcc
            vout(t1)=-Vcc;
        else
            vout(t1)=vin(t1)-Vthd+Vtht;
        end
    end
end

Pps=(2/pi)*Vcc*Vcc/(RL);%power from the power supply
Vo=max(vout);
Po=Vo*Vo/(2*RL);%output power

subplot('position',[0.1 0.72 0.4 0.25]); %plot vi
plot(t,vin); 
grid on;
title('Vin');
set(gca,'YTick',[min(vin) 0 max(vin)] );
ylim([min(vin)-1 max(vin)+1]);
xlabel('time[s]'); 
ylabel('Magnitude[V]');  

subplot('position',[0.1 0.39 0.4 0.25]);%plot vo
plot(t,vout); 
grid on; 
title('Vout'); 
set(gca,'YTick',[min(vout) 0 max(vout)] );
ylim([min(vout)-1 max(vout)+1]);
xlabel('time[s]'); 
ylabel('Magnitude[V]'); 

subplot('position',[0.1 0.06 0.4 0.25]);%plot vo(vi)
plot(vin,vout); 
grid on; 
title('VTC Vout(Vin)'); 
set(gca,'YTick',[min(vout) 0 max(vout)] );
set(gca,'XTick',[min(vin) 0 max(vin)]);
ylim([min(vout)-1 max(vout)+1]);
xlim([min(vin)-1 max(vin)+1]);
xlabel('Vin [V]'); 
ylabel('Vout [V]'); 

uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.55 0.90 0.3 .065],...
    'backgroundcolor',[0.5 0.7 0.9],...
    'string','The circuit','FontSize',22); 

w = imread('CAB.jpg'); %reads the picture
subplot('position',[0.55 0.32 0.3 0.65]);
imshow(w,[]) %displays the picture

uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.55 0.3 0.08 .05],...
    'backgroundcolor',[0.5 0.7 0.9],...
    'string','Power given by Vcc [W]: '); 
uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.55 0.25 0.08 .05],...
    'backgroundcolor',[1 1 1],...
    'string',Pps); 

uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.65 0.3 0.08 .05],...
    'backgroundcolor',[0.5 0.7 0.9],...
    'string','Output power [W]: '); 
uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.65 0.25 0.08 .05],...
    'backgroundcolor',[1 1 1],...
    'string',Po); 

uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.75 0.3 0.08 .05],...
    'backgroundcolor',[0.5 0.7 0.9],...
    'string','Efficiency [%]: '); 
uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.75 0.25 0.08 .05],...
    'backgroundcolor',[1 1 1],...
    'string',Po*100/Pps); 

uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.9 0.9 0.08 .05],...
    'backgroundcolor',[0.5 0.7 0.9],...
    'string','Ampl of Vin [V]'); 
% edit for A      
uicontrol('Style','edit',...
    'Units','normalized',...
    'Position',[0.9 0.87 0.08 .05],...
    'String',A,...
    'Callback',['A=str2num(get(gco,''string'')),close;ClassAB(f,N,A,Vcc,Vtht,Vthd,RL);']); 
% Text Button Vcc
uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.9 0.8 0.08 .05],...
    'backgroundcolor',[0.5 0.7 0.9],...
    'string','Vcc [V]'); 
% edit for Vcc      
uicontrol('Style','edit',...
    'Units','normalized',...
    'Position',[0.9 0.77 0.08 .05],...
    'String',Vcc,...
    'Callback',['Vcc=str2num(get(gco,''string'')),close;ClassAB(f,N,A,Vcc,Vtht,Vthd,RL);']); 
uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.9 0.7 0.08 .05],...
    'backgroundcolor',[0.5 0.7 0.9],...
    'string','frequency'); 
% edit for f      
uicontrol('Style','edit',...
    'Units','normalized',...
    'Position',[0.9 0.67 0.08 .05],...
    'String',f,...
    'Callback',['f=str2num(get(gco,''string'')),close;ClassAB(f,N,A,Vcc,Vtht,Vthd,RL);']);
uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.9 0.6 0.08 .05],...
    'backgroundcolor',[0.5 0.7 0.9],...
    'string','No of periods'); 
% edit for N
uicontrol('Style','edit',...
    'Units','normalized',...
    'Position',[0.9 0.57 0.08 .05],...
    'String',N,...
    'Callback',['N=str2num(get(gco,''string'')),close;ClassAB(f,N,A,Vcc,Vtht,Vthd,RL);']); 
uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.9 0.5 0.08 .05],...
    'backgroundcolor',[0.5 0.7 0.9],...
    'string','RL [Ohm]'); 
% edit for RL
uicontrol('Style','edit',...
    'Units','normalized',...
    'Position',[0.9 0.47 0.08 .05],...
    'String',RL,...
    'Callback',['RL=str2num(get(gco,''string'')),close;ClassAB(f,N,A,Vcc,Vtht,Vthd,RL);']); 

uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.9 0.4 0.08 .04],...
    'backgroundcolor',[0.5 0.7 0.9],...
    'string','VThres trans [V]'); 
uicontrol('Style','slider',...
             'Units','normalized',...
             'Position',[0.9 0.38 .08 .04],...
             'Min',0.6,'Max',0.7,'Value',Vtht,...
             'sliderstep',[0.02/(0.7-0.6) 0.02/(0.7-0.6)],...
             'sliderstep',[0.02/(0.7-0.6) 0.02/(0.7-0.6)],...
             'Callback','Vtht=(get(gcbo,''value'')),close;ClassAB(f,N,A,Vcc,Vtht,Vthd,RL);');
uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.875 0.38 0.026 .04],...
    'backgroundcolor',[0.5 0.7 0.9],...
    'string','0.6'); 
uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.979 0.38 0.026 .04],...
    'backgroundcolor',[0.5 0.7 0.9],...
    'string','0.7'); 

uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.9 0.33 0.08 .04],...
    'backgroundcolor',[0.5 0.7 0.9],...
    'string','VThres diode [V]'); 
uicontrol('Style','slider',...
             'Units','normalized',...
             'Position',[0.9 0.31 .08 .04],...
             'Min',0.6,'Max',0.7,'Value',Vthd,...
             'sliderstep',[0.02/(0.7-0.6) 0.02/(0.7-0.6)],...
             'sliderstep',[0.02/(0.7-0.6) 0.02/(0.7-0.6)],...
             'Callback','Vthd=(get(gcbo,''value'')),close;ClassAB(f,N,A,Vcc,Vtht,Vthd,RL);');
uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.875 0.31 0.026 .04],...
    'backgroundcolor',[0.5 0.7 0.9],...
    'string','0.6'); 
uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.979 0.31 0.026 .04],...
    'backgroundcolor',[0.5 0.7 0.9],...
    'string','0.7'); 


uicontrol('Style','pushbutton',...
         'Units','normalized',...
         'Position',[0.9 0.24 0.08 .05],...
         'string','INFO',...
         'Callback','close;infoAB();'); 

uicontrol('Style','pushbutton',...
         'Units','normalized',...
         'Position',[0.9 0.17 0.08 .05],...
         'string','RESET',...
         'Callback','close;ClassAB(50,5,3,3,0.7,0.7,10)'); 
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