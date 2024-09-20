%主成分分析

% Step 1: 数据标准化
data_mean = mean(data);  % 计算每列的均值
data_std = std(data);    % 计算每列的标准差
data_normalized = (data - data_mean) ./ data_std;  % 标准化数据

% Step 2: 计算协方差矩阵
covariance_matrix = cov(data_normalized);  % 计算标准化数据的协方差矩阵

% Step 3: 计算特征值和特征向量
[eigen_vectors, eigen_values] = eig(covariance_matrix);  % 计算协方差矩阵的特征向量和特征值

% Step 4: 提取前四个主成分
principal_components = eigen_vectors(:, end:-1:end-3);  % 提取前四个特征向量作为主成分

% Step 5: 计算特征值贡献率和累积贡献率
total_variance = sum(diag(eigen_values));  % 总方差
explained_variance = diag(eigen_values) / total_variance;  % 解释的方差贡献率

% 输出结果
disp('前四个主成分')
disp('特征值：')
eigen_values = [eigen_values(9, 9), eigen_values(8, 8), eigen_values(7, 7), eigen_values(6, 6)];
disp(eigen_values)
disp('贡献率：')
explained_variance = (explained_variance(end:-1:end-3))';
disp(explained_variance)
disp('累积贡献率：')
cumulative_variance = zeros(1,4);
for i=1:4
    for j=1:i
    cumulative_variance(1,i)=cumulative_variance(1,i)+explained_variance(1,j);
    end
end
disp(cumulative_variance)