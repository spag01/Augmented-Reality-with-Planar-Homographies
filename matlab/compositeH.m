
function [ composite_img ] = compositeH( H2to1, template, img )
%COMPOSITE Create a composite image after warping the template image on top
%of the image using the homography

% Note that the homography we compute is from the image to the template;
% x_template = H2to1*x_photo
% For warping the template to the image, we need to invert it.
H_template_to_img = inv(H2to1);

%% Create mask of same size as template
composite_img = img;

mask = ones(size(template,1),size(template,2),3);

%imshow(H_template_to_img*template)

%% Warp mask by appropriate homography
mask = warpH(mask, H2to1, size(img));

%% Warp template by appropriate homography
template_warph = warpH(template, H2to1, size(img));
size(mask);
size(composite_img);
%% Use mask to combine the warped template and the image
maskSize1 = size(mask,1);
maskSize2 = size(mask, 2);
compSize1 = size(composite_img,1);
compSize2 = size(composite_img,2);
for s1=1:maskSize1
    for s2=1:maskSize2
        if mask(s1,s2) ~= 0   
          composite_img(s1,s2,:) =[255;255;255] ;
        end

    end
end

for c1=1:compSize1
    for c2=1:compSize2
        if composite_img(c1,c2,:) == [255;255;255]    
            composite_img(c1,c2,:) = template_warph(c1,c2,:);
          
        end

    end
end

end
