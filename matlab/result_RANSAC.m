%computeH_ransac 
cv_img = imread('../data/cv_cover.jpg');
cv_desk = imread('../data/cv_desk.png');

[locs1, locs2] = matchPics(cv_img, cv_desk);
[bestH2to1, inliers] = computeH_ransac( locs1, locs2);
bestH2to1 = transpose(bestH2to1);
temp1 = locs1(inliers==1,:); 
temp2 = locs2(inliers==1,:);

range = size(temp1,1);
points = ones(3,range);
points(1,:) = temp1(:,1);
points(2,:) = temp1(:,2);

desk_points = (bestH2to1 * points);
desk_points(1,:) = desk_points(1,:)./desk_points(3,:);
desk_points(2,:) = desk_points(2,:)./desk_points(3,:);

display2 = zeros(range,2);
display2(:,1) = desk_points(1,:); 
display2(:,2) = desk_points(2,:);
display1 = temp1;

figure()
showMatchedFeatures(cv_img, cv_desk, display1, display2, 'montage')


