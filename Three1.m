% 三转角法 第一类边界条件
function T = Three1(x, y, dy)
    n1=length(x)-1;
    h=zeros(1,n1);
    for i=1:n1
        h(1,i)=x(1,i+1)-x(1,i);
    end
    n2=length(x)-2;
    lambda=zeros(1,n2);
    miu=zeros(1,n2);
    for j=1:n2
        lambda(1,j)=h(1,j+1)/(h(1,j)+h(1,j+1));
        miu(1,j)=h(1,j)/(h(1,j)+h(1,j+1));
    end
    f=zeros(1,n1);
    for k=1:n1
        f(1,k)= (y(1,k+1)-y(1,k)) / h(1,k);
    end
    g=zeros(1,n2);
    for l=1:n2
        g(1,l)=3*(lambda(1,l)*f(1,l) + miu(1,l)*f(1,l+1));
    end
    b=zeros(n2,1);
    b(1,1)=g(1,1)-lambda(1,1)*dy(1,1);
    b(n2,1)=g(1,n2)-miu(1,n2)*dy(1,2);
    A = diag(2 * ones(n2, 1));
    A(1,2)=miu(1,1);
    A(n2,n2-1)=lambda(1,n2);
    for c1=2:n2-1
        b(c1,1)=g(1,c1);
        A(c1,c1-1)=lambda(1,c1);
        A(c1,c1+1)=miu(1,c1);
    end
    % 解线性方程组
    m=A \ b; %(n2,1)
    % 计算插值多项式的化简系数向量
    T = zeros(n1, 4);
    m=[dy(1,1);m];
    m=[m;dy(1,2)];
    syms t;
    for c2=1:n1
        fun = y(1,c2)/h(1,c2)^3 * (h(1,c2) + 2*(t-x(1,c2))) * (t-x(1,c2+1))^2 ...
            + y(1,c2+1)/h(1,c2)^3 * (h(1,c2) + 2*(x(1,c2+1)-t)) * (t-x(1,c2))^2 ...
            + m(c2,1)/h(1,c2)^2 * (t-x(1,c2)) * (t-x(1,c2+1))^2 ...
            + m(c2+1,1)/h(1,c2)^2 * (t-x(1,c2+1)) * (t-x(1,c2))^2;
        T(c2,:) = coeffs(fun, t);
    end
end