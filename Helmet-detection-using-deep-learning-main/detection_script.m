%% Initialize
clear; close all; clc; rng('default');
load gTruth  % Ground truth
load('trainedYOLOv2Detector');  % YOLOv2 model

% Setup video and display
videoFReader = vision.VideoFileReader(gTruth.DataSource.Source);
%videoFReader = vision.VideoFileReader('input3.mp4');
videoPlayer = vision.DeployableVideoPlayer;

% Setup color map
cmaps(1,:) = [0 255 255];  % just for visualization
cmaps(2,:) = [255 0 0];

% Set the number of frames you want to process
MAX_FRAMES = 1100;  % Adjust as needed
helmet_detected = zeros(1, MAX_FRAMES, 'int8');  % Store results as 0/1 integers

frame_count = 1;
labelpre = categorical("Helmet");

while ~isDone(videoFReader) && frame_count <= MAX_FRAMES
    I = videoFReader();  % Read frame
    [bboxes, scores, labels] = detect(detector, I);  % Detect objects
    
    % Save detection result
    if any(labels == "Helmet")
        helmet_detected(frame_count) = 1;
    else
        helmet_detected(frame_count) = 0;
    end
    
    % OPTIONAL: Annotate and play video
    if isempty(labels)  
        detectedImg = I;
    elseif ~(labelpre == labels(1))
        detectedImg = I;
        labelpre = labels(1); 
    else
        detectedImg = insertObjectAnnotation(I, 'Rectangle', bboxes(1,:), cellstr(labels(1)),...
            'Color', im2single(cmaps(1,:)), 'FontSize', 20, 'TextBoxOpacity', 1);
        labelpre = labels(1); 
    end
    videoPlayer(detectedImg);

    frame_count = frame_count + 1;
end

% Save result for Simulink
save('helmet_detection_output.mat', 'helmet_detected');
save('helmet_detected.mat', 'helmet_detected');
disp('Loading variable into Workspace');
loadHelmetSignal
disp('Now run your simulink model...')

function loadHelmetSignal()
    % Load the MAT file
    data = load('helmet_detected.mat');

    % Check if the variable exists
    if isfield(data, 'helmet_detected')
        helmetData = double(data.helmet_detected(:));  % Convert to column vector

        % Define the time vector - assuming 1 Hz sampling rate (change if needed)
        timeVector = (0:length(helmetData)-1)';  % Column vector from 0 to N-1 seconds

        % Create timeseries object
        helmet_ts = timeseries(helmetData, timeVector);
        helmet_ts.Name = 'helmet_ts';

        % Optional: assign to base workspace so Simulink can use it
        assignin('base', 'helmet_ts', helmet_ts);

        disp('✅ Helmet data successfully loaded into workspace as "helmet_ts"');
    else
        error('❌ Variable "helmet_detected" not found in the MAT file.');
    end
end

