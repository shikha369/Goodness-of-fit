clear all;
close all;

%population parameter
ContinousPop=load('Continous.txt');
p=sum(ContinousPop)/1000;

%sampling data 
indexc = randsample(1:length(ContinousPop), 100);
SampleContinous= ContinousPop(indexc);

%sample parameter
Xi=sum(SampleContinous)/100;
svar=((SampleContinous-repmat(Xi,100,1)).^ 2)/100;
svar1=((SampleContinous-repmat(Xi,100,1)).^ 2)/99;
svar=sum(svar);
svar1=sum(svar1);
samplesd=sqrt(svar);

disp('MLE estimated mean : ');disp(Xi);
disp('MLE estimated variance : ');disp(svar);

parameter_beta=mle(ContinousPop,'distribution','beta');
alpha=parameter_beta(1);
beta=parameter_beta(2);
disp('the estimated parameters are :');
disp(parameter_beta);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
M1=Xi;
C1=svar1;

alpham=M1*((M1*(1-M1)/C1)-1);
betam=(1-M1)*((M1*(1-M1)/C1)-1);
disp('the mm estimated parameters are :');
disp(alpham);
disp(betam);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%t-test
t_val=t_test(p,Xi,samplesd,100);
