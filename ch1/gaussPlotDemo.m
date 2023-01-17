xs = -3:0.01:3;
mu = 0; sigma2 = 1;
p = gaussProb(xs', mu, sigma2);
figure;
plot(xs, p, 'LineWidth', 2.5);
title('Gaussian pdf');

figure;
plot(xs, cumsum(p), 'LineWidth', 2.5);
title('Gaussian cdf');