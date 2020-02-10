clear all;
close all;

%population parameter
ContinousPop=load('Continous.txt');
p=sum(ContinousPop)/1000;
pvar=((ContinousPop-repmat(p,1000,1)).^ 2)/(1000-1);
pvar=sum(pvar);
popsd=sqrt(pvar);


%sampling data 
indexc = randsample(1:length(ContinousPop), 100);
SampleContinous= ContinousPop(indexc);

%sample parameter
Xi=sum(SampleContinous)/100;
svar=((SampleContinous-repmat(Xi,100,1)).^ 2)/100;
svar=sum(svar);
samplesd=sqrt(svar);
disp('MLE estimated mean : ');disp(Xi);
disp('MLE estimated variance : ');disp(svar);

% data binning
nbins =40;
binEdges = linspace(min(ContinousPop),max(ContinousPop),nbins);
aj = binEdges(1:end);     %# bins lower edge
bj = binEdges(2:end);       %# bins upper edge
bj(nbins)=max(ContinousPop)+.01;
Observed = histc(ContinousPop,binEdges);

%get expected using Trapezoidal Rule
% Expected=[];
for i=1:nbins
    
    x = aj(i):.0001:bj(i);
    y=normpdf(x,p,sqrt(pvar));
    
    area(i) = trapz(x,y);
    Expected(i)=area(i)*1000;
    
  
end
T_area=sum(area);
%chi-test

A= (Expected-Observed').^2;
    Chi=A./(Expected);
    Total_score=sum(Chi);
    
    %get plots
dof=nbins-1;
% if Total_score less than critical then null accepted.
x = 0:0.2:60;
y = chi2pdf(x,dof);
figure(3);
plot(x,y);
hold on;
line([Total_score Total_score],[0 .02],'linewidth',3,'color','b');
hold on;
X_Crit = chi2inv(0.995,dof);
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

