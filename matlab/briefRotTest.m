% Your solution to Q2.1.5 goes here!

%% Read the image and convert to grayscale, if necessary

cv_img = '../data/cv_cover.jpg';
cv_cover = imread(cv_img);
[rows, columns, numberOfColorChannels] = size(cv_cover);

if numberOfColorChannels > 1
    grayscale_cover = rgb2gray(cv_cover);
else
    grayscale_cover = cv_cover;
end
%% Compute the features and descriptors 

% %%Using Brief
% feature1 = detectFASTFeatures(grayscale_cover);
% [desc1, locs1] = computeBrief(grayscale_cover, feature1.Location);
% hist = [];
% figure_handle = figure();
% for i = 0:36
%     %% Rotate image
%     rotation = imrotate(grayscale_cover, (i+1)*10);
%     
%     %% Compute features and descriptors
%     feature2 = detectFASTFeatures(rotation);
%     [desc2, locs2] = computeBrief(rotation, feature2.Location);
%     
%     %% Match features
%     match = matchFeatures(desc1, desc2,'MatchThreshold', 10.0, 'MaxRatio', 0.69);
%     match_feature1 = locs1(match(:,1),:);
%     match_feature2 = locs2(match(:,2),:);
%     figure(figure_handle);
%     showMatchedFeatures(grayscale_cover,rotation,match_feature1,match_feature2,'montage');
%     saveas(figure_handle, fullfile('../4.2/', sprintf('brief_rotations_%d.jpg',(i+1)*10)));
% 
%    
%     total_matches = length(match(:,1));
%     %% Update histogram
%     hist = [hist, total_matches];
% end
% %% Display histogram
% bar(hist)


% % using detectSURFFeatures and extractFeatures
feature1 = detectSURFFeatures(grayscale_cover);
[f1, extract_feature1] = extractFeatures(grayscale_cover, feature1, 'Method', 'SURF');
figure_handle = figure();
hist = [];
for i = 0:36
%% Rotate image
    rotation = imrotate(grayscale_cover, (i+1)*10);
    
    %% Compute features and descriptors
    feature2 = detectSURFFeatures(rotation);
    [f2,extract_feature2] = extractFeatures(rotation, feature2, 'Method', 'SURF');
    %% Match features
    match = matchFeatures(f1, f2,'MatchThreshold', 10.0, 'MaxRatio', 0.63);
    match_feature1 = extract_feature1(match(:,1),:);
    match_feature2 = extract_feature2(match(:,2),:);
    showMatchedFeatures(grayscale_cover,rotation,match_feature1,match_feature2,'montage');
    saveas(figure_handle, fullfile('../surff/', sprintf('surff_rotations_%d.jpg',(i+1)*10)));

    total_matches = length( match(:,1));

    %% Update histogram
    hist = [hist, total_matches];
end

bar(hist)
%       