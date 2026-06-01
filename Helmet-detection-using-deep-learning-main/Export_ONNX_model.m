%% 1. Define Your Fixed Input Size
% IMPORTANT: The STM32Cube.AI tool needs a fixed, known input size.
% YOLO models are often trained on square inputs like 224x224 or 416x416.
% Use the size your model was trained on. If you don't know, [224 224 3] is a
% common and good size to start with for many object detection models.
inputSize = [224 224 3]; % [Height, Width, Channels]

%% 2. Load Your Original Network
disp('Loading original trained network...');
input = load('trainedYOLOv2Detector.mat');
net = input.detector.Network;

%% 3. Get the Editable Layer Graph
% We need to convert the network into a 'layer graph' so we can modify it.
lgraph = layerGraph(net);
disp('Original network input layer:');
disp(lgraph.Layers(1));

%% 4. Create a New Fixed-Size Input Layer
disp('Creating new fixed-size input layer...');
newInputLayer = imageInputLayer(inputSize, 'Name', 'input_1', 'Normalization', 'none');
disp('New network input layer:');
disp(newInputLayer);

%% 5. Replace the Old Input Layer with the New One
disp('Replacing input layer in the graph...');
% Remove the original input layer (which is the first layer)
lgraph = removeLayers(lgraph, lgraph.InputNames{1});
% Add our new fixed-size input layer
lgraph = addLayers(lgraph, newInputLayer);
% Reconnect our new input layer to the rest of the network.
% We find the name of the layer that the original input was connected to.
nextLayerName = net.Layers(2).Name;
lgraph = connectLayers(lgraph, newInputLayer.Name, nextLayerName);

%% 6. Analyze and Export the New, Fixed-Size Network
disp('Analyzing new network...');
analyzeNetwork(lgraph);

filename = "Model_FixedSize.onnx";
disp(['Exporting new network to: ' filename]);
exportONNXNetwork(lgraph, filename);

disp('Export complete!');