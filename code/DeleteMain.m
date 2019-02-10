function Example_delete = DeleteMain(Input_Image)
    I = Input_Image;

    [counts,deviations] = imhist(I);
    counts(1:10,:) = 0;
%     figure;
%     plot(deviations,counts);
    fitting_x = polyfit(deviations,counts,20);
    fitting_y = polyval(fitting_x,deviations,1);
%     figure
%     plot(deviations,fitting_y);
    [pks_high,locs_high] = findpeaks(fitting_y,deviations);
    [pks_low,locs_low] = findpeaks(-fitting_y,deviations);
    [~,loc] = max(pks_high);
    [a,~] = size(locs_low);
    Record_left = zeros(1,a);
    Record_right = zeros(1,a);
    for i = 1:a
        if (locs_high(loc) - locs_low(i)>=0)
            Record_left(1,i) = locs_high(loc) - locs_low(i);
        else
            Record_left(1,i) = 255;
        end
        if (locs_high(loc) - locs_low(i)<=0)
            Record_right(1,i) = locs_high(loc) - locs_low(i);
        else
            Record_right(1,i) = -255;
        end
    end
    [~,loc_left] = min(Record_left);
    [~,loc_right] = max(Record_right);
    [width,height]=size(I);
    T1 = locs_low(loc_left);
    T2 = locs_low(loc_right);
    for i=1:width
        for j=1:height
            if(I(i,j)>T1 && I(i,j)<T2)
                I(i,j)=0;
            else 
                I(i,j)=I(i,j);
            end
        end
    end
Example_delete = I;