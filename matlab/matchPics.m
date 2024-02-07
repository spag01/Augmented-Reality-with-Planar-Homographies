function [ locs1, locs2] = matchPics( I1, I2 )
%MATCHPICS Extract features, obtain their descriptors, and match them!

%% Convert images to grayscale, if necessary
% % if size(I1,3)==3
% %     I1 = rgb2gray(I1);
% % end
% % if size(I2,3)==3
% %     I2 = rgb2gray(I2);
% % end
% 
[rows1, columns1, numberOfColorChannels1] = size(I1);
if numberOfColorChannels1 > 1
    img1 = rgb2gray(I1);
else
    img1 = I1;
end

[rows2, columns2, numberOfColorChannels2] = size(I2);
if numberOfColorChannels2 > 1
    img2 = rgb2gray(I2);
else
    img2 = I2;
end

%% Detect features in both images
feature1 = detectFASTFeatures(img1);
feature2 = detectFASTFeatures(img2);
%% Obtain descriptors for the computed feature locations
[desc1, locs1] = computeBrief(img1,feature1.Location);
[desc2, locs2] = computeBrief(img2,feature2.Location);
%% Match features using the descriptors
match = matchFeatures(desc1, desc2,'MatchThreshold', 10.0, 'MaxRatio', 0.67);

matchPoint1 = locs1(match(:,1),:);
matchPoint2 = locs2(match(:,2),:);

locs1 = locs1(match(:,1),:);
locs2 = locs2(match(:,2),:);


showMatchedFeatures(I1,I2,matchPoint1,matchPoint2,'montage');

end
