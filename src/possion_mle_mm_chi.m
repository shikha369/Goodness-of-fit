clear ;
%population parameter
DiscretePop=load('Discrete.txt');
p=sum(DiscretePop)/1000;
lamda=p;
%sampling data 
indexc = randsample(1:length(DiscretePop), 100);
DiscreteContinous= DiscretePop(indexc);

%sample parameter
Xi=sum(DiscreteContinous)/100;
var=Xi;
samplesd=sqrt(var);

%disp
disp('MLE and MM estimated rate :'); disp(Xi);
disp('MLE and MM estimated var :'); disp(var);

%count frequency of each r.v which denotes #arrival
table=tabulate(DiscretePop);
observed=table(:,2);
Expected=poisspdf(unique(DiscretePop),lamda).*1000;

A= (Expected-observed).^2;
    Chi=A./(Expected);
    Total_score=sum(Chi);
    
    %get plots
dof=size(unique(DiscretePop),1)-1;
% if Total_score less than critical then null accepted.
x = 0:0.2:60;
y = chi2pdf(x,dof);
figure(3);
plot(x,y,'linewidth',2);
hold on;
line([Total_score Total_score],[0 .02],'linewidth',3,'color','b');
hold on;
X_Crit = chi2inv(0.999,dof);
line([X_Crit X_Crit],[0 .02],'linewidth',3,'color','r');
hold on;
disp('.9975');
if(Total_score>X_Crit)
    disp('fail to accept Null Hypo');
else
    disp('fail to reject Null Hypo');
end

X_Crit = chi2inv(0.99,dof);
line([X_Crit X_Crit],[0 .02],'linewidth',3,'color','y');
hold on;
disp('.995');
if(Total_score>X_Crit)
    disp('fail to accept Null Hypo');
else
    disp('fail to reject Null Hypo');
end

X_Crit = chi2inv(0.95,dof);
line([X_Crit X_Crit],[0 .02],'linewidth',3,'color','g');
hold on;
disp('.975');
if(Total_score>X_Crit)
    disp('fail to accept Null Hypo');
else
    disp('fail to reject Null Hypo');
end
xlabel('chi square statistic'), ylabel('pdf value');
legend('chi square Distribution','chi square score','.005 critical region','.01 critical region','.05 critical region') ;
hold off;

%%%%%%%%%%%%%%%%final plots%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%actual plot of data

