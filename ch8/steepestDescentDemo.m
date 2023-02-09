fn = @(x) aokiFn(x);
[x1 x2] = meshgrid(0:0.1:2, -0.5:0.1:3);
Z = fn([x1(:), x2(:)]);
Z = reshape(Z, size(x1));

stepSizes = { [], 0.1, 0.6};
for m=1:length(stepSizes)
    x0 = [0; 0];
    global xhist fhist
    xhist = []; fhist = [];
    stepsize = stepSizes{m};
    x = steepestDescent(fn, x0, 'maxIter', 15, ...
        'stepSize', stepsize, 'outputFn', @optimstore);
    figure;
    contour(x1,x2,Z,50);
    hold on
    h=plot(1, 1, 'ro'); set(h, 'markersize', 10, 'markerfacecolor', 'r');
    plot(xhist(1,:), xhist(2,:), 'ro-');
    if isempty(stepsize)
        ttl = sprintf('exact line search');
        title(ttl);
    else
        ttl = sprintf('step size %2.1f', stepsize);
        title(ttl);
    end

    figure; plot(fhist); title(ttl);
end