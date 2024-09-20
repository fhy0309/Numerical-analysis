function [U,x] = gaussElimination(A, b)
    % 高斯消去法求解线性方程组
    % 输入参数：A：系数矩阵,b：常数向量
    % 输出参数：x：解向量
    
    n = size(A, 1); % 方程组的未知数个数
    AugmentedMatrix = [A, b]; % 增广矩阵
    
    % 消元
    for k = 1:n-1
        for i = k+1:n
            factor = AugmentedMatrix(i, k) / AugmentedMatrix(k, k);
            AugmentedMatrix(i, k+1:end) = AugmentedMatrix(i, k+1:end) - factor * AugmentedMatrix(k, k+1:end);
            AugmentedMatrix(i, k) = 0;
        end
    end
    U=AugmentedMatrix(:,1:n);
    % 回代
    x = zeros(n, 1);
    x(n) = AugmentedMatrix(n, n+1) / AugmentedMatrix(n, n);
    for i = n-1:-1:1
        x(i) = (AugmentedMatrix(i, n+1) - AugmentedMatrix(i, i+1:n) * x(i+1:n)) / AugmentedMatrix(i, i);
    end
end