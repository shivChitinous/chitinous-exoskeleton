function [validationPredictions, validationAccuracy, validationScores] = LDClassifier(trainingData,k)
    %generated based on Classification Learner App in MATLAB
    
    inputTable = array2table(trainingData, 'VariableNames', {'column_1', 'column_2', 'column_3', 'column_4', 'column_5', 'column_6', 'column_7', 'column_8', 'column_9', 'column_10'});
    %add column names based on the number of parameters in your datset
    
    predictorNames = {'column_1', 'column_2', 'column_3', 'column_4', 'column_5', 'column_6', 'column_7', 'column_8', 'column_9'};
    predictors = inputTable(:, predictorNames);
    response = inputTable.column_10;

    classificationDiscriminant = fitcdiscr(...
    predictors, ...
    response, ...
    'DiscrimType', 'linear', ...
    'Gamma', 0, ...
    'FillCoeffs', 'off', ...
    'ClassNames', [1; 2; 3; 4]);

    % Create the result struct with predict function
    predictorExtractionFcn = @(x) array2table(x, 'VariableNames', predictorNames);
    discriminantPredictFcn = @(x) predict(classificationDiscriminant, x);
    trainedClassifier.predictFcn = @(x) discriminantPredictFcn(predictorExtractionFcn(x));

    % Add additional fields to the resultant struct
    trainedClassifier.ClassificationDiscriminant = classificationDiscriminant;
    
    % Perform cross-validation
    partitionedModel = crossval(trainedClassifier.ClassificationDiscriminant, 'KFold', k);
    %modify k as required

    % Compute validation predictions
    [validationPredictions, validationScores] = kfoldPredict(partitionedModel);

    % Compute validation accuracy
    validationAccuracy = 1 - kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');
end