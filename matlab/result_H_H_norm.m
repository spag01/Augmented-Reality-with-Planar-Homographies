
cv_img = imread('../data/cv_cover.jpg');
cv_desk = imread('../data/cv_desk.png');

[locs1, locs2] = matchPics(cv_img, cv_desk);

% Randomly select 10 points from cv_img
random_points = zeros(10,2);
[dim1,dim2] = size(cv_img);
for i=1:10
    rand1 = randi(dim1);
    rand2 = randi(dim2);
    random_points(i,1) = rand1;
    random_points(i,2) = rand2;
end

% Display randomly selected points in cv_img
cover_points_img = insertMarker(cv_img,random_points,'size',10);
imshow(cover_points_img)

% Compute homography matrix
% H = transpose(computeH(locs1, locs2));
H = transpose(computeH_norm(locs1, locs2));

% Transform randomly selected points to cv_desk
points = ones(3,10);
points(1,:) = random_points(:,1);
points(2,:) = random_points(:,2);
desk_points = (H * points);
desk_points(1,:) = desk_points(1,:)./desk_points(3,:);
desk_points(2,:) =desk_points(2,:)./desk_points(3,:);

% Display matched feature points in cv_img and cv_desk
display2 = zeros(10,2);
display2(:,1) = desk_points(1,:); 
display2(:,2) = desk_points(2,:);
display1 = random_points;
figure()
showMatchedFeatures(cv_img, cv_desk, display1, display2, 'montage')
