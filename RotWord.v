module RotWord(DataIn,DataOut);
input [31:0] DataIn;
output wire  [31:0] DataOut;
 wire  [7:0]a0;
  wire  [7:0]a1;
   wire  [7:0]a2;
	 wire  [7:0]a3;
	 
assign a0=DataIn[31:23];
assign a1=DataIn[23:16];
assign a2=DataIn[15:8];
assign a3=DataIn[7:0];

assign DataOut={a1,a2,a3,a0};
endmodule 