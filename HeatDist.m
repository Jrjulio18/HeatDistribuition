dim = input('Enter dimension of the plate ex.[5,6] [Length,Width]: ');
L = dim(1,1);
W = dim(1,2);
coord = input('Enter the point where you want to calculate the Temperature [x, y]: ');
x = coord(1,1);
y = coord(1,2);
temps = input('Enter the Temperatures from Surrounding and Top [TSur,Top]: ');
tSur = temps(1,1);
tTop = temps(1,2);


bool = true;
while(  bool)
    if(x>L || y>W)
    fprintf('Dimension out of bound, enter a point inside the plate ');
    else 
        break;
    end
end
%% start sum 
sum = 0;
for n = 1:10
    if(mod(n,2) == 1)
    s = ((((-1)^(n+1))+1)/n);
    a = sin((n*pi*x)/L);
    b = sinh((n*pi*y)/L);
    c = sinh((W*pi*n)/L);
    theta =((2/pi)* s* a * (a*b/c)); 
    sum = sum + theta;
    end
end

temperature = (sum * tTop)+ tSur;
fprintf('The temperature at point [%5.2f,%5.2f] is %5.2f Celsius ',x,y,temperature);

%% Graph Temperature Distribution in the y  
sum = 0;
temp = 0;
for y = 0:.1:W
    for n = 1:10 
        if(mod(n,2) == 1)
            s = ((((-1)^(n+1))+1)/n);
            a = sin((n*pi*x)/L);
            b = sinh((n*pi*y)/L);
            c = sinh((W*pi*n)/L);
            theta =( s* a * (a*b/c)); 
            sum = sum + theta;
        end
    end
        sum = (2/pi)*sum;
    temp = (sum * tTop)+ tSur;
     plot(y,temp,'x');
     hold on;
     temp = 0;
     sum=0;
end
%
% hold on;
% sum = 0 ;
% temperature = 0;
% 
% q=0;
% k = 50; %thermal resistance
% for i = 1:(size(T)-1)
%     q(1,i) = -k*(T(1,i+1)-T(1,i));
%     
% end