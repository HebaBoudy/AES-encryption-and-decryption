module Cipher_tb;
reg [127:0]  inData;
wire [0:1407] keyExpansion_output;
wire [127:0] outDataFinal;
reg [0:127] key;

reg [0:191]key2;
wire [0:1663] keyExpansion_output2;

reg [0:255]key3;
wire [0:1919] keyExpansion_output3;


KeyExpansion#(4,10) KeyExpansion_test1(key,keyExpansion_output);
KeyExpansion#(6,12) KeyExpansion_test2(key2,keyExpansion_output2);
KeyExpansion#(8,14) KeyExpansion_test3(key3,keyExpansion_output3);

//Cipher #(4,10)Cipher_tb(inData,keyExpansion_output3,outDataFinal);
//Cipher #(6,12)Cipher_tb(inData,keyExpansion_output3,outDataFinal);
Cipher #(8,14)Cipher_tb(inData,keyExpansion_output3,outDataFinal);

initial begin
	$monitor("start= %H  /tend= %h", inData, outDataFinal);
	inData  = 128'h00112233445566778899aabbccddeeff;
	//key=128'h2b7e151628aed2a6abf7158809cf4f3c;
   key = 128'h000102030405060708090a0b0c0d0e0f;
	key2= 192'h000102030405060708090a0b0c0d0e0f1011121314151617;
	key3=256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
end
endmodule