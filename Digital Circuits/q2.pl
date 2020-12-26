s(X,N):-						%% X is the percentage input, N is output in no. of days
	N is ceil(log10(X*29052.6315)/log10(3)).


d(X,N):- 						%% X is the percentage input, N is output in no. of days
	N is ceil(log10(X*210000)/log10(21)).			 	
			  

sn(X,I):- 						%% X is the percentage input, I is the initialization variable which has to be 0 always, we get the output as count of days
	PR is (X/100)*20000000, 
	Z1 is 5*(4**I), 
	Z2 is 5*(6**I), 
	Z3 is 5*(8**I), 
	Z4 is 5*(10**I), 
	S is Z1+Z2+Z3+Z4, 
	I1 is I+1, 
	writeln(day: I), 
	S < PR, 
	sn(X,I1).