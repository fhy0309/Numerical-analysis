% bootstrap 以3.19为例
% 通过区间估计方法算出的在置信水平95%下的
% 总体期望置信区间[5.301,5.499]
% 方差置信区间[0.08716,0.2472]
sample = [5.42, 5.29, 5.40, 5.24, 5.58, 5.21, 5.44, 5.49, 5.53];

nBootstrap = 1000;  % bootstrap采样次数
bootstrapMeans = zeros(nBootstrap, 1);
bootstrapVars = zeros(nBootstrap, 1);
n = numel(sample);  % 样本大小

for i = 1:nBootstrap
    bootstrapSample = randsample(sample, n, true);
    bootstrapMeans(i) = mean(bootstrapSample);
    bootstrapVars(i) = var(bootstrapSample);
end

alpha = 0.05;  % 置信水平
meanCI = prctile(bootstrapMeans, [100 * alpha / 2, 100 * (1 - alpha / 2)]);
varCI = prctile(bootstrapVars, [100 * alpha / 2, 100 * (1 - alpha / 2)]);
disp('区间估计结果:');
disp(['总体均值的置信区间: ', num2str(meanCI)]);
disp(['总体方差的置信区间: ', num2str(varCI)]);

