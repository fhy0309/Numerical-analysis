function N=Newton3(x,y)
    n=length(x);
    N_base=zeros(n,n);
    N_base(:,1)=y;
    for j=2:n
        for i=1:n-j+1
            N_base(i,j)=N_base(i+1,j-1)-N_base(i,j-1);
        end
    end
    %分隔
    N=zeros(1,n);
    N(1,n)=N_base(1,1);
    t=0:1:n-1;
    for k=1:n-1
        u=poly(t(1:k));
        u=[zeros(1, n - numel(u)), u];
        N=N+N_base(1,k+1)*u/(factorial(k));
    end
end
% 牛顿前插
% polyval(v,1.5)
% 输出的N是拟合出的插值多项式关于t（非基函数而是普通函数） 的系数向量