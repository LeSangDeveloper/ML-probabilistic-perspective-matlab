T = [100 5 1];
eta = [3 0 1];
figure();
nr=1;
nc=numel(T);
for i=1:numel(T)
    figure;
    bar(softmaxPmtk(eta./T(i))); 
    title(sprintf('T = %g', T(i)));
    set(gca,'ylim',[0 1]);
end