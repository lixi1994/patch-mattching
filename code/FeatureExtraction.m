function [Intensity,Edge] = FeatureExtraction(Input_Image_delete,sunset)
%% Denoising by deleting the most common information from histogram
Input_Image_delete = DeleteShade(Input_Image_delete,sunset);
% figure
% imshow(Input_Image_delete);
for level = 1:3
Example_delete(:,:,level) = DeleteMain(Input_Image_delete(:,:,level));
[num_r,num_c] = size(Input_Image_delete(:,:,level));
    for check_num = 1:5
        eaxample = reshape(Example_delete(:,:,level),1,num_r*num_c);
        num_nz = length(find(eaxample~=0));
        if num_nz >= 0.65*num_r*num_c
            Example_delete(:,:,level) = DeleteMain(Example_delete(:,:,level));
        end
    end
end

% figure
% subplot(2,2,1),imagesc(Input_Image),title('Original Input Example');
% subplot(2,2,2),imagesc(Example_delete(:,:,1)),title('Red Channel after Denosing');
% subplot(2,2,3),imagesc(Example_delete(:,:,2)),title('Green Channel after Denosing');
% subplot(2,2,4),imagesc(Example_delete(:,:,3)),title('Blue Channel after Denosing');

%% Intensity Information Extraction
R_num = length(find(Example_delete(:,:,1)~=0));
G_num = length(find(Example_delete(:,:,2)~=0));
B_num = length(find(Example_delete(:,:,3)~=0));
Total_num = R_num + G_num + B_num;
R_coe = (Total_num - R_num)/(2*Total_num);
G_coe = (Total_num - G_num)/(2*Total_num);
B_coe = (Total_num - B_num)/(2*Total_num);
Image = R_coe*Example_delete(:,:,3) + G_coe*Example_delete(:,:,3) + B_coe*Example_delete(:,:,3);

% figure
% subplot(1,2,1),imagesc(Input_Image_delete),title('Original Input Image after Deleting Shades');
% subplot(1,2,2),imagesc(Image),title('Combined 3 Channels into 1');

Image = double(Image);
[a,b] = size(Image);
tao_im_record = reshape(Image,1,a*b);
tao_im_record = sort(tao_im_record,'descend');
len_im = length(find(tao_im_record~=0));
tao_im = tao_im_record(1,floor(0.6*len_im));
Image_threshold = zeros(a,b);
for i = 1:a
    for j = 1:b
        if Image(i,j) <= tao_im
            Image_threshold(i,j) = 0;
        else
            Image_threshold(i,j) = 1;
        end
    end
end

Intensity = zeros(a,b,1);

Intensity=uint8(Image_threshold);

% figure
% subplot(1,2,1),imagesc(Image),title('Original Input for IIE');
% subplot(1,2,2),imagesc(uint8(Intensity)),title('Intensity Information Extraction')

%% Edge Information Detection
Sobel = fspecial('sobel');
I_1 = imfilter(Image,Sobel,'replicate');
I_2 = imfilter(Image,Sobel','replicate');
Mag = sqrt(I_1.^2 + I_2.^2);
Phase = phasecong3(Image);
Combined = Phase.*Mag;
[a,b] = size(Combined);
tao_ed_record = reshape(Combined,1,a*b);
tao_ed_record = sort(tao_ed_record,'descend');
len_ed = length(find(tao_ed_record~=0));
tao_ed = tao_ed_record(1,floor(0.3*len_ed));
Combined_threshold = zeros(a,b);
for i = 1:a
    for j = 1:b
        if Combined(i,j) <= tao_ed
            Combined_threshold(i,j) = 0;
        else
            Combined_threshold(i,j) = 1;
        end
    end
end

Edge = Combined_threshold;

% figure,
% subplot(2,2,1),imagesc(Image),title('Original Input for ED');
% subplot(2,2,2),imagesc(Mag),title('Magnitude');
% subplot(2,2,3),imagesc(Phase),title('Phase');
% subplot(2,2,4),imagesc(Edge),title('Combined Result');

