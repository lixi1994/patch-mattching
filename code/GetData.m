function [Data_Templete,Size_Plane] = GetData(choose,sunset)

if choose == 'Test_1'
    
    B52 = imread('B52.jpg');
    B = imread('B.jpg');
    C250 = imread('C250.jpg');
    F117 = imread('F117.jpg');
    JET = imread('JET.jpg');
    C45 = imread('C45.jpg');
    J12 = imread('J12.jpg');
    C23 = imread('C23.jpg');
    RADAR = imread('RADAR.jpg');
    Sone = imread('Sone.jpg');
    small_one = imread('small_one.jpg');
    small_two = imread('small_two.jpg');
    small_three = imread('small_three.jpg');
    small_four = imread('small_four.jpg');

%% Build Data set
    Data_Templete = cell(12,3);


%% Information Extraction from Template

    Size_Plane = zeros(1,12);

    [B52_Intensity,B52_Edge] = FeatureExtraction(B52,sunset);
    figure
    subplot(1,2,1),imagesc(uint8(B52_Intensity)),title('Intensity Information')
    subplot(1,2,2),imagesc(uint8(B52_Edge)),title('Edge Information')
%     hold on
%     B52_Edge_Corner = corner(B52_Edge);
%     plot(B52_Edge_Corner(:,1), B52_Edge_Corner(:,2), 'r*');
    [num_row,num_col] = size(B52_Intensity);
    Data_Templete(1,1) = cellstr('B52');
    Data_Templete(1,2) = mat2cell(B52_Intensity,num_row,num_col);
    Data_Templete(1,3) = mat2cell(B52_Edge,num_row,num_col);
    Size_Plane(1,1) = num_row*num_col;

    [B_Intensity,B_Edge] = FeatureExtraction(B,sunset);
    % figure
    % subplot(1,2,1),imagesc(uint8(B_Intensity)),title('Intensity Information')
    % subplot(1,2,2),imagesc(uint8(B_Edge)),title('Edge Information')
    [num_row,num_col] = size(B_Intensity);
    Data_Templete(2,1) = cellstr('B');
    Data_Templete(2,2) = mat2cell(B_Intensity,num_row,num_col);
    Data_Templete(2,3) = mat2cell(B_Edge,num_row,num_col);
    Size_Plane(1,2) = num_row*num_col;

    [C250_Intensity,C250_Edge] = FeatureExtraction(C250,sunset);
    % figure
    % subplot(1,2,1),imagesc(uint8(C250_Intensity)),title('Intensity Information')
    % subplot(1,2,2),imagesc(uint8(C250_Edge)),title('Edge Information')
    [num_row,num_col] = size(C250_Intensity);
    Data_Templete(3,1) = cellstr('C250');
    Data_Templete(3,2) = mat2cell(C250_Intensity,num_row,num_col);
    Data_Templete(3,3) = mat2cell(C250_Edge,num_row,num_col);
    Size_Plane(1,3) = num_row*num_col;

    [F117_Intensity,F117_Edge] = FeatureExtraction(F117,sunset);
    % figure
    % subplot(1,2,1),imagesc(uint8(F117_Intensity)),title('Intensity Information')
    % subplot(1,2,2),imagesc(uint8(F117_Edge)),title('Edge Information')
    [num_row,num_col] = size(F117_Intensity);
    Data_Templete(4,1) = cellstr('F117');
    Data_Templete(4,2) = mat2cell(F117_Intensity,num_row,num_col);
    Data_Templete(4,3) = mat2cell(F117_Edge,num_row,num_col);
    Size_Plane(1,4) = num_row*num_col;

    [JET_Intensity,JET_Edge] = FeatureExtraction(JET,sunset);
    % figure
    % subplot(1,2,1),imagesc(uint8(JET_Intensity)),title('Intensity Information')
    % subplot(1,2,2),imagesc(uint8(JET_Edge)),title('Edge Information')
    [num_row,num_col] = size(JET_Intensity);
    Data_Templete(5,1) = cellstr('JET');
    Data_Templete(5,2) = mat2cell(JET_Intensity,num_row,num_col);
    Data_Templete(5,3) = mat2cell(JET_Edge,num_row,num_col);
    Size_Plane(1,5) = num_row*num_col;

    [C45_Intensity,C45_Edge] = FeatureExtraction(C45,sunset);
    % figure
    % subplot(1,2,1),imagesc(uint8(C45_Intensity)),title('Intensity Information')
    % subplot(1,2,2),imagesc(uint8(C45_Edge)),title('Edge Information')
    [num_row,num_col] = size(C45_Intensity);
    Data_Templete(6,1) = cellstr('C45');
    Data_Templete(6,2) = mat2cell(C45_Intensity,num_row,num_col);
    Data_Templete(6,3) = mat2cell(C45_Edge,num_row,num_col);
    Size_Plane(1,6) = num_row*num_col;

    [C23_Intensity,C23_Edge] = FeatureExtraction(C23,sunset);
    % figure
    % subplot(1,2,1),imagesc(uint8(C23_Intensity)),title('Intensity Information')
    % subplot(1,2,2),imagesc(uint8(C23_Edge)),title('Edge Information')
    [num_row,num_col] = size(C23_Intensity);
    Data_Templete(7,1) = cellstr('C23');
    Data_Templete(7,2) = mat2cell(C23_Intensity,num_row,num_col);
    Data_Templete(7,3) = mat2cell(C23_Edge,num_row,num_col);
    Size_Plane(1,7) = num_row*num_col;

    [RADAR_Intensity,RADAR_Edge] = FeatureExtraction(RADAR,sunset);
    % figure
    % subplot(1,2,1),imagesc(uint8(RADAR_Intensity)),title('Intensity Information')
    % subplot(1,2,2),imagesc(uint8(RADAR_Edge)),title('Edge Information')
    [num_row,num_col] = size(RADAR_Intensity);
    Data_Templete(8,1) = cellstr('RADAR');
    Data_Templete(8,2) = mat2cell(RADAR_Intensity,num_row,num_col);
    Data_Templete(8,3) = mat2cell(RADAR_Edge,num_row,num_col);
    Size_Plane(1,8) = num_row*num_col;

    [Sone_Intensity,Sone_Edge] = FeatureExtraction(Sone,sunset);
    % figure
    % subplot(1,2,1),imagesc(uint8(Sone_Intensity)),title('Intensity Information')
    % subplot(1,2,2),imagesc(uint8(Sone_Edge)),title('Edge Information')
    [num_row,num_col] = size(Sone_Intensity);
    Data_Templete(9,1) = cellstr('Sone');
    Data_Templete(9,2) = mat2cell(Sone_Intensity,num_row,num_col);
    Data_Templete(9,3) = mat2cell(Sone_Edge,num_row,num_col);
    Size_Plane(1,9) = num_row*num_col;

    [J12_Intensity,J12_Edge] = FeatureExtraction(J12,sunset);
    % figure
    % subplot(1,2,1),imagesc(uint8(HEL_Intensity)),title('Intensity Information')
    % subplot(1,2,2),imagesc(uint8(HEL_Edge)),title('Edge Information')
    [num_row,num_col] = size(J12_Intensity);
    Data_Templete(10,1) = cellstr('HEL');
    Data_Templete(10,2) = mat2cell(J12_Intensity,num_row,num_col);
    Data_Templete(10,3) = mat2cell(J12_Edge,num_row,num_col);
    Size_Plane(1,10) = num_row*num_col;

    [small_one_Intensity,small_one_Edge] = FeatureExtraction(small_one,sunset);
    [num_row,num_col] = size(small_one_Intensity);
    Data_Templete(11,1) = cellstr('small_one');
    Data_Templete(11,2) = mat2cell(small_one_Intensity,num_row,num_col);
    Data_Templete(11,3) = mat2cell(small_one_Edge,num_row,num_col);
    Size_Plane(1,11) = num_row*num_col;

    [small_two_Intensity,small_two_Edge] = FeatureExtraction(small_two,sunset);
    [num_row,num_col] = size(small_two_Intensity);
    Data_Templete(12,1) = cellstr('small_two');
    Data_Templete(12,2) = mat2cell(small_two_Intensity,num_row,num_col);
    Data_Templete(12,3) = mat2cell(small_two_Edge,num_row,num_col);
    Size_Plane(1,12) = num_row*num_col;

    [small_three_Intensity,small_three_Edge] = FeatureExtraction(small_three,sunset);
    [num_row,num_col] = size(small_three_Intensity);
    Data_Templete(12,1) = cellstr('small_three');
    Data_Templete(12,2) = mat2cell(small_three_Intensity,num_row,num_col);
    Data_Templete(12,3) = mat2cell(small_three_Edge,num_row,num_col);
    Size_Plane(1,12) = num_row*num_col;

    [small_four_Intensity,small_four_Edge] = FeatureExtraction(small_four,sunset);
    [num_row,num_col] = size(small_four_Intensity);
    Data_Templete(12,1) = cellstr('small_four');
    Data_Templete(12,2) = mat2cell(small_four_Intensity,num_row,num_col);
    Data_Templete(12,3) = mat2cell(small_four_Edge,num_row,num_col);
    Size_Plane(1,12) = num_row*num_col;
    clc
