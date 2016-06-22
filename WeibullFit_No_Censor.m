%defining variables
N=10;
n=10;
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


%For the case NO Censoring
%Repeating the experiment to get better results
for k=1:N

	%Generating Sample Data
	for i=1:n
		data(i)=exprnd(n,1,1);
	end

	
	%Plotting graph to  determine beta graphically
	data=sort(data);
	for i=1:n
		t=data(i);
		sum1=sum1+(t.^x)*log(t);
		sum2=sum2+t.^x;
		sum3=sum3+log(t);
	end
	
	y1=1./x;
	y2= (sum1)./(sum2) - (sum3/n); 
	%plot(x,y1,x,y2);
	

	%Calculating Value of Beta

	%Mathematical equation to solve and find beta	
	syms z;
	f= @(z)(( sum((data(1):data(n)).^z).*(log(data(1):data(n)))/ sum((data(1):data(n)).^z)) - (sum3/n)-(1/z)); 	
	beta(k)=fsolve(f,3.);
	mean_beta=mean_beta+beta(k);


	%Calculating theta
	theta(k)= (sum((data(1):data(n)).^beta(k))/n)^(1/beta(k));
	mean_theta=mean_theta+theta(k);
end


%Final Value
mean_theta=mean_theta/N;
mean_beta=mean_beta/N;




%Determining that how goodness of fit



