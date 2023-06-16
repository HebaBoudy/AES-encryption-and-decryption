module ShiftRows_tb();
reg [0:127] state = 128'h87ec4a8cf26ec3d84d4c46959790e7a6;
wire [0:127] newstate;
//state = 128'h87ec4a8cf26ec3d84d4c46959790e7a6;

ShiftRows s(.state(state),.newstate(newstate));

endmodule 