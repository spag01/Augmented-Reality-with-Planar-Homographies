function [ H2to1 ] = computeH( x1, x2 )
%COMPUTEH Computes the homography between two sets of points

total = size(x1,1);
A = zeros(2*total,9);

if any(isnan(x2(:)))
  x2 = zeros(size(x2,1),size(x2,2));
end

for i = 1:total
    p1 = x1(i, :); 

    p2 = x2(i, :); 

%     A(2*i-1, :) = -[p1, p2, 1, 0, 0, 0, -p1*x2(i,1), -x2(i,1)*p2, -x2(i,1)];
%     A(2*i,:) = -[0, 0, 0, p1, p2, 1, -p1*x2(i,2), -x2(i,2)*p2, -x2(i,2)];
    A(2*i-1, :) = [-p1(1) -p1(2) -1 0 0 0 p2(1)*p1(1) p2(1)*p1(2) p2(1)]; 
    A(2*i, :) = [0 0 0 -p1(1) -p1(2) -1 p2(2)*p1(1) p2(2)*p1(2) p2(2)]; 
    
end


if total <= 4
    [U,S,V] = svd(A);
else
    [U,S,V] = svd(A,'econ');
end

H2to1 = reshape(V(:,9),3,3); 
end