elseif choose == 'Test_2'
    
    wbp = imread('wbp.jpg');
    wmp = imread('wmp.jpg');
    wsp = imread('wsp.jpg');
    bsp = imread('bsp.jpg');
    gsp = imread('gsp.jpg');
    lsp = imread('lsp.jpg');
    
    Data_Templete = cell(6,3);
    Size_Plane = zeros(1,6);
    
    [wbp_Intensity,wbp_Edge] = FeatureExtraction(wbp,sunset);
    % figure
    % subplot(1,2,1),imagesc(uint8(B52_Intensity)),title('Intensity Information')
    % subplot(1,2,2),imagesc(uint8(B52_Edge)),title('Edge Information')
    [num_row,num_col] = size(wbp_Intensity);
    Data_Templete(1,1) = cellstr('wbp');
    Data_Templete(1,2) = mat2cell(wbp_Intensity,num_row,num_col);
    Data_Templete(1,3) = mat2cell(wbp_Edge,num_row,num_col);
    Size_Plane(1,1) = num_row*num_col;

    [wmp_Intensity,wmp_Edge] = FeatureExtraction(wmp,sunset);
    % figure
    % subplot(1,2,1),imagesc(uint8(B_Intensity)),title('Intensity Information')
    % subplot(1,2,2),imagesc(uint8(B_Edge)),title('Edge Information')
    [num_row,num_col] = size(wmp_Intensity);
    Data_Templete(2,1) = cellstr('wmp');
    Data_Templete(2,2) = mat2cell(wmp_Intensity,num_row,num_col);
    Data_Templete(2,3) = mat2cell(wmp_Edge,num_row,num_col);
    Size_Plane(1,2) = num_row*num_col;

    [wsp_Intensity,wsp_Edge] = FeatureExtraction(wsp,sunset);
    % figure
    % subplot(1,2,1),imagesc(uint8(C250_Intensity)),title('Intensity Information')
    % subplot(1,2,2),imagesc(uint8(C250_Edge)),title('Edge Information')
    [num_row,num_col] = size(wsp_Intensity);
    Data_Templete(3,1) = cellstr('wsp');
    Data_Templete(3,2) = mat2cell(wsp_Intensity,num_row,num_col);
    Data_Templete(3,3) = mat2cell(wsp_Edge,num_row,num_col);
    Size_Plane(1,3) = num_row*num_col;

    [bsp_Intensity,bsp_Edge] = FeatureExtraction(bsp,sunset);
