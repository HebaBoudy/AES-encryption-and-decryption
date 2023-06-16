module inverseSubBytes_tb;
reg [127:0] dataIn;
wire[127:0] dataOut;

inverseSubBytes ISB_test(dataIn,dataOut);
initial begin
$monitor("dataIn= %h ,dataOut= %h",dataIn,dataOut);
dataIn=128'h7ad5fda789ef4e272bca100b3d9ff59f;
#10;
dataIn=128'h54d990a16ba09ab596bbf40ea111702f;
#10;
dataIn=128'h3e1c22c0b6fcbf768da85067f6170495;
#10;
dataIn=128'hb458124c68b68a014b99f82e5f15554c;
#10;

end
endmodule
