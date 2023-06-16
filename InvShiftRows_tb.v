module InvShiftRows_tb();
reg [0:127] state = 128'h876e46a6f24ce78c4d904ad897ecc395;
wire [0:127] original;

InvShiftRows s(.state(state),.original(original));

endmodule 