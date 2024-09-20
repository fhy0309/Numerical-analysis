%聚类

% Step 1: 数据标准化
data_mean = mean(data);  % 计算每列的均值
data_std = std(data);    % 计算每列的标准差
data_normalized = (data - data_mean) ./ data_std;  % 标准化数据

% Step 2: 进行聚类分析
num_clusters = 3;  % 设置聚类的数量
cluster_labels = kmeans(data_normalized, num_clusters);  % 使用k-means算法进行聚类

% 输出结果
disp('聚类结果：');
disp(cluster_labels);