function TSerror()
    % 区间平分k次 复合梯形和辛普森误差比较
    % 函数 f(x) = x^4 和 g(x) = 1 / (1 + 25x^2)
    f = @(x) x.^4;
    g = @(x) 1 ./ (1 + 25 * x.^2);

    % 取 n = 2^k, 0 <= k <= 15
    k_values = 0:15;
    n_values = 2.^k_values;
    
    % 初始化结果矩阵
    result_f_trapezoid = zeros(size(n_values));
    result_g_trapezoid = zeros(size(n_values));
    result_f_simpson = zeros(size(n_values));
    result_g_simpson = zeros(size(n_values));
    
    % 计算定积分近似值
    for i = 1:length(n_values)
        n = n_values(i);
        x = linspace(-1, 1, n+1);
        h = x(2) - x(1);
        
        % 复合梯形公式
        result_f_trapezoid(i) = h/2 * (f(x(1)) + 2 * sum(f(x(2:n))) + f(x(n+1)));
        result_g_trapezoid(i) = h/2 * (g(x(1)) + 2 * sum(g(x(2:n))) + g(x(n+1)));
        
        % 复合辛普森公式
        result_f_simpson(i) = h/6 * (f(x(1)) + 2 * sum(f(x(2:n))) + f(x(n+1)) + 4 * sum(f(x(1:n)+h./2)));
        result_g_simpson(i) = h/6 * (g(x(1)) + 2 * sum(g(x(2:n))) + g(x(n+1)) + 4 * sum(g(x(1:n)+h./2)));
    end
    
    % 计算误差
    error_f_trapezoid = abs(result_f_trapezoid - 0.40000);
    error_g_trapezoid = abs(result_g_trapezoid - 0.54936);
    error_f_simpson = abs(result_f_simpson - 0.40000);
    error_g_simpson = abs(result_g_simpson - 0.54936);
    
    % 绘制误差随 k 增加而变化的图表
    figure;
    subplot(2, 1, 1);
    semilogy(k_values, error_f_trapezoid, 'o-', k_values, error_f_simpson, 'o-');
    xlabel('k');
    ylabel('Error');
    title('Error of x^4');
    legend('Composite Trapezoid', 'Composite Simpson');
    grid on;
    subplot(2, 1, 2);
    semilogy(k_values, error_g_trapezoid, 'o-', k_values, error_g_simpson, 'o-');
    xlabel('k');
    ylabel('Error');
    title('Error of 1 / (1 + 25x^2)');
    legend('Composite Trapezoid', 'Composite Simpson');
    grid on;
end