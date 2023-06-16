//module InvCipher#(parameter Nk=4,parameter Nr=10)(
//input mosi,
//output miso,
////input reset,
//input CS,
//input clk
//);
//
//
// reg[127:0]   inData;
// reg[Nk*32-1:0]   inKey;
// 
//  wire [0:(128*(Nr+1)-1)] keyExpansion_output;
//  wire [127:0] outDataFinal;
//  integer counterKey=0;
//integer counterOut=0;
//integer counterInData=0;
//
//assign miso= (counterOut<128 &&counterInData>400) ?outDataFinal[counterOut]:1'bZ;
//
//always @(posedge clk)
//begin
//if(CS==0) begin
//
//if(counterInData<=127)
// inData[counterInData]=mosi;
//else
//begin
// inKey[counterKey]=mosi; 
// counterKey=counterKey+1;
// end
//counterInData=counterInData+1;
//end
//end
//
//
//always @(negedge clk) begin
//if(counterInData>400)
//counterOut=counterOut+1;
//
//end
//
// wire [127:0] s_box[Nr:1];
// wire [127:0] m_col[Nr:1];
// wire [127:0] s_row[Nr:1];
// wire [127:0] k_sch[Nr:1];
// wire [127:0] subbytes[Nr:1];
// wire [127:0] outData[Nr:1];
// wire [127:0] state;
// 
//KeyExpansion #(Nk,Nr) kExp (inKey,keyExpansion_output);
//AddRoundKey AddRoundKey_Cipher(inData,keyExpansion_output[(128*(Nr+1)-128)+:128],m_col[Nr]);
//genvar i;
//generate 
//for (i=Nr; i>1 ;i=i-1) begin: forloop
//
//InvShiftRows    iShiftRows_Cipher(m_col[i],s_row[i]);
//
//inverseSubBytes isuBBytes_Cipher(s_row[i],subbytes[i]);
//
//AddRoundKey     iAddRoundKey_Cipher(subbytes[i],keyExpansion_output[(i-1)*128 +: 128],k_sch[i]);/*subbbytes is zzzz*/
//InverseMixColumns iMixColumns_Cipher(k_sch[i],m_col[i-1]);
//
//end
//endgenerate
//InvShiftRows iShiftRows_Cipher(m_col[1],s_row[1]);
//inverseSubBytes isuBBytes_Cipher(s_row[1],subbytes[1]);
//
//AddRoundKey iAddRoundKey_Cipher2(subbytes[1],keyExpansion_output[0:127],outDataFinal);
//endmodule
//
//





module InvCipher#(parameter Nk=4,parameter Nr=10)(
input mosi,
output miso,
//input reset,
input CS,
input clk
);


 reg[127:0]   inData;
 reg[Nk*32-1:0]   inKey;
 
  wire [0:(128*(Nr+1)-1)] keyExpansion_output;
  wire [127:0] outDataFinal;
  integer counterKey=0;
integer counterOut=0;
integer counterInData=0;
integer i = Nr;

assign miso= (counterOut<128 &&counterInData>430 && i<=0) ?outDataFinal[counterOut]:1'bZ;

always @(posedge clk)
begin
if(CS==0) begin

if(counterInData<=127)
 inData[counterInData]=mosi;
else
begin
 inKey[counterKey]=mosi; 
 counterKey=counterKey+1;
 end
counterInData=counterInData+1;
end
end



 wire [127:0] s_box;
 wire [127:0] m_col;
 wire [127:0] s_row;
 wire [127:0] k_sch;
 wire [127:0] subbytes;
 wire [127:0] outData;
 wire [127:0] state;
  reg [127:0] loopbegin;
 wire [127:0] loopend;
 wire [127:0] lasts_row;
 wire [127:0] lasts_box;
 
KeyExpansion #(Nk,Nr) kExp (inKey,keyExpansion_output);
AddRoundKey AddRoundKey_Cipher(inData,keyExpansion_output[(128*(Nr+1)-128)+:128],subbytes);

/***********************************************************/
inverseSubBytes suBBytes_Cipher(loopbegin,s_box);
InvShiftRows ShiftRows_Cipher(s_box,s_row);
AddRoundKey AddRoundKey_Cipher1(s_row,keyExpansion_output[i*128 +: 128],m_col);
InverseMixColumns MixColumns_Cipher(m_col,loopend);
always@(negedge clk)
begin
if(i >0 && counterInData>400) begin
	if(i==Nr)
		loopbegin = subbytes;
else
begin
loopbegin = loopend;
end
i = i-1;
end
else
loopbegin = loopbegin;
if(counterInData>430)
counterOut=counterOut+1;

end
/***********************************************************/
InvShiftRows iShiftRows_Cipher(loopbegin,lasts_row);
inverseSubBytes isuBBytes_Cipher(lasts_row,lasts_box);

AddRoundKey iAddRoundKey_Cipher2(lasts_box,keyExpansion_output[0:127],outDataFinal);
endmodule





//genvar i;
//generate 
//for (i=Nr; i>1 ;i=i-1) begin: forloop
//
//InvShiftRows    iShiftRows_Cipher(m_col[i],s_row[i]);
//
//inverseSubBytes isuBBytes_Cipher(s_row[i],subbytes[i]);
//
//AddRoundKey     iAddRoundKey_Cipher(subbytes[i],keyExpansion_output[(i-1)*128 +: 128],k_sch[i]);/*subbbytes is zzzz*/
//InverseMixColumns iMixColumns_Cipher(k_sch[i],m_col[i-1]);
//
//end
//endgenerate