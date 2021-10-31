clear;
clc;

roboArm.L = [8, 8];
roboArm.offset = [0, 0];

plot(0,0,'b*');
axis([-17 17 -17 17]);
hold on;

ind = 1;

delay = 0.05;
numOfSteps = 30;

path = [getLine(-10,10,-10,5,numOfSteps);
        getCurve(-5,5,5,pi,2*pi,2*numOfSteps);
        getLine(0,5,0,10,numOfSteps);
        getLine(0,10,-2,10,numOfSteps);
        getLine(-2,10,-2,5,numOfSteps);
        getCurve(-5,5,3,0,-pi,2*numOfSteps);
        getLine(-8,5,-8,10,numOfSteps);
        getLine(-8,10,-10,10,numOfSteps);
        ];
    
    path1=[getLine(-10,10,-10,8,numOfSteps);
        getLine(-10,8,-6,8,numOfSteps);
        getLine(-6,8,-6,0,numOfSteps);
        getLine(-6,0,-4,0,numOfSteps);
        getLine(-4,0,-4,8,numOfSteps);
        getLine(-4,8,0,8,numOfSteps);
        getLine(0,8,0,10,numOfSteps);
        getLine(0,10,-10,10,numOfSteps);]

for n = 1:length(path)
    theta = getikine(roboArm, [path(n,1), path(n,2)],'left');
    P = getfkine(roboArm, theta - roboArm.offset);
    locationX(ind) = P(1);
    locationY(ind) = P(2);
    ind = ind + 1;
    hold off;
    plot(locationX,locationY,'r');
    hold on;
    grid on;
    plotRobot(roboArm, theta);
    axis([-17 17 -17 17]);
        
    pause(delay);
    
end
