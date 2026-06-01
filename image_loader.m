% image_brightness_detector.m

% Load image file
imgFile = 'test_image.png';

% Initialize result
detection_result = -1;  % default/error value

% Check if image exists
if exist(imgFile, 'file')
    img = imread(imgFile);

    % Convert to grayscale if RGB
    if size(img,3) == 3
        img_gray = rgb2gray(img);
    else
        img_gray = img;
    end

    % Normalize grayscale to [0,1]
    img_gray = double(img_gray) / 255;

    % Calculate mean brightness
    mean_brightness = mean(img_gray(:));

    % Classify brightness
    if mean_brightness < 0.5
        detection_result = 0;  % Mostly black
    else
        detection_result = 1;  % Mostly white
    end
else
    warning('Image file "%s" not found.', imgFile);
    detection_result = -1;  % Error state
end

% Display result
fprintf('Detection Result: %d\n', detection_result);
