clc;
clear;
close all;

alldata = [];
allLabels = [];
for i = 1:21
    filename = sprintf('s%d.mat', i);
    loadedData = load(filename);

    data = loadedData.data;
    alldata = [alldata; data];
    if i <= 11
        labels = zeros(size(data, 1), 1);  % Safe
    else
        labels = ones(size(data, 1), 1);  % Risky
    end
    allLabels = [allLabels; labels];
end

[trainInd,~,testInd] = dividerand(size(alldata,1), 0.8, 0, 0.2);
trainData = alldata(trainInd,:);
trainData = arrayfun(@(x) x.BirdsEyePlot.UnitsPerPixel(1,1), trainData);
trainLabels = allLabels(trainInd);
testData = alldata(testInd,:);
testData = arrayfun(@(x) x.BirdsEyePlot.UnitsPerPixel(1,1), testData);
testLabels = allLabels(testInd);

SVMModel = fitcsvm(trainData, trainLabels);
[label, score] = predict(SVMModel, testData);

accuracy = sum(label == testLabels) / length(testLabels);
disp(['SVM Accuracy: ', num2str(accuracy)]);

mdl = fitglm(trainData, trainLabels, 'Distribution', 'binomial');

% Make predictions on the test data
predictedProbabilities = predict(mdl, testData);
disp(predictedProbabilities)
%predictedProbabilities = 1 ./ (1 + exp(-predictedProbabilities)); % Apply sigmoid function

threshold = 0.5;
predictedLabels = (predictedProbabilities >= threshold); % Threshold of 0.5

% Evaluate accuracy
accuracy = sum(predictedLabels == testLabels) / length(testLabels);
disp(['Logistic Regression Accuracy: ', num2str(accuracy)]);
