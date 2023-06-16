module AddRoundKey_tb;

reg [127:0] State;
reg [127:0] RoundKey;
wire [127:0] NewState;	


AddRoundKey A (State, RoundKey, NewState);


initial begin
	$monitor("State= %H  /tRoundKey= %h  /tNewState = %h", State, RoundKey, NewState);
	State  = 128'h5468617473206D79204B756E67204675;
	RoundKey = 128'h54776F204F6E65204E696E652054776F;
end
endmodule