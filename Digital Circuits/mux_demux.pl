:-include(gates).
:-include(decoders_encoder).
	
%% MULTIPLEXER 2x1								A,B are inputs, S is selector (also input), Z is output
mux_2x1(A,B,S,Z):-
	not(S,S1),
	and(A,S1,I0),
	and(B,S,I1),
	or(I0,I1,Z).


%% MULTIPLEXER 4x1								A,B,C,D are inputs, S0,S1 are selectors (also inputs), Z is output
mux_4x1(A,B,C,D,S0,S1,Z):-
	not(S0,S_0),not(S1,S_1),
	and3(A,S_0,S_1,I0),
	and3(B,S0,S_1,I1),
	and3(C,S_0,S1,I2),
	and3(D,S0,S1,I3),
	or(I0,I1,I_01), or(I2,I3,I_23),
	or(I_01,I_23,Z).


%% MULTIPLEXER 8x1								A-H are inputs, S0,S1,S2 are selectors (also inputs), Z is output
mux_8x1(A,B,C,D,E,F,G,H,S0,S1,S2,Z):-
	mux_4x1(A,B,C,D,S0,S1,Z1),
	mux_4x1(E,F,G,H,S0,S1,Z2),
	mux_2x1(Z1,Z2,S2,Z).


%% DE-MULTIPLEXER 1x2							I is input, S is selector (also input), A,B are output
demux_1x2(I,S,A,B):-
	not(S,S_0),
	and(I,S_0,A),
	and(I,S,B).


%% DE-MULTIPLEXER 1x4							I is input, S0,S1 are selectors (also inputs), A,B,C,D are output
demux_1x4(I,S0,S1,A,B,C,D):-
	decoder_2x4(S0,S1,T0,T1,T2,T3),
	and(I,T0,A),
	and(I,T1,B),
	and(I,T2,C),
	and(I,T3,D).
	
	
%% DE-MULTIPLEXER 1x8							I is input, S0,S1,S2 are selectors (also inputs), O0-O7 are output
demux_1x8(I,S0,S1,S2,O0,O1,O2,O3,O4,O5,O6,O7):-
	decoder_3x8(S0,S1,S2,T0,T1,T2,T3,T4,T5,T6,T7),
	and(I,T0,O0),
	and(I,T1,O1),
	and(I,T2,O2),
	and(I,T3,O3),
	and(I,T4,O4),
	and(I,T5,O5),
	and(I,T6,O6),
	and(I,T7,O7).
