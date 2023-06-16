module wrapper_256(clk,checkOut);
 
 output reg checkOut; 
 input wire clk; 

 
 reg [127:0] DataIn=128'h00112233445566778899aabbccddeeff;
  reg [127:0] temp=128'h00112233445566778899aabbccddeeff;
 
 
 wire [255:0] Key256=256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
 wire [127:0] expected_cipher_256  = 128'h8ea2b7ca516745bfeafc49904b496089;
 reg [127:0] output_cipher_256;

 
 integer counterOut=0;
 integer counterInData=0;
 integer counterKey=0;
 
 integer counterInData_2=0;
 integer counterKey_2=0;
 reg correct_enc=0;
  reg correct_dec=0;
 wire mosi;
 wire miso;
 assign mosi =(counterInData<128)?DataIn[counterInData]:Key256[counterKey];
 

  reg CS_Cipher=0;
  reg CS_InvCipher=1;
  
 always@(posedge clk )//send
 begin
if(CS_Cipher==0&&CS_InvCipher==1)
 begin
		counterInData=counterInData+1;
		if(counterInData>128)
		counterKey=counterKey+1;
		
		
		if(counterOut>127)
		
		begin
			CS_InvCipher=0;
			CS_Cipher=1;
			DataIn=output_cipher_256;
			counterKey=0;
			counterInData=0;
			
			if(expected_cipher_256==output_cipher_256)
			correct_enc=1;
			
			
			end
		end
else
		begin
		if(temp==output_cipher_256)
			correct_dec=1;
		counterInData=counterInData+1;
		if(counterInData>128)
		counterKey=counterKey+1;
		
		
		end
 end
 
 
 always@(negedge clk)
 begin
 if(counterInData==0)
 counterOut=0;

 if(counterKey>=303)
 begin
 output_cipher_256[counterOut]=miso;
 counterOut=counterOut+1;
 end
 end
 
 

 
	Cipher #(8,14)Cipher_256(mosi,miso,CS_Cipher,clk);
	InvCipher #(8,14)InvCipher_256(mosi,miso,CS_InvCipher,clk);
	
	
	

always @(posedge clk) begin

if (correct_enc==1&&correct_dec==1) 
checkOut=1'b1;
else 
checkOut=1'b0;
end

endmodule 