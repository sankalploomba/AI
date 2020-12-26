:-include(gates).

%% HALF ADDER									X,Y are inputs, S,C are outputs
half_adder(X,Y,S,C):- xor(X,Y,S), and(X,Y,C).


%% FULL ADDER									X,Y,Z are inputs, S,C are outputs
full_adder(X,Y,Z,S,C):-
	xor(X,Y,T1),	%% x^y
	xor(Z,T1,S),	%% S = z^(x^y)
	
	and(T1,Z,T2),	%% z&(x^y)
	and(X,Y,T3),	%% x&y
	or(T3,T2,C).	%% C = ((x&y) | z & (x^y))

%% FOUR BIT ADDER 								A0-A3,B0-B3 are inputs, S0-S4 are outputs (output can have one extra bit)
four_adder(A0,A1,A2,A3,B0,B1,B2,B3,S0,S1,S2,S3,S4):-
	half_adder(A0,B0,S0,C0),
	full_adder(A1,B1,C0,S1,C1),
	full_adder(A2,B2,C1,S2,C2),
	full_adder(A3,B3,C2,S3,S4).
