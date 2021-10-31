clear;
clc;



im=imread('D:\ITI\ele.jpg');
im=rgb2gray(im);
nim=imresize(im,[100,100]);

col=1;
row=1;
counter=0;
imageasmatrix= zeros(100,100);
%f l loop de ana b7awel kol l pixels l 0 or 1
for i=1:10000
    row=row+1;
    if row==101
        col=col+1;
        row=1;
    end
    if nim(10001-i)<=170
        imageasmatrix(col,row)=1;
        counter=counter+1;
    else
        imageasmatrix(col,row)=0;
    end
end

%f l loop d ana b change the image dimention to my robot dimention
endx=1;
my_path=zeros(counter, 2);
for i=1:100
    for j=1:100
        if imageasmatrix(i,j)==1
            my_path(endx,1)=my_mapfunction(i,-10,10,20,100);
            my_path(endx,2)=my_mapfunction(j,-10,10,10,100);
            endx=endx+1;
        end
    end
end



yy=151;
tt=93;
mm=97;
%my_path=sort(my_path,2);
%my_path=sort(my_path,1);
new_path1=zeros(yy, 2);
new_path2=zeros(tt, 2);
new_path3=zeros(mm, 2);
%full_path=zeros(338,2);
y=1;
t=1;
m=1;
for i=1:length(my_path)
    if my_path(i,2)<-1
        new_path1(y,1)=my_path(i,1);
        new_path1(y,2)=my_path(i,2);
      y=y+1;
    elseif (my_path(i,2)>-1 & my_path(i,2)<2)
        new_path3(m,1)=my_path(i,1);
        new_path3(m,2)=my_path(i,2);
        m=m+1;
    else
       new_path2(t,1)=my_path(i,1);
       new_path2(t,2)=my_path(i,2);
       t=t+1;
    end
    end



        
%full_path=[new_path1 new_path2];




roboArm.L = [8, 8];
roboArm.offset = [0, 0];

plot(0,0,'b*');
axis([-17 17 -17 17]);
hold on;

ind = 1;

delay = 0.05;
numOfSteps = 30;
%  my_full_path1=zeros(length(new_path1),7, 2);
% for i=1:length(new_path1)-1
%     my_full_path1(i,:,:)=getLine(new_path1(i,1),new_path1(i,2),new_path1(i+1,1),new_path1(i+1,2),6);
%     
% end




    
%     for i=1:length(new_path1)-1
%        plot([new_path1(i,1),new_path1(i+1,1)],[new_path1(i,2),new_path1(i+1,2)],'r'); 
%        hold on
%        pause(0.04)
%     end
%     
    

for n = 1:length(new_path1)-1
    theta = getikine(roboArm, [new_path1(n,1), new_path1(n,2)],'left');
    P = getfkine(roboArm, theta - roboArm.offset);
    locationX(ind) = P(1);
    locationY(ind) = P(2);
    ind = ind + 1;
    hold off;
    plot( locationX,locationY,'r.','MarkerSize',13);
    
    hold on;
    grid on;
    
    plotRobot(roboArm, theta);
    axis([-17 17 -17 17]);
    pause(delay);
end


    for n = 1:length(new_path3)-1
    theta = getikine(roboArm, [new_path3(mm-n,1), new_path3(mm-n,2)],'left');
    P = getfkine(roboArm, theta - roboArm.offset);
    
    locationX(ind) = P(1);
    locationY(ind) = P(2);
    ind = ind + 1;
   
    
    hold off;
     
    plot( locationX,locationY,'r.','MarkerSize',13);
    
    
    hold on;
    grid on;
    
    plotRobot(roboArm, theta);
    axis([-17 17 -17 17]);
    pause(delay);
    end

   
    for n = 1:length(new_path2)-1
    theta = getikine(roboArm, [new_path2(n,1), new_path2(n,2)],'left');
    P = getfkine(roboArm, theta - roboArm.offset);
    
    locationX(ind) = P(1);
    locationY(ind) = P(2);
    ind = ind + 1;
   
    
    
    hold off;
    
    plot( locationX,locationY,'r.','MarkerSize',13);
    
    hold on;
    grid on;
    
    plotRobot(roboArm, theta);
    axis([-17 17 -17 17]);
    pause(delay);
    end
