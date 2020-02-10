clear all;
close all;

%population parameter
DiscretePop=load('Discrete.txt');
p=sum(DiscretePop)/1000;

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

% t - test
t_val=t_test(p,Xi,samplesd,100);

