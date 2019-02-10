function [template,src] = combinedinformation(Data_Templete,Data_Test,i,j)
src_1 = cell2mat(Data_Test(j,2));
src_1 = double(src_1);
src_2 = cell2mat(Data_Test(j,3));
src_2 = double(src_2);
s_1 = sum(sum(src_1));
s_2 = sum(sum(src_2));
s_1_co = (s_2)\((s_1)+(s_2));
s_2_co = 3*(s_1)\((s_1)+(s_2));
src = s_1_co*src_1+s_2_co*src_2;
template_1 = cell2mat(Data_Templete(i,2));
template_1 = double(template_1);
template_2 = cell2mat(Data_Templete(i,3));
template_2 = double(template_2);
temp_1 = sum(sum(template_1));
temp_2 = sum(sum(template_2));
temp_1_co = (temp_2)\((temp_1)+(temp_2));
temp_2_co = 3*(temp_1)\((temp_1)+(temp_2));
template =temp_1_co*template_1+temp_2_co*template_2;

% figure
% imshow(template)
