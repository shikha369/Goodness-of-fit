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
svar=((SampleContinous-repmat(Xi,100,1)).^ 2)/(100-1);
svar=sum(svar);
samplesd=sqrt(svar);

disp('MM estimated mean : ');disp(Xi);
disp('MM estimated variance : ');disp(svar);

M1=Xi;
C1=svar;

alpham=M1*((M1*(1-M1)/C1)-1);
betam=(1-M1)*((M1*(1-M1)/C1)-1);

disp('MEthod of Moment estimated alpha : ');disp(alpham);
disp('MEthod of Moment estimated beta : ');disp(betam);

%t -test
t_val=t_test(p,Xi,samplesd,100);
