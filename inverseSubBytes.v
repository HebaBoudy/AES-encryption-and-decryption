module inverseSubBytes(dataIn,dataOut);
input [127:0] dataIn;
output [127:0] dataOut;

Inv_SBox S_inv1(dataIn[7:0],dataOut[7:0]);
Inv_SBox S_inv2(dataIn[15:8],dataOut[15:8]);	
Inv_SBox S_inv3(dataIn[23:16],dataOut[23:16]);
Inv_SBox S_inv4(dataIn[31:24],dataOut[31:24]);

Inv_SBox S_inv5(dataIn[39:32],dataOut[39:32]);
Inv_SBox S_inv6(dataIn[47:40],dataOut[47:40]);
Inv_SBox S_inv7(dataIn[55:48],dataOut[55:48]);
Inv_SBox S_inv8(dataIn[63:56],dataOut[63:56]);

Inv_SBox S_inv9(dataIn[71:64],dataOut[71:64]);
Inv_SBox S_inv10(dataIn[79:72],dataOut[79:72]);
Inv_SBox S_inv11(dataIn[87:80],dataOut[87:80]);
Inv_SBox S_inv12(dataIn[95:88],dataOut[95:88]);

Inv_SBox S_inv13(dataIn[103:96],dataOut[103:96]);
Inv_SBox S_inv14(dataIn[111:104],dataOut[111:104]);
Inv_SBox S_inv15(dataIn[119:112],dataOut[119:112]);
Inv_SBox S_inv16(dataIn[127:120],dataOut[127:120]);	

endmodule 