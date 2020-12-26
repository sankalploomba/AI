:-include(file).
:-include(flipflops).


%% FOUR BIT ADDER 										A0-A3,B0-B3 are inputs, S0-S4 are outputs (output can have one extra bit)
four_adder(A0,A1,A2,A3,B0,B1,B2,B3,S0,S1,S2,S3,S4):-
	half_adder(A0,B0,S0,C0),
	full_adder(A1,B1,C0,S1,C1),
	full_adder(A2,B2,C1,S2,C2),
	full_adder(A3,B3,C2,S3,S4).


%% FOUR BIT REGISTER							C:Clock, D0-D3 are inputs for data line, P0-P3 are present states for D flip-flop, Q0-Q4 are updated values stored in register
reg(C,D0,D1,D2,D3,P0,P1,P2,P3,Q0,Q1,Q2,Q3):-
	d_ff(C,D0,P0,Q0),
	d_ff(C,D1,P1,Q1),
	d_ff(C,D2,P2,Q2),
	d_ff(C,D3,P3,Q3).


%% FOUR-BIT RAM 								C:Clock, I is input, A0,A1 are the 2 bits of address, P0-P3 are present states for D flip-flop, O is output
ram(C,I,A0,A1,P0,P1,P2,P3,O):-
	demux_1x4(1,A0,A1,S0,S1,S2,S3),
	mux_2x1(P0,I,S0,D0),
	mux_2x1(P1,I,S1,D1),
	mux_2x1(P2,I,S2,D2),
	mux_2x1(P3,I,S3,D3),
	d_ff(C,D0,P0,Q0),
	d_ff(C,D1,P1,Q1),
	d_ff(C,D2,P2,Q2),
	d_ff(C,D3,P3,Q3),
	mux_4x1(Q0,Q1,Q2,Q3,A0,A1,O).


