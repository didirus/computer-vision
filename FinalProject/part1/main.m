% Tushar Nimbhorkar & Diede Rusticus
% Computer Vision '17
% Artificial Intelligence Master
% University of Amsterdam

% Change the vocabulary size and number of iteration as needed
vocab_size = 400; % (800, 1600, 2000 and 4000)
N = 100;
descr_type = 'keypoints'; % 'dense', 'keypoints', 'RGBsift', 'rgbsift', 'Oppsift' 
classes = {'airplanes_train','motorbikes_train','faces_train','cars_train'};  
% 2.1 Feature Extraction and Description
D = feature_extraction(descr_type);

% 2.2: K-means: get cluster means
if exist(strcat('centers_',num2str(vocab_size),'.mat'), 'file') ~= 2
    disp('file doees not exist')
    [centers] = Kmeans_cluster(single(D), vocab_size, N);
    filename = strcat('centers_', num2str(vocab_size));
    save(filename, 'centers');
elseif exist('centers', 'var') ~= 1 && exist(strcat('centers_', num2str(vocab_size),'.mat'),'file') == 2
    load(strcat('centers_', num2str(vocab_size)));
end

% 2.3 & 2.4 & 2.5 Quantization and Classification %%%%%%%
for i=1:length(classes)
    if exist(strcat('model_',char(classes(i)),'_',num2str(vocab_size),'_',descr_type,'.mat'), 'file') ~= 2
        train_svm(classes(i), vocab_size, centers, descr_type)
    elseif exist(strcat('model_', char(classes(i))), 'var') ~= 1 && exist(strcat('model_',char(classes(i)),'_',num2str(vocab_size),'_',descr_type,'.mat'), 'file') == 2
        load(strcat('model_', char(classes(i)),'_', num2str(vocab_size), '_', descr_type));
        if i == 1
            model_airplanes_train = model;
        elseif i == 2
            model_motorbikes_train = model;
        elseif i == 3 
            model_faces_train = model;
        elseif i == 4
            model_cars_train = model;
        end
    end
end

% models = {model_airplanes_train model_motorbikes_train model_faces_train model_cars_train};


% test_data = get_test_data(vocab_size, descr_type, centers);
% filename = strcat('test_data_', num2str(vocab_size), '_', descr_type);
% save(filename, 'test_data');
% load(strcat('test_data_', num2str(vocab_size), '_', descr_type, '.mat'));
% [label,score] = classify(models, test_data);


