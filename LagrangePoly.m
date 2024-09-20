function L=LagrangePoly(x,y)
    n=length(x);
    L=zeros(1,n);
    for i=1:n
        u=poly(x([1:i-1,i+1:n]));
        %poly函数返回多项式系数向量,系数的顺序是从高次到低次排列的。
        o=prod(x(i)-x([1:i-1,i+1:n]));
        L=L+y(i)*u/o;
    end
end
%这里的x就是插值节点向量
%prod就是乘法
%y是对应的节点函数值向量
%输出的L是拟合出的插值多项式的系数向量