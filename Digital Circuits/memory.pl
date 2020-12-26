:-include(mux_demux).
:-include(flipflops).

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


