N=20;
r=12;
theta=0;
beta=0;
data=[1,N];
x=[0:0.1:2];
i=1;
y1=1./x;
sum1=0;
sum2=0;
sum3=0;
k=0;
mean_beta=0;
mean_theta=0;

%Generating Sample Data
for i=1:N
	data(i)=wblrnd(10,1,1);
end

for(k=1;k<=N;k++){

	
	%Calculating beta
	data=sort(data);
	for i=1:r
		t=data(i);
		sum1=sum1+(t.^x)*log(t);
		sum2=sum2+t.^x;
		sum3=sum3+log(t);
	end
	c=data(r);
	y2= ((N-r)*log(c)*(c.^x)+sum1)./((N-r)*(c.^x)+sum2) - (sum3/r); 
	plot(x,y1,x,y2);
	%beta=intersection(x,y1,x,y2);
	beta=fzero(y2-y1,0);
	mean_beta=mean_beta+beta;

	%Calculating theta
	theta= (1.*(sum2/N))^(1/beta);
	mean_theta=mean_theta+theta;
}

mean_theta=mean_theta/N;
mean_beta=mean_beta/N;

%Determining that how goodness of fit



