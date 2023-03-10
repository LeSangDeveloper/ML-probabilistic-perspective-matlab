if 1
   loadData('XwindowsDocData');
   Xtrain = xtrain; Xtest = xtest;
else
    loadData('20news_w100');
    X = shuffleRows(documents');
    Xtrain = X(1:60, :);
    Xtest = X(61:end,:);
end

model = naiveBayesFit(Xtrain, ytrain);
y_pred_train = naiveBayesPredict(model, Xtrain);
err_train = mean(zeroOneLossFn(ytrain, y_pred_train));
y_pred_test = naiveBayesPredict(model, Xtest);
err_test = mean(zeroOneLossFn(ytest, y_pred_test));

%% Visualize class conditional densities

C = length(unique(ytrain(:)));
for c=1:C
    figure;
    bar(model.theta(c,:));
    title(sprintf('p(xj=1|y=%d)',c))
end

% We construct a latex table with the  top N words
N = 5;
for c=1:C
    [sortedProb, ndx] = sort(model.theta(c,:), 'descend');
    fprintf('top %d words for class %d\n', N, c);
    for w=1:N
        fprintf(2,'%2d %6.4f %20s\n', w,  sortedProb(w), vocab{ndx(w)});
        Mp(w,c) = sortedProb(w);
        Mw{w,c} = vocab{ndx(w)};
    end
    fprintf('\n\n');
end

%% Compute mutual information between words and class labels
[mi] = mutualInfoClassFeaturesBinary(Xtrain,ytrain);
[sortedMI, ndx] = sort(mi, 'descend');
fprintf('top %d words sorted by MI\n', N);
for w=1:N
    fprintf(2,'%2d %6.4f %20s\n', w,  sortedMI(w), vocab{ndx(w)});
    Mi(w) = sortedMI(w);
    Miw{w} = vocab{ndx(w)};
end
fprintf('\n\n');

%% Make latex table
for i=1:N
    M{i,1} = Mw{i,1}; M{i,2} = Mp(i,1);
    M{i,3} = Mw{i,2}; M{i,4} = Mp(i,2);
    M{i,5} = Miw{i}; M{i,6} = Mi(i);
end

MM = [Mw(:, 1), mat2cellRows(Mp(:, 1)), ...
    Mw(:,2),  mat2cellRows(Mp(:, 2)), ...
    Miw(:),  mat2cellRows(Mi(:))];
assert(isequal(M, MM))

colLabels = {'class 1', 'prob', 'class 2', 'prob', 'highest MI', 'MI'};
latextable(M, 'horiz', colLabels, 'Hline',[1], 'format', '%5.3f');