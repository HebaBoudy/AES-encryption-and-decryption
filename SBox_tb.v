module SBox_tb();
reg [7:0] data=8'hff;
	 wire [7:0] dout;
 SBox s(.data(data),.dout(dout));
endmodule 