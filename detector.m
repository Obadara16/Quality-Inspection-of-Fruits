%% The classifier model is used here on test images to predict what class they belong to.
load net;
[filename, pathname] = uigetfile({'*.*';'*.bmp';'*.jpg';'*.gif'}, 'Pick a Fruit Image File');
img = imread([pathname,filename]);
[labelIdx, score] = predict(categoryClassifier,img);
categoryClassifier.Labels(labelIdx)



%% This concludes the project.