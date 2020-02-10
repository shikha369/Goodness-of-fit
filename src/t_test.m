function [t_val]=t_test(Population_mean,Sample_mean,Sample_std,Sample_size)
%calculate t value
t_val=(Sample_mean-Population_mean)/(Sample_std/sqrt(Sample_size));

%check for goodness of fit and plot 
DF=Sample_size-1;
t=abs(t_val);
figure(1);
x = -3:0.1:3; y = tpdf(x,DF);
plot(x,y,'linewidth',2);
hold on;
line([t t],[0 .1],'linewidth',3,'color','b');
hold on;
sig_level=0.9975;
crit_val=tinv(sig_level,DF);
line([crit_val crit_val],[0 .1],'linewidth',3,'color','r');
hold on;
disp(sig_level)
if(t>crit_val)
    disp('fail to accept Null Hypo');
else
    disp('fail to reject Null Hypo');
end

sig_level=0.995;
crit_val=tinv(sig_level,DF);
line([crit_val crit_val],[0 .1],'linewidth',3,'color','y');
hold on;
disp(sig_level)
if(t>crit_val)
    disp('fail to accept Null Hypo');
else
    disp('fail to reject Null Hypo');
end
sig_level=0.975;
crit_val=tinv(sig_level,DF);
line([crit_val crit_val],[0 .1],'linewidth',3,'color','g');
hold on;
disp(sig_level)
if(t>crit_val)
    disp('fail to accept Null Hypo');
else
    disp('fail to reject Null Hypo');
end

xlabel('t statistic'), ylabel('pdf value')
legend('t Distribution','t score','.0025 critical region','.005 critical region','.025 critical region') 

end