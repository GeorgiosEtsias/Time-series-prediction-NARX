% ------------------ Georgios Etsias 17th March 2020 ----------------- %
% Script pre-processes experimental data to be used in NARX training
% Pre-processes the data from bus 2 (onl the data sets of drivr cycle 2)
% Input varibles: 3, Output variables: 1, Nmber of times-series: depending
% Final product is a training and a test dataset
% training inputs 4-7, 12-18, 21, 23-25
% Test data set is number 19
clear
clc
load('Bus2Data.mat')
%% catsamples : concatenate all time series into a single training input and output dataset
% Second data set April 2020
c1=num2cell(Input1');
c2=num2cell(Input3');
c3=num2cell(Input4');
c4=num2cell(Input5');
c5=num2cell(Input6');
c6=num2cell(Input7');
c7=num2cell(Input8');
c8=num2cell(Input9');
c9=num2cell(Input10');
c10=num2cell(Input12');
c11=num2cell(Input13');
c12=num2cell(Input14');
c13=num2cell(Input15');
c14=num2cell(Input16');
c15=num2cell(Input17');
c16=num2cell(Input18');
c17=num2cell(Input20');
c18=num2cell(Input21');
c19=num2cell(Input22');
c20=num2cell(Input23');
c21=num2cell(Input24');
c22=num2cell(Input25');

Input = catsamples(c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,...
    c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,'pad');

% Output time-series
% Second data set April 2020
o1=num2cell(Output1');
o2=num2cell(Output3');
o3=num2cell(Output4');
o4=num2cell(Output5');
o5=num2cell(Output6');
o6=num2cell(Output7');
o7=num2cell(Output8');
o8=num2cell(Output9');
o9=num2cell(Output10');
o10=num2cell(Output12');
o11=num2cell(Output13');
o12=num2cell(Output14');
o13=num2cell(Output15');
o14=num2cell(Output16');
o15=num2cell(Output17');
o16=num2cell(Output18');
o17=num2cell(Output20');
o18=num2cell(Output21');
o19=num2cell(Output22');
o20=num2cell(Output23');
o21=num2cell(Output24');
o22=num2cell(Output25');

Output = catsamples(o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,...
    o12,o13,o14,o15,o16,o17,o18,o19,o20,o21,o22,'pad');
%clearvars -except Input Output


% Calculate the size of the longest time-series out of the availiable
% trainining ones
sizets=size(Output);
sizets=sizets(2);

%% Turn multydimensional training input cell aray into into a cell row
for i=1:sizets
TrainingInput(i).train=[cell2mat(Input(1,i));cell2mat(Input(2,i));cell2mat(Input(3,i))];
end
TrainingInput=TrainingInput';
TrainingInput = struct2cell(TrainingInput);

%% create test input and output datasets: 2-11-19 (cell arrays)
% Drive Cycle 1
sizetest=size(Input2);
for i=1:sizetest(1)
TestInput2(i).test=Input2(i,:)';
end
TestInput2=struct2cell(TestInput2');
TestOutput2=num2cell(Output2');
% Drive Cycle 2
sizetest=size(Input11);
for i=1:sizetest(1)
TestInput11(i).test=Input11(i,:)';
end
TestInput11=struct2cell(TestInput11');
TestOutput11=num2cell(Output11');
% Drive Cycle 3
sizetest=size(Input19);
for i=1:sizetest(1)
TestInput19(i).test=Input19(i,:)';
end
TestInput19=struct2cell(TestInput19');
TestOutput19=num2cell(Output19');

%% Define final datasets
TrainingOutput=Output;
clearvars -except TrainingInput TrainingOutput TestInput2 TestOutput2 TestInput11 TestOutput11 TestInput19 TestOutput19
