function [ path ] = getCurve( xc, yc, radius, startAngle, endAngle, numOfPoints )
    
    path = zeros(numOfPoints+1, 2);
    for n = 1:numOfPoints+1
        path(n, 1) = xc+radius*cos(startAngle+(n-1)*(endAngle - startAngle)/numOfPoints);
        path(n, 2) = yc+radius*sin(startAngle+(n-1)*(endAngle - startAngle)/numOfPoints);
    end
    
end

