function label_meniu()

h = uimenu('Label','Menu');%label meniu
uimenu(h,'Label','Power amplifier app','Callback','close;Meniu(f,N,Vcc,Vtht,Vthd,A,RL)' ,...
 'Accelerator','P');
uimenu(h,'Label','Web info','Callback','web(''https://www.electronicshub.org/power-amplifier/'')',...
    'Accelerator','W');
uimenu(h,'Label','Documentation','Callback','open(''doc.pdf'')');
uimenu(h,'Label','Close','Callback','close',...
 'Separator','on','Accelerator','C');
