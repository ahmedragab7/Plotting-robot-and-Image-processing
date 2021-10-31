%figure('position',[360 500 400 400]);

Slider1 = uicontrol('style','slider','position',[100 280 200 20],...
    'min', 0, 'max', 360);
Slider2 = uicontrol('style','slider','position',[100 350 200 20],...
    'min', 0, 'max', 360);
%movegui( 'center');
roboArm.L = [8, 8];
roboArm.offset = [0, 0];
px=0;
py=0;
while 1

theta = [Slider1.Value Slider2.Value];
%P = getfkine(roboArm, theta - roboArm.offset);


hold off;
[px,py]=plotRobot(roboArm, theta )
text(10,10,num2str(px))
text(10,8,num2str(py))
axis([-17 17 -17 17]);
pause(0.01);
end

