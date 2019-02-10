function Image = DeleteShade(I,sunset)
a = sunset(1);
b = sunset(2);
[count_r,position_r] = imhist(I(:,:,1));
[count_b,position_b] = imhist(I(:,:,2));
[count_g,position_g] = imhist(I(:,:,3));

sort_r = sortrows([count_r position_r],[1 2]);
sort_b = sortrows([count_b position_b],[1 2]);
sort_g = sortrows([count_g position_g],[1 2]);

r_max = sort_r(256,2);
b_max = sort_b(256,2);
g_max = sort_g(256,2);

[row,col] = size(I(:,:,1));
for i = 3:row-2
    for j = 3:col-2
        if I(i,j,1)<=80&&I(i,j,2)<=80&&I(i,j,3)<=80
           I(i,j,1) = 0.55*I(i-a,j-b,1)+0.3*I(i-2*a,j-2*b,1)+0.15*(r_max-I(i,j,1));
           I(i,j,2) = 0.55*I(i-a,j-b,2)+0.3*I(i-2*a,j-2*b,2)+0.15*(b_max-I(i,j,2));
           I(i,j,3) = 0.55*I(i-a,j-b,3)+0.3*I(i-2*a,j-2*b,3)+0.15*(g_max-I(i,j,3));
        end
    end
end
Image = I;