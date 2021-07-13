%% This is where the model is trained
outputFolder = fullfile('C:\Users\OBA\Desktop\Quality Inspection of Fruit Surface Defect Using Image Processing\detect');
rootFolder = fullfile(outputFolder, 'train');
categories = {'Bad_Fruit', 'Good_Fruit'};
imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');
tbl = countEachLabel(imds);
[trainingSet,testSet] = splitEachLabel(imds,0.7,'randomize');
bag = bagOfFeatures(trainingSet);
categoryClassifier = trainImageCategoryClassifier(trainingSet,bag);
confMatrix = evaluate(categoryClassifier,testSet);
mean(diag(confMatrix));
save net;
%% The model trained here is saved and exported to detector.m program 
