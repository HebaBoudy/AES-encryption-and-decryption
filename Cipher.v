//module Cipher#(parameter Nk=4,parameter Nr=10)(
//input mosi,
//output miso,
////input reset,
//input CS,
//input clk
//);
//
//reg  [127:0]  inData;
//reg [(Nk*32)-1:0] inKey;
//wire  [0:(128*(Nr+1)-1)] keyExpansion_output;
//wire [127:0] outDataFinal;
//integer counterKey=0;
//
//integer counterOut=0;
//integer counterInData=0;
//
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
//
// wire [127:0] s_box[1:Nr];
// wire [127:0] m_col[1:Nr];
// wire [127:0] s_row[1:Nr];
// wire [127:0] k_sch;
// wire [127:0] subbytes[1:Nr];
// wire [127:0] outData[1:Nr];
// wire [127:0] state;
// reg  [127:0] loopbegin;
// reg  [127:0] loopend;
// 
//
//KeyExpansion #(Nk,Nr) kExp (inKey,keyExpansion_output);
//AddRoundKey AddRoundKey_Cipher(inData,keyExpansion_output[0:127],subbytes[1]);
///********************************************/
//genvar i;
//generate 
//for (i=1; i<Nr ;i=i+1) begin: forloop
//subBytes suBBytes_Cipher(subbytes[i],s_box[i]);
//ShiftRows ShiftRows_Cipher(s_box[i],s_row[i]);
//MixColumns MixColumns_Cipher(s_row[i],m_col[i]);
//AddRoundKey AddRoundKey_Cipher(m_col[i],keyExpansion_output[i*128 +: 128],subbytes[i+1]);
//end
//endgenerate
///********************************************/
//subBytes suBBytes_Cipher(subbytes[Nr],s_box[Nr]);
//ShiftRows ShiftRows_Cipher(s_box[Nr],s_row[Nr]);
//AddRoundKey AddRoundKey_Cipher2(s_row[Nr],keyExpansion_output[(128*(Nr+1)-128)+:128],outDataFinal);
//
//endmodule 
//
//
//
//





module Cipher#(parameter Nk=4,parameter Nr=10)(
input mosi,
output miso,
//input reset,
input CS,
input clk
);

reg  [127:0]  inData;
reg [(Nk*32)-1:0] inKey;
wire  [0:(128*(Nr+1)-1)] keyExpansion_output;
wire [127:0] outDataFinal;
integer counterKey=0;

integer counterOut=0;
integer counterInData=0;
integer i = 0;


assign miso= (counterOut<128 &&counterInData>430 && i>=Nr) ?outDataFinal[counterOut]:1'bZ;

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

 wire [127:0] lasts_row;
 wire [127:0] lasts_box;
 wire [127:0] s_box;
 wire [127:0] m_col;
 wire [127:0] s_row;
 wire [127:0] k_sch;
 wire [127:0] subbytes;
 wire [127:0] outData;
 wire [127:0] state;
 reg  [127:0] loopbegin;
 wire [127:0] loopend;

 

KeyExpansion #(Nk,Nr) kExp (inKey,keyExpansion_output);
AddRoundKey AddRoundKey_Cipher(inData,keyExpansion_output[0:127],subbytes);
/********************************************/
subBytes suBBytes_Cipher(loopbegin,s_box);
ShiftRows ShiftRows_Cipher(s_box,s_row);
MixColumns MixColumns_Cipher(s_row,m_col);
AddRoundKey AddRoundKey_Cipher1(m_col,keyExpansion_output[i*128 +: 128],loopend);
//assign subbytes[i]=outData[i];
always@(negedge clk)
begin
if(i <Nr && counterInData>400) begin
	if(i==0)
		loopbegin = subbytes;
else
begin
loopbegin = loopend;
end
i = i+1;
end
else
loopbegin = loopbegin;
if(counterInData>430)
counterOut=counterOut+1;

end

/********************************************/
//genvar i;
//generate 
//for (i=1; i<Nr ;i=i+1) begin: forloop
//subBytes suBBytes_Cipher(subbytes[i],s_box[i]);
//ShiftRows ShiftRows_Cipher(s_box[i],s_row[i]);
//MixColumns MixColumns_Cipher(s_row[i],m_col[i]);
//AddRoundKey AddRoundKey_Cipher(m_col[i],keyExpansion_output[i*128 +: 128],subbytes[i+1]);
//end
//endgenerate
/********************************************/
subBytes suBBytes_Cipher1(loopbegin,lasts_box);
ShiftRows ShiftRows_Cipher1(lasts_box,lasts_row);
AddRoundKey AddRoundKey_Cipher2(lasts_row,keyExpansion_output[(128*(Nr+1)-128)+:128],outDataFinal);

endmodule 


