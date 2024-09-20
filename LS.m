function coefficients = LS(x, y, n)
    % 超定方程组思想
    B = zeros(length(x), n+1);
    for j=2:n+1
        B(:,1)=ones(length(x),1);
        for i=1:length(x)
            B(i,j)=x(i)^(j-1);
        end
    end
    B
    coefficients = (B'*B)^(-1) * B' * y';
end