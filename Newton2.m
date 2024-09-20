function N=Newton2(x,y)
    N_base=Newton1(x,y);
    n=length(x);
    N=zeros(1,n);
    N(1,n)=N_base(1,1);
    for k=1:n-1
        u=poly(x(1:k));
        u=[zeros(1, n - numel(u)), u];
        N=N+N_base(1,k+1)*u;
    end
end
%输出的N是拟合出的插值多项式（非基函数而是普通函数） 的系数向量