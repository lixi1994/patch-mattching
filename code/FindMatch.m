function [x,y,width,height,D] = FindMatch(template,destination)
[height,width]=size(template);
[SrcHeight,SrcWidth]=size(destination);

D=zeros(SrcHeight,SrcWidth);
max_value = SelfCorr(template);
y_o = [];
x_o = [];
D = normxcorr2(template,destination);
% figure;
% imshow(D);
for i=1:SrcHeight
   for j= 1:SrcWidth
      if D(i,j)>=0.65*max_value&&D(i,j)<=1.1*max_value
          y_o = [y_o i-height];
          x_o = [x_o j-width];
      end
   end
end


[y_l,x_l]=MakeSelection(y_o,x_o,height,width,D,[1 2]);
[y,x]=MakeSelection(y_l,x_l,height,width,D,[2 1]);


