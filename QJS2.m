function v=QJS2(p,x)
    n1=length(p);
    n2=length(x);
    v=zeros(1,n2);
    for j=1:n2
        v(j)=p(1);
        for i=2:n1
            v(j)=x(j)*v(j)+p(i);
        end
    end
end
%p为向量，指的是多项式的系数；并且x也是一个向量