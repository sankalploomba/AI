:-include(flipflops).

%% FOUR BIT REGISTER							C:Clock, D0-D3 are inputs for data line, P0-P3 are present states for D flip-flop, Q0-Q4 are updated values stored in register
reg(C,D0,D1,D2,D3,P0,P1,P2,P3,Q0,Q1,Q2,Q3):-
	d_ff(C,D0,P0,Q0),
	d_ff(C,D1,P1,Q1),
	d_ff(C,D2,P2,Q2),
	d_ff(C,D3,P3,Q3).

