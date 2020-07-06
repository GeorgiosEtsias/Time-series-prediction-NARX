% Creates a prediction using an already trained closed NARX
%X = tonndata(InputT5,false,false);
%T = tonndata(OutputT5,false,false);
load ('netcbest')
load('netbest')
% Number of delays
delay=2;
%% Drive Cycle 1
% ---open loop narx---
X2open=TestInput2(1:116);
T2open=TestOutput2(1:116);

[x,xi,ai,t] = preparets(netbest,X2open,{},T2open);
yo2= netbest(x,xi,ai);
%ycopen2=ycopen2';

% ---closed loop narx---
X2closed=[X2open(end-delay+1:end),TestInput2(117:end)];
T2closed=[yo2(end-delay+1:end),TestOutput2(117:end)];

[x,xi,ai,t] = preparets(netcbest,X2closed,{},T2closed);
yc2 = netcbest(x,xi,ai);
yc2=yc2';

a=(cell2mat(T2closed))';
b=cell2mat(yc2);
error2 = immse(a(delay+1:end),b);
clear a b 
yo2=yo2';

yoc2=[(TestOutput2(1:delay))';yo2;yc2];

%% Drive Cycle 2
% ---open loop narx---
X11open=TestInput11(1:48);
T11open=TestOutput11(1:48);

[x,xi,ai,t] = preparets(netbest,X11open,{},T11open);
yo11= netbest(x,xi,ai);
%ycopen11=ycopen11';

% ---closed loop narx---
X11closed=[X11open(end-delay+1:end),TestInput11(49:end)];
T11closed=[yo11(end-delay+1:end),TestOutput11(49:end)];

[x,xi,ai,t] = preparets(netcbest,X11closed,{},T11closed);
yc11 = netcbest(x,xi,ai);
yc11=yc11';

a=(cell2mat(T11closed))';
b=cell2mat(yc11);
error11 = immse(a(delay+1:end),b);
clear a b 
yo11=yo11';

yoc11=[(TestOutput11(1:delay))';yo11;yc11];

%% Drive Cycle 3
% ---open loop narx---
X19open=TestInput19(1:32);
T19open=TestOutput19(1:32);

[x,xi,ai,t] = preparets(netbest,X19open,{},T19open);
yo19= netbest(x,xi,ai);
%ycopen19=ycopen19';

% ---closed loop narx---
X19closed=[X19open(end-delay+1:end),TestInput19(33:end)];
T19closed=[yo19(end-delay+1:end),TestOutput19(33:end)];

[x,xi,ai,t] = preparets(netcbest,X19closed,{},T19closed);
yc19 = netcbest(x,xi,ai);
yc19=yc19';

a=(cell2mat(T19closed))';
b=cell2mat(yc19);
error19 = immse(a(delay+1:end),b);
clear a b 
yo19=yo19';

yoc19=[(TestOutput19(1:delay))';yo19;yc19];

TestOutput2 = TestOutput2';
TestOutput11 = TestOutput11';
TestOutput19= TestOutput19';

clearvars -except yoc2 yoc11 yoc19 TestOutput2 TestOutput11 TestOutput19 error2 error11 error19 
