function Data_Test = GetDestination(choose,sunset)
    Data_Test = cell(1,4);
    
if choose == 'Test_e'
    Example = imread('example1.jpg');
    [Example_Intensity,Example_Edge] = FeatureExtraction(Example,sunset);
    % figure
    % subplot(1,2,1),imagesc(uint8(Example_Intensity)),title('Intensity Information')
    % subplot(1,2,2),imagesc(uint8(Example_Edge)),title('Edge Information')
    [num_row,num_col] = size(Example_Intensity);
    Data_Test(1,1) = cellstr('Example');
    Data_Test(1,2) = mat2cell(Example_Intensity,num_row,num_col);
    Data_Test(1,3) = mat2cell(Example_Edge,num_row,num_col);
    Data_Test(1,4) = mat2cell(Example,num_row,num_col,3);
    clc

elseif choose == 'Test_1'
    Test_1 = imread('dma.jpg');
    [Test_1_Intensity,Test_1_Edge] = FeatureExtraction(Test_1,sunset);
    figure
    subplot(1,2,1),imagesc(uint8(Test_1_Intensity)),title('Intensity Information')
    subplot(1,2,2),imagesc(uint8(Test_1_Edge)),title('Edge Information')
    [num_row,num_col] = size(Test_1_Intensity);
    Data_Test(1,1) = cellstr('Test_1');
    Data_Test(1,2) = mat2cell(Test_1_Intensity,num_row,num_col);
    Data_Test(1,3) = mat2cell(Test_1_Edge,num_row,num_col);
    Data_Test(1,4) = mat2cell(Test_1,num_row,num_col,3);
    clc

elseif choose == 'Test_2'
    Test_2 = imread('vcv.jpg');
    [Test_2_Intensity,Test_2_Edge] = FeatureExtraction(Test_2,sunset);
    figure
    subplot(1,2,1),imagesc(uint8(Test_2_Intensity)),title('Intensity Information')
    subplot(1,2,2),imagesc(uint8(Test_2_Edge)),title('Edge Information')
    [num_row,num_col] = size(Test_2_Intensity);
    Data_Test(1,1) = cellstr('Test_2');
    Data_Test(1,2) = mat2cell(Test_2_Intensity,num_row,num_col);
    Data_Test(1,3) = mat2cell(Test_2_Edge,num_row,num_col);
    Data_Test(1,4) = mat2cell(Test_2,num_row,num_col,3);
    clc
else
end