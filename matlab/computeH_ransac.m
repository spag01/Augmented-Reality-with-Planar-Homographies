function [ bestH2to1, inliers] = computeH_ransac( locs1, locs2)
%COMPUTEH_RANSAC A method to compute the best fitting homography given a
%list of matching points.

%Q2.2.3

total = size(locs1,1);
if total < 4
    num_points = total;
else
    num_points = 4;
end

num_iter = 5000; 
% num_iter = 50000;  
num_inliers = 0;
inliers =[];

for i =1:num_iter

    temp = randperm(total,num_points);
    p1 = zeros(num_points,2);
    p2 = zeros(num_points,2);

    for j = 1:num_points
        p1(j,:) = locs1(temp(j),:); 
        p2(j,:) = locs2(temp(j),:); 
    end
    [H ]= computeH_norm(p1,p2);
    [H ]= transpose(H);
    
   
    x = ones(3,total);
    x(1,:) = locs1(:,1);
    x(2,:) = locs1(:,2);
    x = H*x;
    x = x./x(3,:);
    
    y = ones(3,total);
    y(1,:) = locs2(:,1);
    y(2,:) = locs2(:,2);

    dist = x - y;
    dist = sqrt(dist(1,:).^2 + dist(2,:).^2);
    
    count = 0;
    current_inliers = zeros(1,total);
    for a = 1:total
        if dist(a) < 10
            count = count+1;
            current_inliers(a) = 1; 
        end
    end
    
    if count > num_inliers
        num_inliers = count;
        inliers = current_inliers;
    end
end 

x_final = locs1(inliers==1,:); 
y_final = locs2(inliers==1,:);
bestH2to1 = computeH(x_final,y_final);

end