%     figure
%     imagesc(bsp)
%     figure
%     subplot(1,2,1),imagesc(uint8(bsp_Intensity)),title('Intensity Information')
%     subplot(1,2,2),imagesc(uint8(bsp_Edge)),title('Edge Information')
%     hold on
%     bsp_Edge_Corner = corner(bsp_Edge);
%     plot(bsp_Edge_Corner(:,1), bsp_Edge_Corner(:,2), 'r*');
    [num_row,num_col] = size(bsp_Intensity);
    Data_Templete(4,1) = cellstr('bsp');
    Data_Templete(4,2) = mat2cell(bsp_Intensity,num_row,num_col);
    Data_Templete(4,3) = mat2cell(bsp_Edge,num_row,num_col);
    Size_Plane(1,4) = num_row*num_col;
    
    [gsp_Intensity,gsp_Edge] = FeatureExtraction(gsp,sunset);
    % figure
    % subplot(1,2,1),imagesc(uint8(C250_Intensity)),title('Intensity Information')
    % subplot(1,2,2),imagesc(uint8(C250_Edge)),title('Edge Information')
    [num_row,num_col] = size(gsp_Intensity);
    Data_Templete(5,1) = cellstr('gsp');
    Data_Templete(5,2) = mat2cell(gsp_Intensity,num_row,num_col);
    Data_Templete(5,3) = mat2cell(gsp_Edge,num_row,num_col);
    Size_Plane(1,5) = num_row*num_col;
    
    [lsp_Intensity,lsp_Edge] = FeatureExtraction(lsp,sunset);
    % figure
    % subplot(1,2,1),imagesc(uint8(C250_Intensity)),title('Intensity Information')
    % subplot(1,2,2),imagesc(uint8(C250_Edge)),title('Edge Information')
    [num_row,num_col] = size(lsp_Intensity);
    Data_Templete(6,1) = cellstr('lsp');
    Data_Templete(6,2) = mat2cell(lsp_Intensity,num_row,num_col);
    Data_Templete(6,3) = mat2cell(lsp_Edge,num_row,num_col);
    Size_Plane(1,6) = num_row*num_col;
    clc
end