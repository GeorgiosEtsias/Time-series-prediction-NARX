% Creates a prediction using an already trained closed NARX
%X = tonndata(InputT5,false,false);
%T = tonndata(OutputT5,false,false);
%% Drive Cycle 1
X2=TestInput2;
T2=TestOutput2;

[x,xi,ai,t] = preparets(netc,X2,{},T2);
yc2 = netc(x,xi,ai);
yc2=yc2';

a=(cell2mat(T2))';
b=cell2mat(yc2);
error2 = immse(a(3:end),b)
clear a b 
%% Drive Cycle 2
X11=TestInput11;
T11=TestOutput11;

[x,xi,ai,t] = preparets(netc,X11,{},T11);
yc11 = netc(x,xi,ai);
yc11=yc11';

a=(cell2mat(T11))';
b=cell2mat(yc11);
error11 = immse(a(3:end),b)
clear a b
%% Drive Cycle 3
X19=TestInput19;
T19=TestOutput19;

[x,xi,ai,t] = preparets(netc,X19,{},T19);
yc19 = netc(x,xi,ai);
yc19=yc19';

a=(cell2mat(T19))';
b=cell2mat(yc19);
error19 = immse(a(3:end),b)

T2=T2';
T11=T11';
T19=T19';
clearvars -except yc2 yc11 yc19 T2 T11 T19
