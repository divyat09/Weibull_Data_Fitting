%defining variables
N=5;
n=20;
r=12;
theta=[1,N];
beta=[1,N];
data=[1,n];
x=[0:0.1:2];
i=1;
sum1=0;
sum2=0;
sum3=0;
k=0;
mean_beta=0;
mean_theta=0;


%For the case TYPE 2 Censoring
%Repeating the experiment to get better results
for k=1:N

	%Generating Sample Data
	for i=1:n
		data(i)=exprnd(n,1,1);
	end

	
	%Plotting graph to  determine beta graphically
	data=sort(data);
	for i=1:r
		t=data(i);
		sum1=sum1+(t.^x)*log(t);
		sum2=sum2+t.^x;
		sum3=sum3+log(t);
	end
	c=data(r);
	y1=1./x;
	y2= ((n-r)*log(c)*(c.^x)+sum1)./((n-r)*(c.^x)+sum2) - (sum3/r); 
	%plot(x,y1,x,y2);
	

	%Calculating Value of Beta
	c=data(r);
	%Mathematical equation to solve and find beta	
	f= @(z)(((n-r)*log(c)*(c^z)+ sum((data(1):data(r)).^z).*(log(data(1):data(r))))/((n-r)*(c^z)+ sum((data(1):data(r)).^z)) - (sum3/r)-(1/z)); 
	
	beta(k)=fsolve(f,1.);
	mean_beta=mean_beta+beta(k);


	%Calculating theta
	theta(k)= (sum((data(1):data(r)).^beta(k))/n)^(1/beta(k));
	mean_theta=mean_theta+theta(k);
end


%Final Value
mean_theta=mean_theta/N;
mean_beta=mean_beta/N;



%Determining that how goodness of fit



