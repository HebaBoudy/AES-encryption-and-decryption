module SubWord(DataIn,DataOut);

 input [31:0] DataIn;
 output wire  [31:0] DataOut;
 
 wire  [7:0]SubstitutedByte1;
  wire  [7:0]SubstitutedByte2;
   wire  [7:0]SubstitutedByte3;
	 wire  [7:0]SubstitutedByte4;
	 
 
 SBox s1(DataIn[7:0],SubstitutedByte1);
 SBox s2(DataIn[15:8],SubstitutedByte2); 
 SBox s3(DataIn[23:16],SubstitutedByte3);
 SBox s4(DataIn[31:24],SubstitutedByte4);
 
 assign DataOut={SubstitutedByte4,SubstitutedByte3,SubstitutedByte2,SubstitutedByte1};
 
 
 
 
 endmodule
	 