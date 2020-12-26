:-include(gates).

%% DECODER 2x4									A,B are inputs, D0,D1,D2,D3 are 4 outputs
decoder_2x4(A,B,D0,D1,D2,D3):-
	not(A,A_0), not(B,B_0), 
	and(A_0,B_0,D0),
	and(A_0,B,D1),
	and(A,B_0,D2),
	and(A,B,D3).


%% DECODER 3x8									A,B,C are inputs, D0-D7 are 8 outputs
decoder_3x8(A,B,C,D0,D1,D2,D3,D4,D5,D6,D7):-
	not(A,A_0), not(B,B_0), not(C,C_0),
	and3(A_0,B_0,C_0,D0),
	and3(A_0,B_0,C,D1),
	and3(A_0,B,C_0,D2),
	and3(A_0,B,C,D3),
	and3(A,B_0,C_0,D4),
	and3(A,B_0,C,D5),
	and3(A,B,C_0,D6),
	and3(A,B,C,D7).
	
	
%% ENCODER 8x3									D0-D7 are 8 inputs, A,B,C are outputs 
encoder_8x3(_,D1,D2,D3,D4,D5,D6,D7,A,B,C):-
	or4(D1,D3,D5,D7,A),				
	or4(D2,D3,D6,D7,B), 
	or4(D4,D5,D6,D7,C).
	
