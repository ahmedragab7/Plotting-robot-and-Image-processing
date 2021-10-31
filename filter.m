
grayImage = rgb2gray(imread('D:\trika.jpg'));
subplot(1, 2, 1);
imshow(grayImage, []);
edgeDetector = [1 1 1; 0 0 0; -1 -1 -1]; 
filteredImage = conv2(double(grayImage), edgeDetector, 'same');
subplot(1, 2, 2);
filteredImage=filteredImage/255;

[row col]=size(filteredImage);
for i=1:row
    for j=1:col
    if filteredImage(i,j)>=-0.063
        filteredImage(i,j)=1;
        
    else
        filteredImage(i,j)=0;
    end
    
    
    end
end
imshow(filteredImage, []);
imsave()

