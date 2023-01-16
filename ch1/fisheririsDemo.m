[X,y,classnames,varnames] = fisheririsLoad;
% classnames = setoas, versicolor, virginca

figure();
%pscatter(X,'y', y);
%suptitle(sprintf('iris data, red=setosa, green=versicolor, blue=virginica'));
% We choose colors to match pcaIris.R:
% versicolor = 1 black, virginica = 2 red, setosa = 3 green
plotSymbol = containers.Map({'versicolor', 'virginica', 'setosa'}, {'ko', 'rd', 'g*'});
plotSymbols2 = {};
for c=1:length(classnames)
    plotSymbols2{c} = plotSymbol(classnames{c});
end
pscatter(X, 'y', y, 'plotsymbol', plotSymbols2, ...
    'vnames', {'sepal length', 'sepal width', 'petal length', 'petal width'});