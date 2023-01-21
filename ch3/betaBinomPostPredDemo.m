N = 10;
N1 = 3;
N0 = 17;
xs = 0:N;

prior.N = N;
prior.a = 2;
prior.b = 2;
priorPred = exp(betaBinomLogprob(prior, xs));
figure;
bar(priorPred);
set(gca,'xticklabel', xs);
title('prior predictive');


post.a = prior.a + N1; 
post.b = prior.b + N0;
post.N = N;
postPred = exp(betaBinomLogprob(post, xs));
figure; 
bar(postPred);
set(gca,'xticklabel', xs);
title('posterior predictive');

%% MAP estimate (Plugin)
plugin.mu  = (prior.a+N1-1)/(prior.a+N1+prior.b+N0-2);
plugin.N   = N;
pluginPred = exp(binomialLogprob(plugin, xs));
figure; 
bar(pluginPred);
set(gca,'xticklabel', xs);
title('plugin predictive');