function N=Newton1(x,y)
    n=length(x);
    N=zeros(n,n);
    N(:,1)=y;
    for j=2:n
        for i=1:n-j+1
            N(i,j)=(N(i+1,j-1)-N(i,j-1))/(x(i+j-1)-x(i));
        end
    end
end
%输出的N是拟合出的插值多项式 基函数 的系数向量