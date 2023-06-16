module AddRoundKey(State, RoundKey, NewState);

input  [127:0] State;
input  [0:127] RoundKey;
output [127:0] NewState;


assign NewState = RoundKey ^ State;
 
endmodule