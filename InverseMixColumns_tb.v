module InverseMixColumns_tb;
reg[127:0] stateIn;
wire [127:0] stateOut;

InverseMixColumns invMixTest(stateIn,stateOut);

initial begin
$monitor("State In= %H , State Out= %h",stateIn,stateOut);

stateIn=128'hafb73eeb1cd1b85162280f27fb20d585;
#10;
stateIn= 128'h88ec930ef5e7e4b6cc32f4c906d29414 ;
#10;
stateIn=128'ha906b254968af4e9b4bdb2d2f0c44336 ;
#10;
stateIn=128'h7255dad30fb80310e00d6c6b40d0527c;
#10;
end
endmodule