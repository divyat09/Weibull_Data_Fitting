i=0;
k=0;
n=20;
sum=[0,0];
sum_n=[0,0];
data=zeros([1,n]);
censor=zeros([1,n]);
total=zeros([100,2]);
total_n=zeros([100,2]);

for k=1:100
	for i=1:n
 		data(i)=wblrnd(100,1,1);
	end
	for i=1:n
		if i<=12
			censor(i)=0;
		else
			censor(i)=1;

		end
	end
	data_n=sort(data);  	
	phat=mle(data,'distribution','wbl','censoring',censor);
	phat_n=mle(data_n,'distribution','wbl','censoring',censor);
	total(k,1:2)=phat;
	total_n(k,1:2)=phat_n;
	sum=sum+phat;
	sum_n=sum_n+phat_n;
end
mean=sum/100;
mean_n=sum_n/100;
bias=mean-[100,1];
bias_n=mean_n-[100,1];



 	

		
