function poissonPlotDemo

lambdas = [0.1 1 10 20];
figure;
for i=1:4
    figure;
    xs=0:25;
    mu = exp(possionLogProb(struct('lambda', lambdas(i)), xs))
    h  = bar(xs, mu)
    title(sprintf('Poi=(%s=%5.3f)', '\lambda', lambdas(i)))
end

end