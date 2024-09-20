function v=QJS1(p,x)
    n=length(p);
    v=p(1);
    for i=2:n
        v=x*v+p(i);
    end
end
%p为向量，指的是多项式的系数；x是一个数字
%v=QJS(p,x) w=polyval(p,x)
%polyval(p,x),p为多项式系数。返回此多项式在x处的函数值
