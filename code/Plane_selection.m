function [count,x,y,width,height] = Plane_selection(Data_Templete,Data_Test,Templete_num,Size_Plane)
figure
Back = cell2mat(Data_Test(1,4));
imshow(Back); hold on;
[L,~] = sort(Size_Plane,'descend');
[num,~] = size(Data_Templete);
Order_num = zeros(1,num);
for i = 1:num
    Order_num(find(L==Size_Plane(i)))=i;
end
count = 0;
for i = 1:num
    [template,destination] = combinedinformation(Data_Templete,Data_Test,Order_num(i),1);
    x_temp = [];
    y_temp = [];
    for r = 0:15:(360-15)
        template_r = imrotate(template,r,'bilinear','crop');
        [x_out,y_out,width,height,D] = FindMatch(template_r,destination);
        len = length(x_out);
        for j = 1:len
            destination(y_out(j):y_out(j)+height-1,x_out(j):x_out(j)+width-1)= destination(y_out(j):y_out(j)+height-1,x_out(j):x_out(j)+width-1) - 2*template_r;
        end
        x_temp = [x_temp x_out];
        y_temp = [y_temp y_out];
    end
    [y_l,x_l]=MakeSelection(y_temp,x_temp,height,width,D,[1 2]);
    [y,x]=MakeSelection(y_l,x_l,height,width,D,[2 1]);
        if Templete_num == 'all'
        len = length(x);
            for j = 1:len
                plot(x(j)+0.5*width,y(j)+0.5*height,'r*');
                count = count +1;
                text(x(j)+0.6*width,y(j)+0.6*height,num2str(count),'color','r');
%                 rectangle('position',[x(j) y(j) width height], 'edgecolor','r','linewidth',0.5); 
                hold on;
            end
        elseif Order_num(i) == Templete_num
            len = length(x);
                for j = 1:len
                    cc = 0;
                    plot(y(j)+0.5*height,x(j)+0.5*width,'r*');
                    insertText(Back,[x(j)+width y(j)+height],count);
                    text(x(j)+0.6*width,y(j)+0.6*height,num2str(cc),'color','r');
%                    rectangle('position',[x(j) y(j) width height], 'edgecolor','r','linewidth',0.5); 
                    cc = cc+1;
                    hold on;
                end
                count = cc;
        end
end
    title('Plane Detection')
    hold off;
