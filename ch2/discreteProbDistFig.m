function discreteProbDistFig

close all;
plotHist(1:4);
plotHist(1);
end

function plotHist(locs)
figure;
sCounts = (1/length(locs))*ones(1, length(locs));
bar(locs, sCounts);
axis([0 5 0 1])
set(gca, 'XTick', 0:5)
set(gca, 'Ytick', 0:0.25:1)
end