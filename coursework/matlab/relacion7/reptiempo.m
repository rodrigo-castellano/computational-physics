

%programa que mira que rep es mas eficiente
c=1:1:10000;
tic
[a1]=fibo2(c);
disp('t1');
t=toc

tic
[a2]=fibo3(c);
disp('t2');
t2=toc


