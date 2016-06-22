N=20;
r=12;
i=0;
for  i=1:20
    data(i)=exprnd(20,1,1);
end
c=data(r);
f= @(z)(((N-r)*log(c)*(c^z)+ sum((data(1):data(r)).^z).*(log(data(1):data(r))))/((N-r)*(c^z)+ sum((data(1):data(r)).^z)) - ((sum(log(data(1):data(20))))/r)-(1/z)); 
beta=fsolve(f,1.)

