% 三弯矩法 第二类边界条件
function m = Three2(x, y, ddy)
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
    N=Newton1(x,y);
    d=zeros(1,n2);
    for i=1:n2
        d(1,i)=6*N(i,n2);
    end
    b=zeros(n2,1);
    b(1,1)=d(1,1)-miu(1,1)*ddy(1,1);
    b(n2,1)=d(1,n2)-lambda(1,n2)*ddy(1,2);
    A = diag(2 * ones(n2, 1));
    A(1,2)=lambda(1,1);
    A(n2,n2-1)=miu(1,n2);
    for c1=2:n2-1
        b(c1,1)=g(1,c1);
        A(c1,c1-1)=miu(1,c1);
        A(c1,c1+1)=lambda(1,c1);
    end
    % 解线性方程组
    m=A \ b; %(n2,1)
    % 计算插值多项式的化简系数向量
end