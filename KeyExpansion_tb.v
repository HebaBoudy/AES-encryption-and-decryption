module KeyExpansion_tb;
reg [0:127] key;
wire [0:1407] outputKey;

reg [0:191]key2;
wire [0:1663]outputKey2;

reg [0:255]key3;
wire [0:1919]outputKey3;

KeyExpansion KeyExpansion_test(key,outputKey);
KeyExpansion#(6,12) KeyExpansion_test2(key2,outputKey2);
KeyExpansion#(8,14) KeyExpansion_test3(key3,outputKey3);
initial begin
$monitor("k= %h , out= %h",key3,outputKey3);
key=128'h2b7e151628aed2a6abf7158809cf4f3c;
key2=192'h8e73b0f7da0e6452c810f32b809079e562f8ead2522c6b7b;
key3=256'h603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4;

end

endmodule 