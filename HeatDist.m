dim = input('Enter dimension of the plate ex.[5,6] [Length,Width]: ');
L = dim(1,1);
W = dim(1,2);
coord = input('Enter the point where you want to calculate the Temperature [x, y]: ');
x = coord(1,1);
y = coord(1,2);
temps = input('Enter the Temperatures from Surrounding and Top [TSur,Top]: ');
tSur = temps(1,1);%%Surrounding Temperature
tTop = temps(1,2);%%Top Temperature 



%% start sum 
sum = 0;
for n = 1:10
    if(mod(n,2) == 1)
    s = ((((-1)^(n+1))+1)/n);
    a = sin((n*pi*x)/L);
    b = sinh((n*pi*y)/L);
    c = sinh((W*pi*n)/L);
    theta =(2/pi)*(s*a*(b/c)); 
    sum = sum + theta;
    end
end

temperature = (sum * (tTop-tSur))+ tSur;
fprintf('The temperature at point [%5.2f,%5.2f] is %5.2f Celsius ',x,y,temperature);

%% Graph Temperature Distribution in the y direction 
sum = 0;
temp = 0;
for y = 0:.1:W
    for n = 1:10 
        if(mod(n,2) == 1)
            s = ((((-1)^(n+1))+1)/n);
            a = sin((n*pi*x)/L);
            b = sinh((n*pi*y)/L);
            c = sinh((W*pi*n)/L);
            theta =(2/pi)*(s*a*(b/c)); 
            sum = sum + theta;
        end
    end
    temp = (sum * (tTop-tSur))+ tSur;
    subplot(2,1,1);
    plot(y,temp,'x');
    xlabel('distance mm/m/in');
    ylabel('Temperature C');
    title('Temperature Distribution in the y direction');
    temp = 0 ;
    sum = 0 ;
    pause(.5);
    hold on;
end
%% Graph Temperature Distribution in the X direction 
sum = 0;
temp = 0;
y = coord(1,2);
for x = 0:.1:L
    for n = 1:10 
        if(mod(n,2) == 1)
            s = ((((-1)^(n+1))+1)/n);
            a = sin((n*pi*x)/L);
            b = sinh((n*pi*y)/L);
            c = sinh((W*pi*n)/L);
            theta =(2/pi)*(s*a*(b/c)); 
            sum = sum + theta;
        end
    end
    temp = (sum * (tTop-tSur))+ tSur;
    subplot(2,1,2);
    plot(x,temp,'x');
    xlabel('distance mm/m/in');
    ylabel('Temperature C');
    title('Temperature Distribution in the x direction');
    temp = 0 ;
    sum = 0 ;
    pause(.5);
    hold on;
end
