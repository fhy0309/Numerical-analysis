function H=Hermite(x,y,dy)
    n = length(x);
    syms t;
    L = sym('L', [n, 1]);%创建一个符号向量 L，用于存储拉格朗日插值基函数
    polynomial = sym(0);%初始化一个符号变量 polynomial，用于表示埃尔米特插值多项式
    
    for i = 1:n % 构建拉格朗日插值基函数
        L(i) = 1;
        for j = 1:n
            if j ~= i
                L(i) = L(i) * (t - x(j)) / (x(i) - x(j));
            end
        end
        % 构建埃尔米特插值多项式
        polynomial = polynomial + (1 - 2 * (t - x(i)) * subs(diff(L(i), t), t, x(i))) * L(i)^2 * y(i) ...
        + (t - x(i)) * L(i)^2 * dy(i); %计算在x(i)处的导数值求和
        %subs是符号计算工具箱中的一个函数，用于替换符号表达式中的变量或数值
    end
    H = coeffs(polynomial, t);
end