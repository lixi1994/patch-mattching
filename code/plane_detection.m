clear all
close all
clc

%% Set Sun

sunset = [0;1]; % [0:1] for Test_one(dma);[1;0]for Test_two(vcv)

%% Load Data into Data_Template

[Data_Templete,Size_Plane] = GetData('Test_1',sunset); % you can change the 'Test_1' or 'Test_2'

%% Information Extraction from Destination

Data_Test = GetDestination('Test_e',sunset);% you can change the 'Test_1' or 'Test_2' and  
                                            %'Test_e' is for the example
%% Image Matching

[count,x,y,width,height] = Plane_selection(Data_Templete,Data_Test,'all',Size_Plane);
                                            % you can exchange 'all' to 
                                            % [1 12] for the 'Test_1'
                                            % [1 6] for the 'Test_2' to
                                            % check only one plane template
                                            
                                            
count % show the number of plane detected