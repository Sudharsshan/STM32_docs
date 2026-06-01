%% Load model
% export .mat model to ONNX format
input = load('trainedYOLOv2Detector.mat');
net = input.detector.Network;
%% Analyze network
analyzeNetwork(net);

%% Export
filename = "Model.onnx";
exportONNXNetwork(net, filename);