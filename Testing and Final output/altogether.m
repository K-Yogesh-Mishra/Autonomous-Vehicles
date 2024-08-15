clc;
clear
close all
% Initialize empty arrays for features and labels
allObjectDetections = [];
allLaneDetections = [];
% ... Repeat for other fields (e.g., PointClouds, INSMeasurements)
allLabels = [];

% Load data from all 21 scenarios
for i = 1:21
    filename = sprintf('s%d.mat', i);
    loadedData = load(filename);

    % Extract relevant fields
    objectData = loadedData.ObjectDetections;
    laneData = loadedData.LaneDetections;
    % ... Repeat for other fields

    % Combine data from each scenario
    allObjectDetections = [allObjectDetections; objectData];
    allLaneDetections = [allLaneDetections; laneData];
    % ... Repeat for other fields

    % Assign labels (safe: 1, risky: 2)
    if i <= 11
        labels = ones(size(objectData, 1), 1);  % Safe
    else
        labels = 2 * ones(size(objectData, 1), 1);  % Risky
    end

    % Combine labels
    allLabels = [allLabels; labels];
end

% Now 'allObjectDetections', 'allLaneDetections', and 'allLabels' contain the combined data
% Proceed with training your model using the labeled dataset
% ...
