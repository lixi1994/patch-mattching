function [y,x]=MakeSelection(y_o,x_o,height,width,D,num)
len = length(x_o);
if len ~=0
    Com = [y_o;x_o];
    Com = sortrows(Com',num);
    y_o = Com(:,1)';
    x_o = Com(:,2)';
end

y_test = [1 y_o];
x_test = [1 x_o];

x = [];
y = [];
count = 0;
D(1,1) = 0;

for i = 1:len
    if abs(y_o(i)-y_test(i))<=0.55*height&&abs(x_o(i)-x_test(i))<=0.55*width
        if D(y_o(i)+ height,x_o(i)+width)>= D(y(count)+ height,x(count)+width)
            y(count) = y_o(i);
            x(count) = x_o(i);
        end  
    else
           y = [y y_o(i)];
           x = [x x_o(i)];
           count = count +1;
    end
end
