% %Question interpretation :
% 1000 Experiments
% Each Experiment has 13 trails of coin toss
% Each Discrete value gives prob of success in the corresponding experiment.
clear all;
close all;

%population parameter
DiscretePop=load('Discrete.txt');
Pp=DiscretePop/13;
meanSuc=sum(Pp)/1000;
varSuc=((Pp-repmat(meanSuc,1000,1)).^ 2)/(1000);
varSuc=sum(varSuc);

%sampling data 
indexc = randsample(1:length(DiscretePop), 100);
SampleDiscretePop= DiscretePop(indexc);

%sample parameter
Ps=SampleDiscretePop/13;
meanSampleSuc=sum(Ps)/100;
varSampleSuc=((Ps-repmat(meanSampleSuc,100,1)).^ 2)/(100);
varSampleSuc=sum(varSampleSuc);
samplesd=sqrt(varSampleSuc);

%disp
disp('MLE and MM estimated Success Prob :'); disp(meanSampleSuc);
disp('MLE and MM estimated Success Var :'); disp(varSampleSuc);

% t - test
t_val=t_test(meanSuc,meanSampleSuc,samplesd,100);

