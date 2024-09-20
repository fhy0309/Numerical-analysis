%主成分分析1

% Step 1: 数据标准化
data_mean = mean(data);  % 计算每列的均值
data_std = std(data);    % 计算每列的标准差
data_normalized = (data - data_mean) ./ data_std;  % 标准化数据

% Step 2: 计算协方差矩阵
covariance_matrix = cov(data_normalized);  % 计算标准化数据的协方差矩阵

% Step 3: 计算特征值和特征向量
[eigen_vectors, eigen_values] = eig(covariance_matrix);  % 计算协方差矩阵的特征向量和特征值

% Step 4: 选择主成分
principal_components = eigen_vectors(:, end:-1:end-1);  % 提取前两个特征向量作为主成分

% Step 5: 得出主成分的表达式
pc_expression = principal_components.' * data_normalized.';  % 主成分的表达式

% Step 6: 确定缩减变量的数量
explained_variance = cumsum(diag(eigen_values)) / sum(diag(eigen_values));  % 计算解释的方差比例
num_components = find(explained_variance >= 0.95, 1);  % 找到解释方差比例达到95%的主成分数量

% 输出结果
disp('第一和第二主成分的表达式：');
disp(pc_expression);
disp(['可以缩减为 ', num2str(num_components), ' 个新变量来表示完全不丢失信息。']);